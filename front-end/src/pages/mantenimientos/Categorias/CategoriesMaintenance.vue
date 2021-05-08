<template>
  <div class="q-pa-sm q-gutter-sm">
    <q-btn
      dense
      color="secondary"
      label="Nuevo Usuario"
      @click="show_dialog = true"
      no-caps
    ></q-btn>
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
                          <q-input
                            filled
                            v-model="editedItem.idRol"
                            label="Rol"
                            lazy-rules
                            :rules="rules.required"
                          ></q-input>
                        </q-item>
                      </div>
                      <div class="col-6">
                        <q-item>
                          <q-input
                            filled
                            v-model="editedItem.nombres"
                            label="Nombres"
                            lazy-rules
                            :rules="rules.required"
                          ></q-input>
                        </q-item>
                      </div>
                      <div class="col-6">
                        <q-item>
                          <q-input
                            filled
                            v-model="editedItem.apellidos"
                            label="Apellidos"
                            lazy-rules
                            :rules="rules.required"
                          ></q-input>
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
          <q-td key="IdRol" :props="props">
            {{ props.row.idRol }}
            <q-popup-edit
              v-model="props.row.idRol"
              title="Actualizar Id Rol"
              buttons
            >
              <q-input
                type="number"
                v-model="props.row.idRol"
                dense
                autofocus
              ></q-input>
            </q-popup-edit>
          </q-td>
          <q-td key="Nombre" :props="props">
            <div class="text-pre-wrap">{{ props.row.nombres }}</div>
            <q-popup-edit v-model="props.row.nombres">
              <q-input v-model="props.row.nombres" dense autofocus></q-input>
            </q-popup-edit>
          </q-td>
          <q-td key="Apellidos" :props="props">
            <div class="text-pre-wrap">{{ props.row.apellidos }}</div>
            <q-popup-edit v-model="props.row.apellidos">
              <q-input v-model="props.row.apellidos" dense autofocus></q-input>
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
</template>

<script>
import api from "src/api/user";
export default {
  data() {
    return {
      show_dialog: false,
      editedIndex: -1,
      editedItem: {
        idUsuario: null,
        idRol: null,
        nombres: null,
        apellidos: null
      },
      columns: [
        {
          name: "IdUsuario",
          label: "ID",
          field: "idUsuario"
        },
        {
          name: "IdRol",
          label: "Rol",
          field: "idRol"
        },
        {
          name: "Nombre",
          label: "Nombres",
          field: "nombres"
        },
        {
          name: "Apellidos",
          label: "Apellidos",
          field: "apellidos"
        },
        {
          name: "actions",
          label: "Actions",
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
    this.getUsers();
  },
  computed: {
    formTitle() {
      return this.editedIndex === -1
        ? "Nuevo Usuario"
        : "Editar Usuario";
    },
  },
  methods: {
    async getUsers() {
      try {
        const resp = await api.getUsers();
        this.data = resp;
      } catch (error) {
        console.log(error);
      }
    },
    async deleteItem(item) {
      this.$q
        .dialog({
          title: "Confirm",
          dark: true,
          message: "Seguro que quieres Eliminar El Registro?",
          cancel: true,
          persistent: true
        })
        .onOk(async () => {
          try {
            await api.deleteUser(item.idUsuario);
            const index = this.data.indexOf(item);
            this.data.splice(index, 1);
            this.$q.notify({
              type: "positive",
              position: "center",
              message: "Usuario Eliminado Correctamente"
            });
          } catch (error) {
            this.$q.notify({
              type: "negative",
              position: "center",
              message: "Error Interno, Intente mas Tarde"
            });
          }
        })
        .onOk(() => {
          // console.log('>>>> second OK catcher')
        })
        .onCancel(() => {
          console.log(">>>> Cancel");
        })
        .onDismiss(() => {
          // console.log('I am triggered on both OK and Cancel')
        });
    },
    editItem(item) {
      this.editedIndex = this.data.indexOf(item);
      this.editedItem = Object.assign({}, item);
      console.log(this.editedItem);
      this.show_dialog = true;
    },
    close() {
      this.show_dialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
      this.$refs.formUser.resetValidation();
    },
    async save() {
      //valido formulario
      var validate = await this.$refs.formUser.validate();
      if (!validate) {
        return;
      }

      //Edito usuario
      if (this.editedIndex > -1) {
        try {
          await api.updateUser(this.editedItem.idUsuario, {
            idUsuario: this.editedItem.idUsuario,
            idRol: this.editedItem.idRol,
            nombreCompleto:
              this.editedItem.nombres + " " + this.editedItem.apellidos,
            nombres: this.editedItem.nombres,
            apellidos: this.editedItem.apellidos
          });
          this.$q.notify({
            type: "positive",
            position: "center",
            message: "Usuario Editado Correctamente"
          });
          this.close();
          await this.getUsers();
        } catch (error) {
          console.log(error);
          this.$q.notify({
            type: "negative",
            position: "center",
            message: "Error Interno, Intente mas Tarde"
          });
        }
      } else {
        //creo usuario
        try {
          await api.addUser({
            idRol: this.editedItem.idRol,
            nombreCompleto:
              this.editedItem.nombres + " " + this.editedItem.apellidos,
            nombres: this.editedItem.nombres,
            apellidos: this.editedItem.apellidos
          });
          this.$q.notify({
            type: "positive",
            position: "center",
            message: "Usuario Creado Correctamente"
          });
          this.close();
          await this.getUsers();
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
