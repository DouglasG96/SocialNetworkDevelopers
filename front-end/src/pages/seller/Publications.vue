<template>
  <div class="row q-col-gutter-sm">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <q-card class>
        <q-card-section class="text-center text-h6">
          <q-icon name="shopping_cart" class="q-mr-sm" />Nueva Publicación
        </q-card-section>
        <q-card-section>
          <q-form
            ref="formPublication"
            id="formPublication"
            autocomplete="off"
            class="q-pa-md"
            @submit.prevent="addPublication()"
          >
            <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <q-item>
                  <q-input
                    filled
                    class="full-width"
                    v-model="title"
                    label="Titulo"
                    :rules="rules.required"
                    lazy-rules
                  />
                </q-item>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <q-item>
                  <q-input
                    dense
                    outlined
                    type="textarea"
                    class="full-width"
                    v-model="description"
                    label="Descripción / maximo 100 caracteres"
                    maxlength="100"
                  />
                </q-item>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <q-item>
                  <q-file filled bottom-slots v-model="fileImage" label="Subir Imagen" counter >
                    <template v-slot:prepend>
                      <q-icon name="cloud_upload" @click.stop />
                    </template>
                    <template v-slot:append>
                      <q-icon name="close" @click.stop="fileImage = null" class="cursor-pointer" />
                    </template>

                    <template v-slot:hint>tamaño</template>
                  </q-file>
                </q-item>
              </div>
              <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <q-item>
                  <q-input
                    filled
                    type="number"
                    class="full-width"
                    v-model.number="price"
                    label="Precio"
                    :rules="rules.required"
                    lazy-rules
                  />
                </q-item>
              </div>
              <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="q-gutter-sm">
                  <q-checkbox
                    v-model="delivery"
                    color="primary"
                    label="Servicio a Domicilio"
                    true-value="si"
                    false-value="no"
                  />
                </div>

                <div class="q-px-sm">
                  <strong>{{ delivery }}</strong>
                </div>
              </div>
              <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
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
              </div>
              <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <q-item>
                  <q-select
                    filled
                    v-model="subCategory"
                    :options="optionsSubCategory"
                    option-value="idSubCategoria"
                    option-label="nombreSubCategoria"
                    label="Sub-Categoria"
                    :rules="rules.required"
                    style="width: 300px"
                    @input="changeCategory()"
                  />
                </q-item>
              </div>
            </div>

            <div class="row">
              <div class="col-6">
                <q-btn label="Publicar" type="submit" color="positive" />
              </div>
            </div>
          </q-form>
        </q-card-section>
      </q-card>
    </div>
  </div>
</template>
<script>
import api from "src/api/publication";
import { mapState } from "vuex";


export default {
  data() {
    return {
      optionsCategory: [],
      optionsSubCategory: [],

      title: "",
      category: "",
      subCategory: "",
      description: "",
      price: "",
      delivery: "no",
      fileImage: null,
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
      this.optionsCategory = await api.getCategory();
    } catch (error) {
      console.log(error);
    }
  },
  computed: {
    ...mapState("auth", ["user"])
  },

  created () {

  },
  methods: {
    changeCategory() {
      this.getSubcategory();
      console.log(this.category.idCategoria);
    },
    async getSubcategory() {
      try {
        this.optionsSubCategory = await api.getSubCategoryByCategory(
          this.category.idCategoria
        );
      } catch (error) {
        console.log(error);
      }
    },
    async addPublication() {
      //valido formulario
      var validate = await this.$refs.formPublication.validate();
      if (!validate) {
        return;
      }

      try {
        var myFormData = new FormData();
        myFormData.set("titulo", this.title);
        myFormData.set("file", this.fileImage);
        myFormData.set("idCategoria", parseInt(this.category.idCategoria));
        myFormData.set("idSubCategoria", parseInt(this.subCategory.idSubCategoria));
        myFormData.set("idTipoPublicacion", parseInt(1));
        myFormData.set("descripcion", this.description);
        myFormData.set("precio", parseFloat(this.price));
        myFormData.set("idEstadoPublicacion", parseInt(1));
        myFormData.set("idUsuario", parseInt(this.user.idUser));
        myFormData.set("delivery", this.delivery.charAt(0));

        console.log(myFormData);
        //myFormData.append("avatar", this.selectedFile, this.selectedFile.name);
        this.$q.loading.show();
        await api.addPublication(myFormData);
        this.$q.notify({
          type: "positive",
          position: "center",
          message: "Publicación Agregada Correctamente."
        });
        setTimeout(() => {
          this.$router.push({ path: "/MisPublicaciones" }).catch(error => {
            console.log(error);
          });
        }, 4000);

      } catch (error) {
          console.log(error);
      }finally{
        this.$q.loading.hide();

      }
    },

  },

};
</script>