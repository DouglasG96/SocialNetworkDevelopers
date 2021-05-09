<template>
  <q-layout>
    <q-page-container>
      <q-page class="flex bg-image flex-center">
        <q-card
          style="opacity:0.9"
          v-bind:style="$q.screen.lt.sm ? { width: '85%' } : { width: '75%' }"
          class="q-mt-md q-mb-md"
        >
          <div class="q-mt-sm">
            <q-card-section>
              <img
                src="../assets/logo.png"
                width="100"
                height="100"
                class="absolute-center shadow-10"
              />

              <!-- <q-avatar size="80px" class="absolute-center shadow-10">
                <img src="profile.svg" />
              </q-avatar>-->
            </q-card-section>
          </div>
          <q-card-section>
            <div class="text-center q-pt-lg">
              <div class="col text-h6 ellipsis">Registrate</div>
            </div>
          </q-card-section>
          <q-card-section>
            <q-form
              ref="formRegister"
              autocomplete="off"
              class="q-pa-md"
              @submit.prevent="register"
            >
              <q-select
                filled
                v-model="rol"
                :options="options"
                label="que quieres hacer"
                :rules="rules.required"
              />
              <q-input
                filled
                v-model="name"
                label="Nombres"
                lazy-rules
                :rules="rules.required"
                class="text-lowercase"
              />
              <q-input
                filled
                v-model="lastName"
                label="Apellidos"
                lazy-rules
                :rules="rules.required"
                class="text-lowercase"
              />

              <q-input
                filled
                ref="dui"
                v-model="dui"
                label="dui / sin guión"
                lazy-rules
                :rules="rules.requiredDui"
                mask="#########"
              />
              <q-input
                filled
                v-model="nit"
                label="nit / sin guiones"
                lazy-rules
                :rules="rules.requiredNit"
                mask="##############"
              />

              <q-input
                filled
                v-model="phone"
                label="telefono / sin guión"
                lazy-rules
                :rules="rules.required"
                mask="########"
              />
              <q-input
                ref="correo"
                filled
                type="email"
                v-model="email"
                label="correo"
                lazy-rules
                :rules="rules.requiredEmail"
                class="text-lowercase"
              />
              <q-input
                type="password"
                filled
                v-model="password"
                label="contraseña"
                lazy-rules
                :rules="rules.requiredPaswword"
              />

              <div class="row">
                <div class="col-6 text-center">
                  <q-btn label="Registrarse" type="submit" color="positive" />
                </div>
                <div class="col-6">
                  <q-btn label="Login" to="/Login" color="secondary" class="q-ml-sm" />
                </div>
              </div>
            </q-form>
          </q-card-section>
        </q-card>
      </q-page>
    </q-page-container>
  </q-layout>
</template>

<script>
import api from "src/api/user";

export default {
  data() {
    return {
      rol: null,
      options: [
        {
          label: "Vender",
          value: "2"
        },
        {
          label: "Comprar",
          value: "3"
        }
      ],
      name: "",
      lastName: "",
      email: "",
      password: "",
      dui: "",
      nit: "",
      phone: "",
      rules: {
        required: [v => !!v || "Campo Requerido."],

        requiredDui: [
          v => !!v || "Campo Requerido.",
          v => (v && v.length == 9) || "Dui debe tener 9 caracteres"
        ],
        requiredNit: [
          v => !!v || "Campo Requerido.",
          v => (v && v.length == 14) || "Nit debe tener 14 caracteres"
        ],
        requiredPaswword: [
          v => !!v || "Campo Requerido.",
          v => (v && v.length >= 6) || "Contraseña debe al menos 6 caracteres"
        ],
        requiredNumber: [
          val => (val !== null && val !== "") || "Please type your age",
          val => (val > 0 && val < 100) || "Please type a real age"
        ],
        requiredEmail: [
          value => {
            const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return pattern.test(value) || "Correo requerido";
          }
        ]
      }
    };
  },
  async mounted() {},
  computed: {},

  methods: {
    async register() {
      //valido formulario
      var validate = await this.$refs.formRegister.validate();
      if (!validate) {
        return;
      }

      try {
        this.$q.loading.show();

        var isDui = await api.isDui(this.dui);
        if (!isDui.isValid) {
          this.$q.notify({
            type: "negative",
            position: "center",
            message: "Dui Invalido"
          });
          this.$refs.dui.focus();
          this.$q.loading.hide();
          return;
        }

        var existEmail = await api.userExistsEmail(this.email);
        console.log(existEmail);
        if (existEmail) {
          this.$q.notify({
            type: "warning",
            position: "center",
            message: "Correo electronico ingresado, ya esta registrado..."
          });
          this.$refs.correo.focus();

          this.$q.loading.hide();

          return;
        }

        await api.addUser({
          idRol: this.rol.value,
          nombreCompleto: this.name + " " + this.lastName,
          nombres: this.name,
          apellidos: this.lastName,
          dui: this.dui,
          nit: this.nit,
          telefonoContacto: this.phone,
          correoElectronico: this.email,
          contrasena: this.password
        });
        this.$q.notify({
          type: "positive",
          position: "center",
          message: "Gracias por Registrarte, Por Favor Inicia Sesión...",
          actions: [{ icon: "close", color: "white" }]

        });
        //this.$q.loading.hide();

        setTimeout(() => {
          this.$router.push({ path: "/Login" }).catch(error => {
            console.log(error);
          });
        }, 3000);
      } catch (error) {
        //this.$q.loading.hide();

        console.log(error);
        this.$q.notify({
          type: "negative",
          position: "center",
          message: "Error Interno, Intente mas Tarde",
          actions: [{ icon: "close", color: "white" }]

        });
      } finally {
        this.$q.loading.hide();
      }
    },
    isValidEmail(val) {
      const emailPattern = /^(?=[a-zA-Z0-9@._%+-]{6,254}$)[a-zA-Z0-9._%+-]{1,64}@(?:[a-zA-Z0-9-]{1,63}\.){1,8}[a-zA-Z]{2,63}$/;
      return emailPattern.test(val) || "Email invalido";
    }
  }
};
</script>

<style>
.bg-image {
  background: url("../assets/portada.svg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
</style>
