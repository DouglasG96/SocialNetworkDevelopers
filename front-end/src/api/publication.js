import axios from "axios";
import enpoint from './endpoint'

const url = enpoint;

async function getPublications() {
    var resp = await axios.get(`${url}/Publications/GetPublications`);
    return resp.data;
}

export default{
    getPublications
}