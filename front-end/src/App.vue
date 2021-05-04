<template>
  <div id="q-app">
    <router-view />
  </div>
</template>

<script>
import { mapActions } from "vuex";
import { api } from 'boot/axios'
import { LocalStorage } from 'quasar'

export default {
  name: 'App',

created () {
  this.readToken();
  api.defaults.headers.common['Authorization'] = 'Bearer ' +LocalStorage.getItem('token'); //configuro token para axios

},
  methods: {
    ...mapActions("auth", ["readToken"]),
    
  }
}
</script>
