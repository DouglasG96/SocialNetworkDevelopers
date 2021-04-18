<template>
  <q-card class="">
    <q-img :src="'data:image/jpeg;base64,'+ data.imagen" height="150px">
      <!-- <q-chip v-if="data.chip" :class="data.chip_class" :color="data.chip_color" :label="data.chip"></q-chip> -->
    </q-img>

    <q-card-section>
      <q-btn
        fab
        color="teal-7"
        icon="fas fa-cart-plus" padding="sm"
        class="absolute"
        style="top: 0; right: 12px; transform: translateY(-50%);"
      />
    </q-card-section>

    <q-card-section>
      <div class="text-h6">
        <!-- {{ data.title }} -->
        {{data.titulo}}
      </div>
      <div class="text-subtitle1 text-justify q-mt-sm">
        <!-- {{ data.caption }} -->
        {{data.descripcion}}
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
</template>

<script>
import { mapActions } from "vuex";

export default {
  name: "CardProduct",
  props: ['data'],
  data() {
    return {
    }
  },
  methods: {
    ...mapActions("shoppingCart", ["addShoppingCart","cleanShoppingCart"]),
     getDetail(data) {
       this.cleanShoppingCart();
       this.addShoppingCart(data);
      this.$router.push({path: '/DetailProduct'}).catch(error => {console.log(error); });
    }
  },
}
</script>

<style scoped>

</style>
