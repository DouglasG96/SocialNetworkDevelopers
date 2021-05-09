<template>
  <div>
    <q-card class="">
      <q-img :src="'data:image/jpeg;base64,'+ data.imagen" height="150px"/>

      <q-card-section>
        <q-btn
          fab
          color="teal-7"
          icon="playlist_add" padding="sm"
          class="absolute"
          style="top: 0; right: 12px; transform: translateY(-50%);"
          @click="cardModal = true"
        />
      </q-card-section>

      <q-card-section>
        <div class="text-h6">
          {{ data.titulo }}
        </div>
        <div class="text-subtitle1 text-justify q-mt-sm">
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
                 @click="addWishList"
          />
          <q-btn v-close-popup flat color="primary" label="Cancelar"/>
        </q-card-actions>
      </q-card>
    </q-dialog>
  </div>
</template>

<script>
import {mapActions, mapState} from "vuex";
import api from "src/api/wishLists";

export default {
  name: "CardProduct",
  props: ['data'],
  data() {
    return {
      cardModal: false,
      actionValidateDeleteItem: false,
    }
  },
  computed: {
    ...mapState("auth", ["user"]),
  },
  methods: {
    ...mapActions("shoppingCart", ["addShoppingCart", "cleanShoppingCart"]),
    getDetailWishlistChild(){
      this.$on("getDetailWishlist",this.getDetail(data));
      console.log('si funciona el listener')
    },
    getDetail(data) {
      this.cleanShoppingCart();
      this.addShoppingCart(data);
      this.$router.push({path: '/DetailProduct'}).catch(error => {
        console.log(error);
      });
    },
    async addWishList() {
      try {
        var d = new Date();
        var fechaCreacion = this.formatDate(d);

        let itemWishList = {
          IdPublicacion: this.data.idPublicacion,
          IdUsuario: this.user.idUser,
          FechaCreacion: fechaCreacion,
          EstadoWishlist: 1
        }
        let response = await api.AddPublicationWishList(itemWishList)
        if(response != null)
        {
          this.triggerPositive()
          await this.$emit('addWishList');
        }
      } catch (error) {
        console.log(error);
        this.$q.notify({
          type: "negative",
          position: "center",
          message: "Error Interno en el servidor, intente mas tarde"
        });
      } finally {
        this.$q.loading.hide();
      }
    },
    formatDate(date) {
      var hours = date.getHours();
      var minutes = date.getMinutes();
      var ampm = hours >= 12 ? 'pm' : 'am';
      hours = hours % 12;
      hours = hours ? hours : 12;
      minutes = minutes < 10 ? '0'+minutes : minutes;
      var strTime = hours + ':' + minutes + ' ' + ampm;
      return date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() + " " + strTime;
    },
    triggerPositive () {
      this.$q.notify({
        type: "positive",
        position: "center",
        message: "Publicación Agregada Correctamente a tu wishlist."
      });
      //Ejecuta la funcion para mostrar el sidebar
      this.drawer = !this.drawer
    },

  },
}
</script>

<style scoped>

</style>
