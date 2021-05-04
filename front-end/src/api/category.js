// import axios from "axios";
// import enpoint from './endpoint'
import { api } from 'boot/axios'
import subCategory from "./subCategory";


// const url = enpoint;

async function getCategory() {
    var resp = await api.get(`/Categories/GetCategories`);
    return resp.data;
}

export default {
    getCategory,
    ...subCategory,
}