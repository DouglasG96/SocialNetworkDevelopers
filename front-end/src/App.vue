<template>
  <div id="q-app">
    <router-view />
  </div>
</template>

<script>
import { mapActions } from "vuex";

export default {
  name: 'App',

created () {
  this.readToken();
},
  methods: {
    ...mapActions("auth", ["readToken"]),
    
  }
}
</script>
