<template>
  <q-layout>
    <q-page-container>
      <q-page class="flex bg-image flex-center">
        <q-card
          v-bind:style="$q.screen.lt.sm ? { width: '80%' } : { width: '50%' }"
        >
          <q-card-section>
            <q-avatar size="103px" class="absolute-center shadow-10">
              <img src="profile.svg" />
            </q-avatar>
          </q-card-section>
          <q-card-section>
            <div class="text-center q-pt-lg">
              <div class="col text-h6 ellipsis">Inicio de Sesión</div>
            </div>
          </q-card-section>
          <q-card-section>
            <q-form  ref="formLogin" autocomplete="off" class="q-gutter-md" @submit.prevent="login">
              <q-input
                filled
                v-model="email"
                label="Username"
                lazy-rules
                :rules="rules.required"
              />

              <q-input
                type="password"
                filled
                v-model="password"
                label="Password"
                lazy-rules
                :rules="rules.required"
              />

              <div class="row">
                <div class="col-6">
                  <q-btn label="Acceder" type="submit" color="positive" />
                </div>
                <div class="col-6">
                  <q-btn
                    label="Registrarse"
                    to="/Register"
                    color="secondary"
                    class="q-ml-sm"
                  />
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
export default {
  data() {
    return {
      email: "",
      password: "",
      rules: {
        required: [v => !!v || "Campo Requerido."]
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
          email: this.email,
          password: this.password
        });
                 this.$q.loading.hide();
        this.$router.push({ path: "/DetailProduct" }).catch(error => {});
        this.email = "";
        this.password = "";
      } catch (error) {
                 this.$q.loading.hide();

        console.log(error);
        this.$q.notify({
          type: "negative",
          position: "center",
          message: error.data
        });
      }

    }
  }
};
</script>

<style>
.bg-image {
  background-image: linear-gradient(135deg, #363da8 0%, #dfdee4 100%);

}
</style>
