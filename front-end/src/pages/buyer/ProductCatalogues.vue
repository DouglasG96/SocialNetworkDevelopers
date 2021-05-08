<template>
  <q-page class="q-pa-sm">
    <div>
      <q-card class="no-border no-shadow">
        <q-card-section class="q-pa-sm">
          <q-input rounded v-model="search" outlined placeholder="Search Product">
            <template v-slot:append>
              <q-icon v-if="search === ''" name="search" />
              <q-icon v-else name="clear" class="cursor-pointer" @click="search = ''" />
            </template>
            <template v-slot:after>
              <q-btn round icon="list" @click="getHistoryWishlist"/>
            </template>
          </q-input>
        </q-card-section>
      </q-card>
    </div>
    <div class="row q-col-gutter-sm">
      <div
        class="col-md-4 col-lg-4 col-sm-12 col-xs-12"
        v-for="(item, item_index) in dataFilterd"
        :key="item_index"
      >
        <card-product :data="item" v-on:addWishList="getHistoryWishlist"></card-product>
      </div>
    </div>

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
                 <q-btn class="gt-xs" size="12px" flat dense round icon="delete" @click="deleteWishList(item.idWhislist)"/>
                </div>
              </q-item-section>
            </q-item>
          </q-list>
          <br>
        </div>
      </div>
    </q-drawer>
  </q-page>
</template>

<script>
import api from "src/api/publication";
import apiWishlist from "src/api/wishLists";
import { mapState } from "vuex";

export default {
  name: "ProductCatalogues",
  components: { CardProduct: () => import("components/cards/CardProduct"), SideBarWishlist: () => import("components/sidebars/SideBarWishlist") },
  data() {
    return {
      texto: "",
      dataFilterd: [],
      dataProduct: [],
      historyWishlist: null,
      drawer: false,
    };
  },
  async mounted() {
    await this.getPublications();
  },
  created() {
    // escuchar eventos signalR
    this.$apihub.$on("info-publication", this.onPublicationChanged);
  },

  computed: {
    ...mapState("auth", ["user"]),
    search: {
      get() {
        return this.texto;
      },
      set(value) {
        value = value.toLowerCase();
        this.dataFilterd = this.dataProduct.filter(
          x => x.titulo.toLowerCase().indexOf(value) !== -1
        );
        this.texto = value;
      }
    }
  },

  methods: {
    async onPublicationChanged(publication) {
      console.log(publication);
      await this.getPublications();
      this.$q.notify({
        type: "info",
        position: "top-right",
        message: `Se agrego una nueva publicacion ${publication.publication}`
      });
    },
    async getPublications() {
      console.log(this.user);

      try {
        this.dataProduct = await api.getPublications();
      } catch (error) {
        console.log(error);
      }
      this.dataFilterd = this.dataProduct;
    },
    async getHistoryWishlist(){
      try {
        let responseHistory = await apiWishlist.GetPublicationWishList(this.user.idUser)
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
            let responseDelete = await apiWishlist.deleteWishList(idWishlist)
            if(responseDelete != null)
            {
              this.triggerPositiveDelete()
              this.drawer = false;
              await this.getHistoryWishlist()
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
    triggerPositiveDelete() {
      this.$q.notify({
        type: "positive",
        position: "center",
        message: "El item ha sido eliminado de tu wishlist"
      });
    }
  },
  beforeDestroy() {
    // limpiar eventos signalR
    this.$apihub.$off("info-publication", this.onPublicationChanged);
  }
};
</script>

<style scoped></style>
