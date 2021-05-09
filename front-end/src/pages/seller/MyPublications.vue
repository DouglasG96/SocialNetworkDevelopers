<template>
  <div class="row q-col-gutter-sm">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <q-card class>
        <q-card-section class="text-center text-h6">
          <q-icon name="history" class="q-mr-sm" />Mis Publicaciones
        </q-card-section>
      </q-card>
      <q-table
        :data="dataMyPublications"
        :columns="columns"
        row-key="name"
        :pagination.sync="pagination"
        :filter="filter"
      >
        <template v-slot:top>
          <q-btn
            round color="green"
            icon="refresh"
            @click="getPublicationsByIdUser"
          ></q-btn>
          <q-space />
          <q-input borderless dense debounce="300" color="primary" v-model="filter">
            <template v-slot:append>
              <q-icon name="search" />
            </template>
          </q-input>
          <div class="row q-col-gutter-sm"></div>
        </template>
      </q-table>
    </div>
  </div>
</template>
<script>
import api from "src/api/publication";
import { mapState } from "vuex";
export default {
  data() {
    return {
      dataMyPublications: [],
      columns: [
        {
          name: "idPublicacion",
          label: "Id",
          field: "idPublicacion",
          sortable: true
        },
        {
          name: "fechaPublicacion",
          label: "Fecha de Publicación",
          field: "fechaPublicacion",
          sortable: true
        },
        {
          name: "titulo",
          label: "Publicación",
          field: "titulo",
          sortable: true
        },
        {
          name: "delivery",
          label: "Delivery",
          field: "delivery",
          sortable: true
        }
      ],
      filter: "",
      pagination: {
        rowsPerPage: 15
      }
    };
  },
  computed: {
    ...mapState("auth", ["user"])
  },
  async mounted() {
    await this.getPublicationsByIdUser();
  },
  methods: {
    async getPublicationsByIdUser() {
      try {
        this.dataMyPublications = await api.getPublicationsByIdUser(
          parseInt(this.user.idUser)
        );
      } catch (error) {
        console.log(error);
      }
    }
  }
};
</script>
