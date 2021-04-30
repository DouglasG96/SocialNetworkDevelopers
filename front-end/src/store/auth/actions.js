import { store } from "quasar/wrappers"
import { api } from 'boot/axios'
import { LocalStorage } from 'quasar'
import apiEndpoints  from "../../api/auth"

export async function loginUser ({ commit }, payload) {
    return  new Promise( async (resolve, reject) => {
        try {
            const resp = await apiEndpoints.Login(payload);
            LocalStorage.set('token', resp)
            commit('auth_success', resp)
            api.defaults.headers.common['Authorization'] = 'Bearer ' + resp //configuro token para axios
            // commit('getUser', resp);
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

export async function readToken({commit}){
    const token = LocalStorage.getItem('token');
    if(token){
        commit('auth_success', token)
    }
    else{
        commit('auth_success', '')

    }
}