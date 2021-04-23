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
              autocomplete="off"
              class="q-pa-md"
              @submit.prevent="publication"
            >
              <q-select
                filled
                v-model="title"
                :options="options"
                label="Tipo de Usuario"
                :rules="rules.required"
              />
              <q-input
                filled
                v-model="name"
                label="Nombres"
                lazy-rules
                :rules="rules.required"
                class="text-lowercase"
              />
              <q-input
                filled
                v-model="lastName"
                label="Apellidos"
                lazy-rules
                :rules="rules.required"
                class="text-lowercase"
              />

              <q-input
                filled
                v-model="dui"
                label="dui"
                lazy-rules
                :rules="rules.required"
              />
              <q-input
                filled
                v-model="nit"
                label="nit"
                lazy-rules
                :rules="rules.required"
              />
              <q-input
                filled
                v-model="phone"
                label="telefono"
                lazy-rules
                :rules="rules.required"
              />
              <q-input
                filled
                type="email"
                v-model="email"
                label="correo"
                lazy-rules
                :rules="rules.required"
                class="text-lowercase"
              />
              <q-input
                type="password"
                filled
                v-model="password"
                label="contraseña"
                lazy-rules
                :rules="rules.required"
                class="text-lowercase"
              />

              <div class="row">
                <div class="col-6">
                  <q-btn label="Registrarse" type="submit" color="positive" />
                </div>
                <div class="col-6">
                  <q-btn
                    label="Login"
                    to="/Login"
                    color="secondary"
                    class="q-ml-sm"
                  />
                </div>
              </div>
            </q-form>
          </q-card-section>
        </q-card>
      </div>
    </div>
</template>
<script>
export default {
      data() {
    return {
      rol: null,
      options: [
        {
          label: "Usuario",
          value: "1"
        },
        {
          label: "Vendedor",
          value: "2"
        }
      ],
      name: "",
      lastName: "",
      email: "",
      password: "",
      dui: "",
      nit: "",
      phone: "",
      rules: {
        required: [v => !!v || "Campo Requerido."],
        requiredNumber: [
          val => (val !== null && val !== "") || "Please type your age",
          val => (val > 0 && val < 100) || "Please type a real age"
        ]
      }
    };
  },
}
</script>