<template>
  <div class="q-pa-sm q-gutter-sm">
    <div class="row items-start">
        <q-item>
          <q-btn
            outline
            color="primary"
            label="Nueva Sub Categoria"
            icon-right="add"
            style="height: 55px"
            @click="show_dialog = true"
            no-caps
          ></q-btn>
        </q-item>
        <q-item>
          <q-select
            filled
            v-model="category"
            :options="optionsCategory"
            option-value="idCategoria"
            option-label="nombreCategoria"
            label="Categoria"
            :rules="rules.required"
            style="width: 300px"
            @input="changeCategory()"
          />
        </q-item>
        <q-item>
          <q-btn
            round color="green"
            icon="refresh"
            @click="changeCategory()"
          ></q-btn>
        </q-item>
    </div>
    <!-- Dialogo para agregar y editar Registros -->
    <q-table
      title="Treats"
      :data="data"
      :columns="columns"
      row-key="name"
      :pagination.sync="pagination"
      binary-state-sort
    >
      <template v-slot:top>
        <div class="row q-col-gutter-sm">
          <q-dialog v-model="show_dialog">
            <div>
              <q-form ref="formSubCategoria" autocomplete="off">
                <q-card>
                  <q-card-section>
                    <div class="text-h6">{{formTitle}}</div>
                  </q-card-section>
                  <q-card-section>
                    <div class="row">
                      <div class="col-12">
                        <q-item>
                          <q-select
                            filled
                            v-model="categoryModal"
                            :options="optionsCategory"
                            option-value="idCategoria"
                            option-label="nombreCategoria"
                            label="Categoria"
                            :rules="rules.required"
                            class="col-12"
                          />
                        </q-item>
                      </div>
                      <div class="col-12">
                        <q-item>
                          <q-input
                            filled
                            v-model="editedItem.nombreSubCategoria"
                            label="Nombre de la Sub Categoria"
                            lazy-rules
                            :rules="rules.required"
                            class="col-12"
                          ></q-input>
                        </q-item>
                      </div>
                      <div class="col-12">
                        <q-item>
                          <q-select
                            filled
                            v-model="editedItem.estadoSubCategoria"
                            :options="optionsEstadoSubCategoria"
                            option-value="value"
                            option-label="label"
                            label="Estado de la sub categoria"
                            :rules="rules.required"
                            class="col-12"
                          />
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
          <q-td key="idSubCategoria" :props="props">
            {{ props.row.idSubCategoria }}
            <q-popup-edit v-model="props.row.idSubCategoria">
              <q-input v-model="props.row.idSubCategoria" dense autofocus></q-input>
            </q-popup-edit>
          </q-td>
          <q-td key="nombreSubCategoria" :props="props">
            <div class="text-pre-wrap">{{ props.row.nombreSubCategoria }}</div>
            <q-popup-edit v-model="props.row.nombreSubCategoria">
              <q-input v-model="props.row.nombreSubCategoria" dense autofocus></q-input>
            </q-popup-edit>
          </q-td>
          <q-td key="estadoSubCategoria" :props="props">
            <div class="text-pre-wrap">{{ (props.row.estadoSubCategoria === 1) ? 'Activo' : 'Inactivo'}}</div>
            <q-popup-edit v-model="props.row.estadoSubCategoria">
              <q-input v-model="props.row.estadoSubCategoria" dense autofocus></q-input>
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
          </q-td>
        </q-tr>
      </template>
    </q-table>
  </div>
</template>

<script>
import subCategory from "src/api/subCategory";
import category from "src/api/category";
import { mapState } from "vuex";

export default {
  data() {
    return {
      optionsCategory: [],
      optionsEstadoSubCategoria: [
        {
          label: 'Activo',
          value : 1
        },
        {
          label:'Inactivo',
          value:  0
        }
      ],
      category: "",
      categoryModal: "",
      show_dialog: false,
      editedIndex: -1,
      editedItem: {
        idSubCategoria: 0,
        estadoSubCategoria: 0,
        nombreSubCategoria: "",
        idCategoria: 0
      },
      columns: [
        {
          name: "idSubCategoria",
          label: "ID",
          field: "idSubCategoria"
        },
        {
          name: "nombreSubCategoria",
          label: "Nombre de Sub Categoria",
          field: "nombreSubCategoria"
        },
        {
          name: "estadoSubCategoria",
          label: "Estado",
          field: "estadoSubCategoria"
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
      data: [],
      rules: {
        required: [v => !!v || "Campo Requerido."],
        requiredNumber: [
          val => (val !== null && val !== "") || "Please type your age",
          val => (val > 0 && val < 100) || "Please type a real age"
        ]
      }
    };
  },
  async mounted() {
    try {
      this.optionsCategory = await category.getCategory();
    } catch (error) {
      console.log(error);
    }
  },
  computed: {
    formTitle() {
      return this.editedIndex === -1
        ? "Nueva Sub Categoria"
        : "Editar Sub Categoria";
    },
      ...mapState("auth", ["user"])
  },
  methods: {
    async changeCategory() {
      await this.getSubcategory();
    },
    async getSubcategory() {
      try {
        const resp = await subCategory.getSubCategoryByCategory(
          this.category.idCategoria
        );
        this.data = resp
      } catch (error) {
        console.log(error);
      }
    },
    editItem(item) {
      this.editedIndex = this.data.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.show_dialog = true;
    },
    close() {
      this.show_dialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
      this.$refs.formSubCategoria.resetValidation();
    },
    async save() {
      //valido formulario
      var validate = await this.$refs.formSubCategoria.validate();
      if (!validate) {
        return;
      }

      //Edito usuario
      if (this.editedIndex > -1) {
        try {
          let resp = await subCategory.EditSubCategory( {
            IdSubCategoria: this.editedItem.idSubCategoria,
            IdCategoria: this.categoryModal.idCategoria,
            NombreSubCategoria: this.editedItem.nombreSubCategoria,
            EstadoSubCategoria: this.editedItem.estadoSubCategoria.value
          });
          this.$q.notify({
            type: "positive",
            position: "center",
            message: "Sub Categoria Editada Correctamente"
          });
          this.close();
          await this.getSubcategory();
        } catch (error) {
          console.log(error);
          this.$q.notify({
            type: "negative",
            position: "center",
            message: "Error Interno, Intente mas Tarde"
          });
        }
      } else {
        try {
          let resp = await subCategory.AddSubCategory({
            IdCategoria: this.categoryModal.idCategoria,
            NombreSubCategoria: this.editedItem.nombreSubCategoria,
            EstadoSubCategoria: this.editedItem.estadoSubCategoria.value
          });
          this.$q.notify({
            type: "positive",
            position: "center",
            message: "Sub Categoria Creada Correctamente"
          });
          this.close();
          await this.getSubcategory();
        } catch (error) {
          console.log(error);
          this.$q.notify({
            type: "negative",
            position: "center",
            message: "Error Interno, Intente mas Tarde"
          });
        }
      }
    }
  }
};
</script>

<style scoped></style>
