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
            reject(error.response)
        }
    })
}
export async function logoutUsers ({ commit }) {
    return new Promise((resolve, reject) => {
        try {            
            commit('logout')
            LocalStorage.remove('token');
            resolve()
        } catch (error) {
           reject(error)
        }
    })
}