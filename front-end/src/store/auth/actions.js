import { store } from "quasar/wrappers"
import { LocalStorage } from 'quasar'
import api from "../../api/users"

export async function loginUser ({ commit }, payload) {
    return  new Promise( async (resolve, reject) => {
        try {
            const resp = await api.Login(payload);
            LocalStorage.set('token', JSON.stringify(resp))
            commit('auth_success', resp);
            resolve(resp);
        } catch (error) {
            console.log(error.response);
            reject(error)
        }
    })
}
export  function logout ({ commit }) {
    return new Promise((resolve, reject) => {
        commit('logout')
        LocalStorage.remove('token');
        resolve()
    })
}