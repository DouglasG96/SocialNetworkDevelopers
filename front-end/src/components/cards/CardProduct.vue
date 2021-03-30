<template>
  <q-card class="">
    <q-img src="https://soilhealthinstitute.org/wp-content/uploads/2016/11/thumbnail-default.jpg" height="220px">
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
      <div>
        <q-rating
          v-model="data.rating"
          max="5"
          size="1.5em"
          color="yellow"
          icon="star_border"
          icon-selected="star"
          icon-half="star_half" readonly
          no-dimming
        />
      </div>
    </q-card-section>
    <q-card-section>
      <div class="col-12">
        <span class="text-h6">{{ data.precio }}</span>
        <span class="text-h6 float-right">
          <q-btn label="See Details" rounded color="secondary" outline @click="getDetail(data)"></q-btn>
        </span>
      </div>
    </q-card-section>
  </q-card>
</template>

<script>
export default {
  name: "CardProduct",
  props: ['data'],
  data() {
    return {
    }
  },
  methods: {
     getDetail(data) {
      console.log(data);
      this.$router.push({path: '/Pricing'}).catch(error => { });
    }
  },
}
</script>

<style scoped>

</style>
