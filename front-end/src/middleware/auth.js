 function auth (to, from, next, store) {
    if (to.meta.requireAuth) {
        //si existe token
        if (store.getters['auth/isLoggedIn']) {
            next()
            return
        }
        next('/Login');
    } else {
        next()
    }
}

export default{
    auth
}