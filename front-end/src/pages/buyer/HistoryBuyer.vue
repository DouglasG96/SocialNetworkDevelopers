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
        <template v-slot:top>
          <ButtonExportExcel
            :myName="'Historico de Compras SNB&S'"
            :myWorksheet="'Histórico de Compras'"
            :myData="dataHistory"
            :myExportFields="{
              'Fecha de Compra': 'fechaHoraOrdenCompra',
              'Publicación': 'tituloPublicacion',
              'Cantidad': 'cantidad',
              'Total con Iva': 'totalCompraConIva',
              'Total sin Iva': 'totalCompraSinIva',
              'Estado': 'estadoOrdenCompra',

            }"
          ></ButtonExportExcel>
          <q-space />
          <q-input borderless dense debounce="300" color="primary" v-model="filter">
            <template v-slot:append>
              <q-icon name="search" />
            </template>
          </q-input>
        </template>

        <!-- Renderiza data en tabla -->
        <template v-slot:body="props">
          <q-tr :props="props">
            <q-td key="idOrdenCompra" :props="props">{{ props.row.idOrdenCompra }}</q-td>
            <q-td key="fechaHoraOrdenCompra" :props="props">{{ props.row.fechaHoraOrdenCompra }}</q-td>
            <q-td key="vendedor" :props="props">{{ props.row.vendedor }}</q-td>
            <q-td key="tituloPublicacion" :props="props">{{ props.row.tituloPublicacion }}</q-td>
            <q-td key="cantidad" :props="props">{{ props.row.cantidad }}</q-td>
            <q-td key="totalCompra" :props="props">{{ props.row.totalCompra }}</q-td>
            <q-td key="estadoOrdenCompra" :props="props">{{ props.row.estadoOrdenCompra }}</q-td>
            <q-td key="actions" :props="props">
              <template v-if="props.row.estadoOrdenCompra == 'Aprobada'">
                <q-btn
                  color="positive"
                  label="Recibido"
                  size="sm"
                  flat
                  dense
                  @click="received(props.row)"
                />
              </template>
            </q-td>
          </q-tr>
        </template>
      </q-table>
    </div>

    <!-- dialogo calificar producto -->
    <q-dialog v-model="dialog">
      <q-card>
        <q-card-section class="row items-center q-pb-none">
          <div class="text-h6">Calificar Producto</div>
          <q-space />
          <q-btn icon="close" flat round dense v-close-popup />
        </q-card-section>

        <q-card-section class="q-pt-none">
          <div class="text-subtitle2 q-mt-sm">
            <q-rating v-model="raiting" size="2em" color="green-5" />
          </div>
        </q-card-section>

        <q-card-actions align="right">
          <q-btn flat label="Calificar" @click="rate" color="primary" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>
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
      columns: [
        {
          name: "idOrdenCompra",
          label: "Id",
          field: "idOrdenCompra",
          sortable: true
        },
        {
          name: "fechaHoraOrdenCompra",
          label: "Fecha de Compra",
          field: "fechaHoraOrdenCompra",
          sortable: true
        },
        {
          name: "vendedor",
          label: "Vendedor",
          field: "vendedor",
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
          name: "totalCompra",
          label: "Total",
          field: "totalCompra",
          sortable: true
        },
        {
          name: "estadoOrdenCompra",
          label: "Estado",
          field: "estadoOrdenCompra",
          sortable: true
        },
        {
          name: "actions",
          label: "Acciones",
          field: "actions"
        }
      ],
      filter: "",
      pagination: {
        rowsPerPage: 15
      },
      dialog: false,
      raiting: 1,
      idSaleOrder: 0,
      idBuyOrder: 0,
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
    },
    async received(item){
      this.dialog = true;
      console.log(item);
      this.idSaleOrder = item.idOrdenVenta;
      this.idBuyOrder = item.idOrdenCompra;
    },
    async rate(item){
      console.log(item);
      this.$q.loading.show();
      try {
        await api.ReceivedBuyer(
          {
            idSaleOrder: parseInt(this.idSaleOrder),
            idBuyOrder: parseInt(this.idBuyOrder),
            raiting: parseInt(this.raiting),
          }
        );
        await this.getHistoryBuyers();
        this.$q.notify({
          type: "positive",
          position: "center",
          message: "Gracias por su calificación"
        });
      } catch (error) {
        console.log(error);
                this.$q.notify({
          type: "negative",
          position: "center",
          message: "Error Interno, Intente mas Tarde"
        });
      }finally{
        this.$q.loading.hide();
      }
    }
  }
};
</script>