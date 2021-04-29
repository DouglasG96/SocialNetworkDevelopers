<template>
  <div class="row q-col-gutter-sm">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <q-card class>
        <q-card-section class="text-center text-h6">
          <q-icon name="history" class="q-mr-sm" />Historial de Ventas
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
        <!-- Dialogo para agregar y editar Registros -->
        <template v-slot:top>
                  <q-space />
        <q-input borderless dense debounce="300" color="primary" v-model="filter">
          <template v-slot:append>
            <q-icon name="search" />
          </template>
        </q-input>
          <div class="row q-col-gutter-sm">
            <!-- <q-dialog v-model="show_dialog">
              <div>
                <q-form ref="formUser" autocomplete="off">
                  <q-card>
                    <q-card-section>
                      <div class="text-h6">{{formTitle}}</div>
                    </q-card-section>
                    <q-card-section>
                      <div class="row">
                        <div class="col-6">
                          <q-item>
                            <h2>prueba</h2>
                          </q-item>
                        </div>
                      </div>
                    </q-card-section>

                    <q-card-actions align="right">
                      <q-btn flat color="negative" label="Cancelar" @click="close()" />
                      <q-btn flat label="OK" color="positive" @click="save"></q-btn>
                    </q-card-actions>
                  </q-card>
                </q-form>
              </div>
            </q-dialog> -->
          </div>
        </template>

        <!-- Renderiza data en tabla -->
        <template v-slot:body="props">
          <q-tr :props="props">
            <q-td key="idOrdenVenta" :props="props">
              {{ props.row.idOrdenVenta }}
              <q-popup-edit v-model="props.row.idOrdenVenta">
                <q-input v-model="props.row.idOrdenVenta" dense autofocus></q-input>
              </q-popup-edit>
            </q-td>
            <q-td key="fechaHoraOrdenVenta" :props="props">
              {{ props.row.fechaHoraOrdenVenta }}
              <q-popup-edit v-model="props.row.fechaHoraOrdenVenta">
                <q-input v-model="props.row.fechaHoraOrdenVenta" dense autofocus></q-input>
              </q-popup-edit>
            </q-td>
            <q-td key="tituloPublicacion" :props="props">
              {{ props.row.tituloPublicacion }}
              <q-popup-edit v-model="props.row.tituloPublicacion">
                <q-input v-model="props.row.tituloPublicacion" dense autofocus></q-input>
              </q-popup-edit>
            </q-td>
            <q-td key="cantidad" :props="props">
              {{ props.row.cantidad }}
              <q-popup-edit v-model="props.row.cantidad">
                <q-input v-model="props.row.cantidad" dense autofocus></q-input>
              </q-popup-edit>
            </q-td>
            <q-td key="estadoOrdenVenta" :props="props">
              {{ props.row.estadoOrdenVenta }}
              <q-popup-edit v-model="props.row.estadoOrdenVentatidad">
                <q-input v-model="props.row.estadoOrdenVenta" dense autofocus></q-input>
              </q-popup-edit>
            </q-td>
            <q-td key="actions" :props="props">
              <q-btn color="positive" label="Aprobar" size="sm" flat dense @click="approve(props.row)" />
              <q-btn
                color="negative"
                label="Rechazar"
                size="sm"
                class="q-ml-sm"
                flat
                dense
                @click="reject(props.row)"
              />
            </q-td>
          </q-tr>
        </template>
      </q-table>
    </div>
  </div>
</template>
<script>
import api from "src/api/saleOrder";
import { mapState } from "vuex";

export default {
  data () {
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
          name: "cantidad",
          label: "Cantidad",
          field: "cantidad"
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
  async mounted () {
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
    };
    },
    approve(item){
      console.log(item);
        //     this.$q
        // .dialog({
        //   title: "Confirm",
        //   dark: true,
        //   message: "Seguro que quieres Eliminar El Registro?",
        //   cancel: true,
        //   persistent: true
        // })
        // .onOk(async () => {
        //   try {
        //     await api.deleteUser(item.idUsuario);
        //     const index = this.data.indexOf(item);
        //     this.data.splice(index, 1);
        //     this.$q.notify({
        //       type: "positive",
        //       position: "center",
        //       message: "Usuario Eliminado Correctamente"
        //     });
        //   } catch (error) {
        //     this.$q.notify({
        //       type: "negative",
        //       position: "center",
        //       message: "Error Interno, Intente mas Tarde"
        //     });
        //   }
        // })
        // .onOk(() => {
        //   // console.log('>>>> second OK catcher')
        // })
        // .onCancel(() => {
        //   console.log(">>>> Cancel");
        // })
        // .onDismiss(() => {
        //   // console.log('I am triggered on both OK and Cancel')
        // });
    },
    reject(item){
      console.log(item);
    }
  },
}
</script>