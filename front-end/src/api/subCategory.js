import api from "axios";
import endpoint from './endpoint'
import category from "src/api/category";
const url = endpoint;


async function getSubCategoryByCategory (idCategory) {
    var resp = await api.get(`${url}/SubCategory/GetSubCategoryByCategory?idCategory=${encodeURIComponent(idCategory)}`);
    return resp.data;
}

async function GetAllSubCategories () {
    var resp = await api.get(`${url}/SubCategory/GetAllSubCategories`);
    return resp.data;
}

export default {
  ...category,
  getSubCategoryByCategory,
  GetAllSubCategories
}
