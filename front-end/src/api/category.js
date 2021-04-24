import axios from "axios";
import enpoint from './endpoint'
import subCategory from "./subCategory";


const url = enpoint;

async function getCategory() {
    var resp = await axios.get(`${url}/Categories/GetCategories`);
    return resp.data;
}

export default {
    getCategory,
    ...subCategory,
}