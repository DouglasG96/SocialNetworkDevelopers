const routes = [
  {
    path: '/',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { path: '/', component: () => import('pages/buyer/ProductCatalogues.vue'), meta: { requireAuth: true }},

      { path: '/DetailProduct', component: () => import('pages/buyer/DetailProduct.vue'), meta: { requireAuth: true }},
      { path: '/Publications', component: () => import('pages/seller/Publications.vue'), meta: { requireAuth: true } },
      {
        path: '/HistorialVentas',
        component: () => import('pages/seller/HistorySales.vue'),
        meta: { requireAuth: true }
      },
      {
        path: '/MisPublicaciones',
        component: () => import('pages/seller/MyPublications.vue'),
        meta: { requireAuth: true }
      },
      {
        path: '/Mantenimientos/Usuarios',
        component: () => import('pages/mantenimientos/usuarios/UsersMaintenance.vue'),
        meta: {requireAuth: false},
      },
      {
        path: '/Mantenimientos/Categorias',
        component: () => import('pages/mantenimientos/categorias/CategoriesMaintenance.vue'),
        meta: {requireAuth: false}
      },,
      {
        path: '/Mantenimientos/SubCategorias',
        component: () => import('pages/mantenimientos/categorias/SubCategoriesMaintenance.vue'),
        meta: {requireAuth: false}
      },
      {
        path: '/Estadisticas',
        component: () => import('pages/Estadisticas.vue'),
        meta: {requireAuth: false}
      },
      {path: '/HistorialCompras', component: () => import('pages/buyer/HistoryBuyer.vue'), meta: {requireAuth: true}},

    ]
  },

  {
    path: '/Login',
    component: () => import('pages/Login-1.vue'),
    meta: {requireAuth: false}
  },
  {
    path: '/RestorePassWord',
    component: () => import('pages/RestorePassword.vue'),
    meta: {requireAuth: false}
  },
  {
    path: '/Register',
    component: () => import('pages/Register.vue'),
    meta: {requireAuth: false}
  },
]

// Always leave this as last one
if (process.env.MODE !== 'ssr') {
  routes.push({
    path: '*',
    component: () => import('pages/Error404.vue')
  })
}

export default routes
