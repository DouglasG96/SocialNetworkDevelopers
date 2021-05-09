<template>
  <q-layout>
    <q-page-container>
      <q-page class="flex bg-image flex-center">
        <q-card
          style="opacity: 0.9"
          v-bind:style="$q.screen.lt.sm ? { width: '80%' } : { width: '50%' }"
        >
          <q-card-section>
            <img
              src="../assets/logo.png"
              width="100"
              height="100"
              class="absolute-center shadow-10"
            />
            <!-- <q-avatar size="103px" class="absolute-center shadow-10">
              <img src="../assets/logo.PNG" />
            </q-avatar>-->
          </q-card-section>
          <q-card-section>
            <div class="text-center q-pt-lg">
              <div class="col text-h6 ellipsis">Restaurar Contraseña</div>
            </div>
          </q-card-section>
          <q-card-section>
            <q-form
              ref="formRestorePassword"
              autocomplete="off"
              class="q-gutter-md"
              @submit.prevent="restorePassword"
            >
              <q-input
                filled
                v-model="email"
                label="correo"
                ref="correo"
                lazy-rules
                :rules="rules.requiredEmail"
                class="text-lowercase"
              />

              <q-input
                type="password"
                filled
                v-model="password"
                label="Nueva Contraseña"
                lazy-rules
                :rules="rules.requiredPaswword"
              />

              <div class="row text-center">
                <div class="col-6">
                  <q-btn label="Cambiar Contraseña" type="submit" color="positive" />
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
import { mapActions, mapState } from "vuex";
import api from "src/api/user";

export default {
  data() {
    return {
      email: "",
      password: "",
      rules: {
        required: [v => !!v || "Campo Requerido."],
        requiredPaswword: [
          v => !!v || "Campo Requerido.",
          v => (v && v.length >= 6) || "Contraseña debe al menos 6 caracteres"
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
  async mounted() {
    //si hay token no mostrar vista login
    if (this.$store.getters["auth/isLoggedIn"]) {
      this.$router.push({ path: "/" }).catch(error => {});
    }
  },
  computed: {
    ...mapState("auth", ["user"])
  },

  methods: {
    ...mapActions("auth", ["loginUser"]),
    async restorePassword() {
      try {
        this.$q.loading.show();

        //valido formulario
        var validate = await this.$refs.formRestorePassword.validate();
        if (!validate) {
          return;
        }

        var existEmail = await api.userExistsEmail(this.email);
        console.log(existEmail);
        if (!existEmail) {
          this.$q.notify({
            type: "warning",
            position: "center",
            message: "Correo electronico ingresado, no existe...",
            actions: [{ icon: "close", color: "white" }]

          });
          this.$refs.correo.focus();

          this.$q.loading.hide();

          return;
        }

        await api.updatePassword({
          email: this.email,
          password: this.password
        });
        this.$q.notify({
          type: "positive",
          position: "center",
          message: "Contraseña actualizada exitosamente, Por Favor Inicia Sesión...",
          actions: [{ icon: 'close', color: 'white' }]
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
          actions: [{ icon: 'close', color: 'white' }]
        });
      } finally {
        this.$q.loading.hide();
      }
    }
  }
};
</script>

<style>
.bg-image {
  background: url("../assets/login.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
  background-color: black;
}
</style>
