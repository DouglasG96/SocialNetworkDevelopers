<template>
  <q-page class="q-pa-sm">
    <div>
      <q-card class="no-border no-shadow">
        <q-card-section class="q-pa-sm">
          <!-- <q-input filled  label="Buscar..." v-model="search" /> -->
          <q-input
            rounded
            v-model="search"
            outlined
            placeholder="Search Product"
          >
            <template v-slot:append>
              <q-icon v-if="search === ''" name="search" />
              <q-icon
                v-else
                name="clear"
                class="cursor-pointer"
                @click="search = ''"
              />
            </template>
          </q-input>
        </q-card-section>
      </q-card>
    </div>
    <div class="row q-col-gutter-sm ">
      <div
        class="col-md-4 col-lg-4 col-sm-12 col-xs-12"
        v-for="(item, item_index) in dataFilterd"
        :key="item_index"
      >
        <card-product :data="item"></card-product>
      </div>
    </div>
  </q-page>
</template>

<script>
import api from "src/api/publication";
import { mapState } from "vuex";

export default {
  name: "ProductCatalogues",
  components: { CardProduct: () => import("components/cards/CardProduct") },
  data() {
    return {
      texto: "",
      dataFilterd: [],
      dataProduct: [],
    };
  },
  async mounted() {
    console.log(this.user);
    try {
      this.dataProduct = await api.getPublications();
    } catch (error) {
      console.log(error);
    }
    this.dataFilterd = this.dataProduct;
  },
  created() {},

  computed: {
        ...mapState("auth", ["user"]),
    search: {
      get() {
        return this.texto;
      },
      set(value) {
        value = value.toLowerCase();
        this.dataFilterd = this.data.filter(
          x => x.titulo.toLowerCase().indexOf(value) !== -1
        );
        this.texto = value;
      }
    }
  }
};
</script>

<style scoped></style>
