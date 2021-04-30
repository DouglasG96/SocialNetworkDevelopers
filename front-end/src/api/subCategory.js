// import axios from "axios";
// import enpoint from './endpoint'
import { api } from 'boot/axios'


// const url = enpoint;

async function getSubCategoryByCategory (idCategory) {
    var resp = await api.get(`/SubCategory/GetCategories?idCategory=${encodeURIComponent(idCategory)}`);
    return resp.data;
}

export default {
    getSubCategoryByCategory
}