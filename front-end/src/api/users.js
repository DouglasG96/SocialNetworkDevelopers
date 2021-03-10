import axios from "axios";
import enpoint from './endpoint'

const url = enpoint;

async function Login (user) {
    var resp = await axios.post(`${url}/Login`, user);
    return resp.data;
}
export default {
    Login
}