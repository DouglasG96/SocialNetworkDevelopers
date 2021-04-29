<template>
  <div class="row q-col-gutter-sm">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <q-card class>
        <q-card-section class="text-center text-h6">
          <q-icon name="history" class="q-mr-sm" />Historial de Compras
        </q-card-section>
      </q-card>
      <q-table
        :data="dataHistory"
        :columns="columns"
        row-key="name"
        :pagination.sync="pagination"
        :filter="filter"
      >
          <!-- <ButtonExportExcel
            :myName="nameExcel"
            :myWorksheet="'Dispositivos'"
            :myData="dataHistory"
            :myExportFields="{
              Dispositivo: 'device',
              'Marca/Modelo': 'marca',
              Numero: 'numero',
              App: 'versionApp',
            }"
          ></ButtonExportExcel> -->
        <template v-slot:top>
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
import api from "src/api/buyHistory";
import ButtonExportExcel from "src/components/ButtonExportExcel.vue";
import { mapState } from "vuex";
export default {
  components: { ButtonExportExcel },

  data() {
    return {
      dataHistory: [],
      nameExcel: "Exportar",
      columns: [
        {
          name: "idOrdenCompra",
          label: "Id",
          field: "idOrdenCompra",
          sortable: true
        },
        {
          name: "fechaHoraOrdenVenta",
          label: "Fecha de Compra",
          field: "fechaHoraOrdenVenta",
          sortable: true
        },
        {
          name: "tituloPublicacion",
          label: "Publicación",
          field: "tituloPublicacion",
          sortable: true
        },
        {
          name: "cantidad",
          label: "Cantidad",
          field: "cantidad",
          sortable: true
        },
        {
          name: "estadoOrdenCompra",
          label: "Estado",
          field: "estadoOrdenCompra",
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
    await this.getHistoryBuyers();
  },
  methods: {
    async getHistoryBuyers() {
      try {
        this.dataHistory = await api.GetHistoryBuysByIdBuyer(
          parseInt(this.user.idUser)
        );
      } catch (error) {
        console.log(error);
      }
    }
  }
};
</script>