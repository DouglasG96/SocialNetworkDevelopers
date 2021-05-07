<template>
  <div>
    <q-card class="">
      <q-img :src="'data:image/jpeg;base64,'+ data.imagen" height="150px"/>

      <q-card-section>
        <q-btn
          fab
          color="teal-7"
          icon="fas fa-heart" padding="sm"
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


      <q-drawer v-model="drawer" side="right" overlay bordered>
        <q-toolbar>
          <q-toolbar-title class="text-center"><span class="text-weight-bold">Mi Wishlist</span>
          </q-toolbar-title>
          <q-btn flat round dense icon="close" @click="drawer = false"/>
        </q-toolbar>
        <div class="q-pa-md" style="max-width: 350px">
            <div v-if="historyWishlist !== null"
              v-for="(item, item_index) in historyWishlist"
              :key="item_index"
            >
              <q-list bordered>
                <q-item clickable v-ripple :data="item">
                    <q-item-section thumbnail>
                      <img :src="`data:image/jpeg;base64,${item.imagen}`"/>
                    </q-item-section>
                    <q-item-section>
                      <q-item-label>{{item.titulo}}</q-item-label>
                      <q-item-label caption>{{item.descripcion}}</q-item-label>
                    </q-item-section>

                    <q-item-section side top>
                      <q-item-label caption>$ {{item.precio}}</q-item-label>
                    </q-item-section>
                  <q-item-section right side>
                    <div class="text-grey-8 q-gutter-xs">
                      <q-btn class="gt-xs" size="12px" flat dense round icon="delete" @click="deleteWishList(item.idWhislist)" />
                    </div>
                  </q-item-section>
                  </q-item>
                </q-list>
              <br>
            </div>
        </div>
      </q-drawer>

      <q-page-container>
        <router-view/>
      </q-page-container>


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
      cardModal: false,
      actionValidateDeleteItem: false,
      historyWishlist: null
    }
  },
   async mounted(){
  },
  async created () {
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
    async addWishList() {
      try {
        var d = new Date();
        var fechaCreacion = this.formatDate(d);

        let itemWishList = {
          IdPublicacion: this.data.idPublicacion,
          IdUsuario: this.data.idUsuario,
          FechaCreacion: fechaCreacion,
          EstadoWishlist: 1
        }
        let response = await api.AddPublicationWishList(itemWishList)
        if(response != null)
        {
          this.triggerPositive()
          await this.getHistoryWishlist()
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
    async getHistoryWishlist(){
      try {
        let responseHistory = await api.GetPublicationWishList(this.data.idUsuario)
        if(responseHistory.length > 0)
        {
          this.historyWishlist = responseHistory
          this.drawer = !this.drawer
        }
        else
        {
          this.$q.notify({
            type: "warning",
            position: "center",
            message: "No has agregado ningun item a tu wishlist"
          });
        }
      } catch (error) {
        console.log(error);
        this.$q.notify({
          type: "negative",
          position: "center",
          message: "Hubo un error al cargar la informacion de la wishlist"
        });
      } finally {
        this.$q.loading.hide();
      }
    },
    async deleteWishList(idWishlist)
    {
      this.$q
        .dialog({
          title: "Mensaje de confirmacion",
          dark: true,
          message: "¿Seguro que quieres eliminar este item de tu wishlist?",
          cancel: true,
          persistent: true
        })
        .onOk(async () => {
          try {
            let responseDelete = await api.deleteWishList(idWishlist)
            if(responseDelete != null)
            {
              this.triggerPositiveDelete()
              this.drawer = false;
              await this.getHistoryWishlist()
              this.drawer = !this.drawer
            }
          } catch (error) {
            console.log(error);
            this.$q.notify({
              type: "negative",
              position: "center",
              message: "Hubo un error al eliminar item de tu wishlist"
            });
          } finally {
            this.$q.loading.hide();
          }
        })
        .onOk(() => {
          // console.log('>>>> second OK catcher')
        })
        .onCancel(() => {
          console.log("Cancel");
        })
        .onDismiss(() => {
          // console.log('I am triggered on both OK and Cancel')
        });
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
    triggerPositiveDelete() {
      this.$q.notify({
        type: "positive",
        position: "center",
        message: "El item ha sido eliminado de tu wishlist"
      });
    }
  },
}
</script>

<style scoped>

</style>
