// import Vue from 'vue'
// import axios from 'axios'

// Vue.prototype.$axios = axios
import Vue from 'vue'
import axios from 'axios'
import { LocalStorage } from 'quasar'


Vue.prototype.$axios = axios
// ^ ^ ^ this will allow you to use this.$axios
//       so you won't necessarily have to import axios in each vue file

const api = axios.create({ baseURL: 'http://localhost:50886/api/v1' })
Vue.prototype.$api = api

axios.interceptors.response.use(response => {
    return response;
}, error => {
    if (error.response.status === 401) {
        // router.push("/login");
        LocalStorage.remove('token');
        window.location = '/Login'
    }
});

export { axios, api }
