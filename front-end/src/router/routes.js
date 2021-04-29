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
        meta: {requireAuth: false}
      },
      {path: '/HistorialCompras', component: () => import('pages/buyer/HistoryBuyer.vue'), meta: {requireAuth: true}},

      // { path: '', component: () => import('pages/Dashboard.vue'),},
      // { path: '/Dashboard2', component: () => import('pages/Dashboard2.vue'),},
      // { path: '/Profile', component: () => import('pages/UserProfile.vue'), meta: { requireAuth: true }},
      // {path: '/Map', component: () => import('pages/Map.vue')},
      // {path: '/MapMarker', component: () => import('pages/MapMarker.vue')},
      // {path: '/StreetView', component: () => import('pages/StreetView.vue')},
      // {path: '/TreeTable', component: () => import('pages/TreeTable.vue')},
      // {path: '/Charts', component: () => import('pages/Charts.vue')},
      // {path: '/Cards', component: () => import('pages/Cards.vue')},
      // {path: '/Tables', component: () => import('pages/Tables.vue')},
      // {path: '/Contact', component: () => import('pages/Contact.vue')},
      // {path: '/Calendar', component: () => import('pages/Calendar.vue')},
      // {path: '/Pagination', component: () => import('pages/Pagination.vue')},
      // {path: '/Taskboard', component: () => import('pages/TaskBoard.vue')},
    ]
  },

  {
    path: '/Login',
    component: () => import('pages/Login-1.vue'),
    meta: {requireAuth: false}
  },
  {
    path: '/Register',
    component: () => import('pages/Register.vue'),
    meta: {requireAuth: false}
  },
  // {
  //   path: '/Maintenance',
  //   component: () => import('pages/Maintenance.vue')
  // },
  // {
  //   path: '/Mail',
  //   component: () => import('layouts/Mail.vue')
  // },
  // {
  //   path: '/Lock-2',
  //   component: () => import('pages/LockScreen-2.vue')
  // }
]

// Always leave this as last one
if (process.env.MODE !== 'ssr') {
  routes.push({
    path: '*',
    component: () => import('pages/Error404.vue')
  })
}

export default routes
