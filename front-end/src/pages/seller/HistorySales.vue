<template>
  <div class="row q-col-gutter-sm">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <q-card class>
        <q-card-section class="text-center text-h6">
          <q-icon name="history" class="q-mr-sm"/>
          Historial de Ventas
        </q-card-section>
      </q-card>
      <q-table
        title="Historico Ventas"
        :data="dataHistory"
        :columns="columns"
        row-key="name"
        :pagination.sync="pagination"
        :filter="filter"
      >

        <template v-slot:top>
          <ButtonExportExcel
            :myName="'Historico de Ventas SNB&S'"
            :myWorksheet="'Histórico de Compras'"
            :myData="dataHistory"
            :myExportFields="{
              'Fecha de Venta': 'fechaHoraOrdenVenta',
              'Publicación': 'tituloPublicacion',
              'Cantidad': 'cantidad',
              'Total con Iva': 'totalVentaConIva',
              'Total sin Iva': 'totalVentaSinIva',
              'Estado': 'estadoOrdenVenta',

            }"
          ></ButtonExportExcel>
          <q-space/>
          <q-input borderless dense debounce="300" color="primary" v-model="filter">
            <template v-slot:append>
              <q-icon name="search"/>
            </template>
          </q-input>

        </template>

        <!-- Renderiza data en tabla -->
        <template v-slot:body="props">
          <q-tr :props="props">
            <q-td key="idOrdenVenta" :props="props">
              {{ props.row.idOrdenVenta }}
            </q-td>
            <q-td key="fechaHoraOrdenVenta" :props="props">
              {{ props.row.fechaHoraOrdenVenta }}
            </q-td>
            <q-td key="tituloPublicacion" :props="props">
              {{ props.row.tituloPublicacion }}
            </q-td>
            <q-td key="comprador" :props="props">
              {{ props.row.comprador }}
            </q-td>
            <q-td key="cantidad" :props="props">
              {{ props.row.cantidad }}
            </q-td>
            <q-td key="totalVenta" :props="props">
              {{ props.row.totalVenta }}
            </q-td>
            <q-td key="estadoOrdenVenta" :props="props">
              {{ props.row.estadoOrdenVenta }}
            </q-td>
            <q-td key="actions" :props="props">
              <template v-if="props.row.estadoOrdenVenta == 'Pendiente'">

                <q-btn color="positive" label="Aprobar" size="sm" flat dense @click="approve(props.row)"/>
                <q-btn
                  color="negative"
                  label="Rechazar"
                  size="sm"
                  class="q-ml-sm"
                  flat
                  dense
                  @click="reject(props.row)"
                />
              </template>
            </q-td>
          </q-tr>
        </template>
      </q-table>
    </div>
  </div>
</template>
<script>
import api from "src/api/saleOrder";
import {mapState} from "vuex";
import ButtonExportExcel from "src/components/ButtonExportExcel.vue";


export default {
  components: {ButtonExportExcel},

  data() {
    return {
      dataHistory: [],
      columns: [
        {
          name: "idOrdenVenta",
          label: "Id",
          field: "idOrdenVenta"
        },
        {
          name: "fechaHoraOrdenVenta",
          label: "Fecha de Venta",
          field: "fechaHoraOrdenVenta"
        },
        {
          name: "tituloPublicacion",
          label: "Publicación",
          field: "tituloPublicacion"
        },
        {
          name: "comprador",
          label: "Comprador",
          field: "comprador"
        },
        {
          name: "cantidad",
          label: "Cantidad",
          field: "cantidad"
        },
        {
          name: "totalVenta",
          label: "Total",
          field: "totalVenta"
        },
        {
          name: "estadoOrdenVenta",
          label: "Estado",
          field: "estadoOrdenVenta"
        },
        {
          name: "actions",
          label: "Acciones",
          field: "actions"
        }
      ],
      pagination: {
        rowsPerPage: 15
      },
      filter: "",
      show_dialog: false,
      formTitle: "",
    }
  },
  async mounted() {
    await this.getHistorySales();
  },

  computed: {
    ...mapState("auth", ["user"])
  },

  methods: {
    async getHistorySales() {
      try {
        this.dataHistory = await api.GetHistorySalesByIdSeller(parseInt(this.user.idUser))
        console.log(this.dataHistory);
      } catch (error) {
        console.log(error);
      }
      ;
    },
    async approve(item) {

      console.log(item);
      this.$q
        .dialog({
          title: "Confirmar",
          dark: true,
          message: "Seguro que quieres Aprobar la Venta?",
          cancel: true,
          persistent: true
        })
        .onOk(async () => {
          try {
            this.$q.loading.show();

            await api.AprovveSale({idSaleOrder: item.idOrdenVenta, idBuyOrder: item.idOrdenCompra});
            this.$q.notify({
              type: "positive",
              position: "center",
              message: "Venta Aprobada Exitosamente..."
            });
            await this.getHistorySales();
          } catch (error) {
            this.$q.notify({
              type: "negative",
              position: "center",
              message: "Error Interno, Intente mas Tarde"
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
    async reject(item) {

      console.log(item);
      this.$q
        .dialog({
          title: "Confirmar",
          dark: true,
          message: "Seguro que quieres Rechazar la Venta?",
          cancel: true,
          persistent: true
        })
        .onOk(async () => {
          try {
            this.$q.loading.show();

            await api.RejectSale({idSaleOrder: item.idOrdenVenta, idBuyOrder: item.idOrdenCompra});
            this.$q.notify({
              type: "positive",
              position: "center",
              message: "Venta Rechzada Exitosamente..."
            });
            await this.getHistorySales();
          } catch (error) {
            this.$q.notify({
              type: "negative",
              position: "center",
              message: "Error Interno, Intente mas Tarde"
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
  },
}
</script>
