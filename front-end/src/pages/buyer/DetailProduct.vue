<template>
  <q-page class="q-pa-sm">
    <div class="row q-col-gutter-sm">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <q-card class>
          <q-card-section class="text-center text-h6">
            <q-icon name="description" class="q-mr-sm" />Detalle del Producto
          </q-card-section>
          <q-card-section horizontal>
            <q-card-section class="col-5 flex flex-center">
              <figure style="float: left; width: 50%">
                <q-zoom background-color="black">
                  <img
                    :src="'data:image/jpeg;base64,' + this.shoppingCart[0].imagen"
                    height="250px"
                    alt="QZoom with portrait image"
                    class="my-image-portrait"
                  />
                </q-zoom>
                <figcaption></figcaption>
              </figure>
              <!-- <q-img
                          :src="'data:image/jpeg;base64,' + this.shoppingCart[0].imagen"
          height="150px"
        >
          <div class="absolute-bottom text-subtitle1 text-center">
            {{ this.shoppingCart[0].titulo }}
          </div>
              </q-img>-->
            </q-card-section>
            <q-card-section class>
              <div class="text-subtitle2 q-mt-sm">
                <q-rating
                  v-model="this.shoppingCart[0].raiting"
                  size="2em"
                  color="green-5"
                  readonly
                />
              </div>
              <div
                class="text-subtitle2 q-mb-sm text-weight-bolder"
              >{{ this.shoppingCart[0].titulo }}</div>
              <div class="text-subtitle2 q-mb-xs">{{ this.shoppingCart[0].descripcion }}</div>
              <div
                class="text-subtitle2 q-mb-xs text-weight-bolder"
              >${{ this.shoppingCart[0].precio }}</div>
              <div
                class="text-subtitle2 q-mb-xs"
              >{{ dateFormat(this.shoppingCart[0].fechaPublicacion) }}</div>
            </q-card-section>
          </q-card-section>
          <q-separator />
        </q-card>
      </div>
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <q-card class>
          <q-card-section class="text-center text-h6">
            <q-icon name="shopping_cart" class="q-mr-sm" />Comprar Producto
          </q-card-section>
          <q-stepper v-model="step" header-nav ref="stepper" color="primary" animated>
            <q-step
              :name="1"
              title="Mis Datos"
              icon="shopping_cart"
              :done="step > 1"
              :header-nav="step > 1"
            >
              <div class="row">
                <div class="col-6">
                  <q-item>
                    <q-input
                      dense
                      outlined
                      class="full-width"
                      v-model="this.user.nameUser"
                      label="Nombre *"
                      readonly
                    />
                  </q-item>
                </div>
                <div class="col-6">
                  <q-item>
                    <q-input
                      dense
                      outlined
                      class="full-width"
                      v-model="this.user.phone"
                      label="Telefono *"
                      readonly
                    />
                  </q-item>
                </div>
                <div class="col-12">
                  <q-item>
                    <q-input
                      filled
                      v-model.number="cantidad"
                      type="number"
                      class="full-width"
                      label="Cantidad"
                    />
                  </q-item>
                </div>
                <div class="col-12">
                  <q-item>
                    <q-input
                      dense
                      autogrow
                      outlined
                      v-model="direccionEntrega"
                      class="full-width"
                      label="Dirección de Entrega"
                    />
                  </q-item>
                </div>
                <div class="col-12">
                  <q-item>
                    <q-input
                      dense
                      outlined
                      type="textarea"
                      class="full-width"
                      v-model="comentario"
                      label="comentarios / telefono adicional"
                      maxlength="100"
                    />
                  </q-item>
                </div>
              </div>

              <q-stepper-navigation>
                <q-btn
                  rounded
                  @click="
                    () => {
                      done1 = true;
                      step = 2;
                    }
                  "
                  class="float-right q-mr-md q-mb-md"
                  color="blue"
                  label="Siguiente"
                />
              </q-stepper-navigation>
            </q-step>

            <q-step :name="2" title="Confirmar Compra" icon="shopping_cart" :header-nav="step > 2">
              <div class="row">
                <div class="col-12">
                  <q-item-label header class="text-h6">Resumen de Pedido</q-item-label>
                  <q-item class="full-width">
                    <q-item-section>
                      <q-item-label lines="1">{{ this.shoppingCart[0].titulo }}</q-item-label>
                      <q-item-label caption>Precio</q-item-label>
                    </q-item-section>
                    <q-item-section side>${{ this.shoppingCart[0].precio }}</q-item-section>
                  </q-item>
                  <q-separator></q-separator>
                  <q-item class="full-width" style="border-top: 3px dotted blue">
                    <q-item-section>
                      <q-item-label lines="1">Total</q-item-label>
                    </q-item-section>
                    <q-item-section
                      class="text-red text-weight-bolder text-h6"
                      side
                    >${{ this.cantidad * this.shoppingCart[0].precio }}</q-item-section>
                  </q-item>
                </div>
              </div>
              <!-- 
              <q-card class="rounded-borders">
                <q-card-section horizontal>
                  <q-card-section class="col-5 q-pt-xs">
                    <div class="text-h6 text-center">Shipping</div>
                    <div class="text-subtitle1 ">Pratik Patel</div>
                    <div class="text-subtitle2">
                      4841 Johnston Locks
                    </div>
                  </q-card-section>
                  <q-card-section class="col-7 q-pt-xs">
                    <div class="text-h6 text-center">Payment details</div>
                    <div class="text-subtitle1 q-mb-xs">Card type - Visa</div>
                    <div class="text-subtitle1 q-mb-xs">
                      Card holder - P***ik Patel
                    </div>
                    <div class="text-subtitle1 q-mb-xs">
                      Card Number - xxxx-xxxx-xxxx-1234
                    </div>
                    <div class="text-subtitle1 q-mb-xs">
                      Expiry date - 04/2012
                    </div>
                  </q-card-section>
                </q-card-section>
              </q-card>-->

              <q-stepper-navigation>
                <q-btn
                  rounded
                  @click="placeOrder()"
                  class="float-right q-mr-md q-mb-md"
                  color="blue"
                  label="Realizar Pedido"
                />
                <q-btn
                  flat
                  @click="step = 1"
                  color="primary"
                  rounded
                  label="Atras"
                  class="q-mr-sm float-right"
                />
              </q-stepper-navigation>
            </q-step>
          </q-stepper>
        </q-card>
      </div>
    </div>
  </q-page>
