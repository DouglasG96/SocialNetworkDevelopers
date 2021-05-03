// import axios from "axios";
import { api } from 'boot/axios'
import enpoint from './endpoint'

// const url = enpoint;

async function Login (user) {
    var resp = await api.post(`/Login/Login`, user);
    return resp.data;
}
export default {
    Login
}