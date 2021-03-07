import { store } from "quasar/wrappers"

export function loginUser ({commit}, payload) {
    console.log('actions');
     if(payload.user === "admin" && payload.password === "admin")
     {
        commit('setLoginUser', payload)
     }
     else
     {
         store.user = null;
     }
}
