<template>
  <div>
    <q-card class="">
      <q-img :src="'data:image/jpeg;base64,'+ data.imagen" height="150px">
        <!-- <q-chip v-if="data.chip" :class="data.chip_class" :color="data.chip_color" :label="data.chip"></q-chip> -->
      </q-img>

      <q-card-section>
        <q-btn
          fab
          color="teal-7"
          icon="fas fa-heart" padding="sm"
          class="absolute"
          style="top: 0; right: 12px; transform: translateY(-50%);"
          @click="cardModal = true"
        />
        <!--@click="drawer = !drawer"-->
      </q-card-section>

      <q-card-section>
        <div class="text-h6">
          <!-- {{ data.title }} -->
          {{ data.titulo }}
        </div>
        <div class="text-subtitle1 text-justify q-mt-sm">
          <!-- {{ data.caption }} -->
          {{ data.descripcion }}
        </div>
      </q-card-section>
      <q-card-section>
        <div class="col-12 ">
          <span class="text-h6">${{ data.precio }}</span>
          <span class="text-h5 float-right">
          <q-btn label="Ver Detalle" rounded color="secondary" outline @click="getDetail(data)"></q-btn>
        </span>
        </div>
      </q-card-section>
      <!--<side-bar-wishlist></side-bar-wishlist>-->
    </q-card>
    <q-dialog v-model="cardModal">
      <q-card class="my-card" style="width: 500px">
        <q-toolbar>
          <q-toolbar-title class="text-center"><span class="text-weight-bold">Agregar a mi Wishlist</span>
          </q-toolbar-title>
          <q-btn flat round dense icon="close" v-close-popup/>
        </q-toolbar>
        <q-img :src="'data:image/jpeg;base64,'+ data.imagen" height="120px"/>
        <q-card-section>
          <div class="row no-wrap items-center text-center">
            <div class="col text-h6 ellipsis">
              {{ data.titulo }}
            </div>
          </div>

          <!--<q-rating v-model="stars" :max="5" size="32px" />-->
        </q-card-section>

        <q-card-section class="q-pt-none">
          <div class="text-subtitle1">
            ${{ data.precio }}
          </div>
          <div class="text-caption text-grey">
            ・{{ data.descripcion }}
          </div>
        </q-card-section>

        <q-separator/>

        <q-card-actions align="center">
          <q-btn v-close-popup flat color="success" label="Si agregar"
                 @click="addWishList(data.idPublicacion,data.idUsuario)"
          />
          <!--@click="addWishList"-->
          <q-btn v-close-popup flat color="primary" label="Cancelar"/>
        </q-card-actions>
      </q-card>
    </q-dialog>

    <q-layout view="hHh lpR fFf">

      <q-drawer v-model="drawer" side="right" overlay bordered>
        <q-toolbar>
          <q-toolbar-title class="text-center"><span class="text-weight-bold">Mi Wishlist</span>
          </q-toolbar-title>
          <q-btn flat round dense icon="close" @click="drawer = false"/>
        </q-toolbar>
      </q-drawer>

      <q-page-container>
        <router-view/>
      </q-page-container>

    </q-layout>
  </div>
</template>

<script>
import {mapActions} from "vuex";
import api from "src/api/wishLists";

export default {
  name: "CardProduct",
  components: {SideBarWishlist: () => import("components/sidebars/SideBarWishlist")},
  props: ['data'],
  data() {
    return {
      drawer: false,
      cardModal: false
    }
  },
  created () {
  },
  methods: {
    ...mapActions("shoppingCart", ["addShoppingCart", "cleanShoppingCart"]),
    getDetail(data) {
      this.cleanShoppingCart();
      this.addShoppingCart(data);
      this.$router.push({path: '/DetailProduct'}).catch(error => {
        console.log(error);
      });
    },
    addWishList(idPublicacion,idUsuario) {
      console.log('idPublicacion',idPublicacion)
      console.log('idUsuario',idUsuario)
      api.
      if (idPublicacion > 0)
      {
        this.triggerPositive()
      }
    },
    triggerPositive () {
      this.$q.notify({
        type: "positive",
        position: "center",
        message: "Publicación Agregada Correctamente a tu wishlist."
      });
      //Ejecuta la funcion para mostrar el sidebar
      this.drawer = !this.drawer
    }
  },
}
</script>

<style scoped>

</style>
