<template>
  <q-layout>
    <q-page-container>
      <q-page class="flex bg-image flex-center">
        <q-card
          v-bind:style="$q.screen.lt.sm ? { width: '80%' } : { width: '30%' }"
        >
          <q-card-section>
            <q-avatar size="103px" class="absolute-center shadow-10">
              <img src="profile.svg" />
            </q-avatar>
          </q-card-section>
          <q-card-section>
            <div class="text-center q-pt-lg">
              <div class="col text-h6 ellipsis">Log in</div>
            </div>
          </q-card-section>
          <q-card-section>
            <q-form class="q-gutter-md"  @submit.prevent="login">
              <q-input filled v-model="email" label="Username" lazy-rules />

              <q-input
                type="password"
                filled
                v-model="password"
                label="Password"
                lazy-rules
              />

              <div>
                <q-btn label="Login"  type="submit" color="primary" />
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
    };
  },
  async mounted() {
    console.log(this.user);
    this.loginUser({
      user: this.email,
      password: this.password,
    });
    if (this.user != null) {
     await this.$router.push({
        path: "/",
      });
    }
  },
  computed: {
    ...mapState("users", ["user"]),
  },
  methods: {
    ...mapActions("users", ["loginUser"]),
    async login() {
      this.loginUser({
        user: this.email,
        password: this.password,
      });
      if (this.user != null) {
        await this.$router.push({
          path: "/Pricing",
        });
      }
    },
  },
};
</script>

<style>
.bg-image {
  background-image: linear-gradient(135deg, #7028e4 0%, #e5b2ca 100%);
}
</style>