</template>

<script>
import { mapState } from "vuex";
import { date } from "quasar";
const { formatDate } = date;
import api from "src/api/saleOrder";
export default {
  name: "DetailProduct",
  data() {
    return {
      step: 1,
      cantidad: 1,
      direccionEntrega: "",
      comentario: "",

      card_detail: {}
    };
  },
  computed: {
    ...mapState("shoppingCart", ["shoppingCart"]),
    ...mapState("auth", ["user"])
  },
  mounted() {
    console.log(this.shoppingCart);
    console.log(this.user);
    // this.userInformation.name = this.user.nameUser;
    // this.userInformation.phone = this.user.phone;
  },

  methods: {
    dateFormat(date) {
      return formatDate(date, "DD-MM-YYYY");
    },
    async placeOrder() {
      try {
        this.$q.loading.show();

        await api.addSale({
          idPublicacion: parseInt(this.shoppingCart[0].idPublicacion),
          idUsuario: parseInt(this.shoppingCart[0].idUsuario),
          estadoOrdenVenta: "1",
          cantidad: parseInt(this.cantidad),
          idComprador: parseInt(this.user.idUser),
          direccionEntrega: this.direccionEntrega,
          comentario: this.comentario
        });
        this.$q.notify({
          type: "positive",
          position: "center",
          message: "Solicitud deCompra Realizada, Puede darle seguimiento en su Historial"
        });
        setTimeout(() => {
          this.$router.push({ path: "/HistorialCompras" }).catch(error => {
            console.log(error);
          });
        }, 4000);
      } catch (error) {
        console.log(error);
        this.$q.notify({
          type: "negative",
          position: "center",
          message: "Error Interno, Intente mas Tarde"
        });
      } finally {
        this.$q.loading.hide();
      }
    }
  }
};
</script>

<style scoped type="scss">
.my-image-portrait {
  width: auto;
  height: auto;
  max-width: 100%;
  max-height: 100%;
  margin: auto;
}
</style>
