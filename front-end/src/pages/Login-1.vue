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
              <div class="col text-h6 ellipsis">Inicio de Sesión</div>
            </div>
          </q-card-section>
          <q-card-section>
            <q-form ref="formLogin" autocomplete="off" class="q-gutter-md" @submit.prevent="login">
              <q-input
                filled
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
                label="Contraseña"
                lazy-rules
                :rules="rules.requiredPaswword"
              />

              <div class="row text-center">
                <div class="col-6">
                  <q-btn label="Acceder" type="submit" color="positive" />
                </div>
                <div class="col-6">
                  <q-btn label="Registrarse" to="/Register" color="secondary" class="q-ml-sm" />
                </div>
              </div>
              <div>
                <q-btn
                  color="secondary"
                  label="Olvidé Contraseña"
                  size="sm"
                  flat
                  dense
                  @click="restorePassword()"
                />
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
export default {
  data() {
    return {
      email: "",
      password: "",
      rules: {
        required: [v => !!v || "Campo Requerido."],
        requiredEmail: [
          value => {
            const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return pattern.test(value) || "Correo requerido";
          }
        ],
        requiredPaswword: [
          v => !!v || "Campo Requerido.",
          v => (v && v.length >= 6) || "Contraseña debe al menos 6 caracteres"
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
    async login() {
      //valido formulario
      var validate = await this.$refs.formLogin.validate();
      if (!validate) {
        return;
      }

      try {
        this.$q.loading.show();
        await this.loginUser({
          email: this.email.trim(),
          password: this.password.trim()
        });
        this.$q.loading.hide();
        if (this.user.idRole === "1")
          this.$router
            .push({ path: "/Estadisticas" })
            .catch(error => {
              console.log(error);
            });
        if (this.user.idRole === "2")
          this.$router.push({ path: "/MisPublicaciones" }).catch(error => {
            console.log(error);
          });
        if (this.user.idRole === "3")
          this.$router.push({ path: "/" }).catch(error => {
            console.log(error);
          });
      } catch (error) {
        this.$q.loading.hide();
        console.log(error);
        this.$q.notify({
          type: "negative",
          position: "center",
          message: error.data,
          actions: [{ icon: "close", color: "white" }]
        });
      }
    },
    restorePassword() {
      this.$router.push({ path: "/RestorePassword" }).catch(error => {
        console.log(error);
      });
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
