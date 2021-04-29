<template>
  <q-layout view="hHh lpR fFf">

    <q-drawer v-model="drawer" side="right" overlay bordered>
      <!-- drawer content -->
    </q-drawer>

    <q-page-container>
      <router-view />
    </q-page-container>

  </q-layout>
</template>

<script>
export default {
  name: "SideBarWishlist",
  data () {
    return {
    }
  }
}
</script>
