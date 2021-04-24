import axios from "axios";
import enpoint from './endpoint'

const url = enpoint;

async function getSubCategoryByCategory (idCategory) {
    var resp = await axios.get(`${url}/SubCategory/GetCategories?idCategory=${encodeURIComponent(idCategory)}`);
    return resp.data;
}

export default {
    getSubCategoryByCategory
}