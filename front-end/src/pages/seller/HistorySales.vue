<template>
  <div class="row q-col-gutter-sm">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <q-card class>
        <q-card-section class="text-center text-h6">
          <q-icon name="history" class="q-mr-sm" />Historial de Ventas
        </q-card-section>
      </q-card>
    <q-table
      title="Treats"
      :data="data"
      :columns="columns"
      row-key="name"
      :pagination.sync="pagination"
      binary-state-sort
    >
      <!-- Dialogo para agregar y editar Registros -->
      <template v-slot:top>
        <q-btn
          dense
          color="secondary"
          label="Nuevo Usuario"
          @click="show_dialog = true"
          no-caps
        ></q-btn>

        <div class="row q-col-gutter-sm">
          <q-dialog v-model="show_dialog">
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
                    <q-btn
                      flat
                      label="OK"
                      color="positive"
                      @click="save"
                    ></q-btn>
                  </q-card-actions>
                </q-card>
              </q-form>
            </div>
          </q-dialog>
        </div>
      </template>

      <!-- Renderiza data en tabla -->
      <template v-slot:body="props">
        <q-tr :props="props">
          <q-td key="IdUsuario" :props="props">
            {{ props.row.idUsuario }}
            <q-popup-edit v-model="props.row.idUsuario">
              <q-input v-model="props.row.idUsuario" dense autofocus></q-input>
            </q-popup-edit>
          </q-td>
          <q-td key="actions" :props="props">
            <q-btn
              icon="edit"
              size="sm"
              flat
              dense
              @click="editItem(props.row)"
            />
            <q-btn
              icon="delete"
              size="sm"
              class="q-ml-sm"
              flat
              dense
              @click="deleteItem(props.row)"
            />
          </q-td>
        </q-tr>
      </template>
    </q-table>
    </div>
  </div>
</template>
<script>
export default {
  data () {
    return {
      columns: [
        {
          name: 'name',
          required: true,
          label: 'Dessert (100g serving)',
          align: 'left',
          field: row => row.name,
          format: val => `${val}`,
          sortable: true
        },
        { name: 'calories', align: 'center', label: 'Calories', field: 'calories', sortable: true },
        { name: 'fat', label: 'Fat (g)', field: 'fat', sortable: true },
        { name: 'carbs', label: 'Carbs (g)', field: 'carbs' },
        { name: 'protein', label: 'Protein (g)', field: 'protein' },
        { name: 'sodium', label: 'Sodium (mg)', field: 'sodium' },
        { name: 'calcium', label: 'Calcium (%)', field: 'calcium', sortable: true, sort: (a, b) => parseInt(a, 10) - parseInt(b, 10) },
        { name: 'iron', label: 'Iron (%)', field: 'iron', sortable: true, sort: (a, b) => parseInt(a, 10) - parseInt(b, 10) }
      ],
      data: [
        {
          name: 'Frozen Yogurt',
          calories: 159,
          fat: 6.0,
          carbs: 24,
          protein: 4.0,
          sodium: 87,
          calcium: '14%',
          iron: '1%'
        },
        {
          name: 'Ice cream sandwich',
          calories: 237,
          fat: 9.0,
          carbs: 37,
          protein: 4.3,
          sodium: 129,
          calcium: '8%',
          iron: '1%'
        },
        {
          name: 'Eclair',
          calories: 262,
          fat: 16.0,
          carbs: 23,
          protein: 6.0,
          sodium: 337,
          calcium: '6%',
          iron: '7%'
        },
        {
          name: 'Cupcake',
          calories: 305,
          fat: 3.7,
          carbs: 67,
          protein: 4.3,
          sodium: 413,
          calcium: '3%',
          iron: '8%'
        },
        {
          name: 'Gingerbread',
          calories: 356,
          fat: 16.0,
          carbs: 49,
          protein: 3.9,
          sodium: 327,
          calcium: '7%',
          iron: '16%'
        },
        {
          name: 'Jelly bean',
          calories: 375,
          fat: 0.0,
          carbs: 94,
          protein: 0.0,
          sodium: 50,
          calcium: '0%',
          iron: '0%'
        },
        {
          name: 'Lollipop',
          calories: 392,
          fat: 0.2,
          carbs: 98,
          protein: 0,
          sodium: 38,
          calcium: '0%',
          iron: '2%'
        },
        {
          name: 'Honeycomb',
          calories: 408,
          fat: 3.2,
          carbs: 87,
          protein: 6.5,
          sodium: 562,
          calcium: '0%',
          iron: '45%'
        },
        {
          name: 'Donut',
          calories: 452,
          fat: 25.0,
          carbs: 51,
          protein: 4.9,
          sodium: 326,
          calcium: '2%',
          iron: '22%'
        },
        {
          name: 'KitKat',
          calories: 518,
          fat: 26.0,
          carbs: 65,
          protein: 7,
          sodium: 54,
          calcium: '12%',
          iron: '6%'
        }
      ]
    }
  }
}
</script>