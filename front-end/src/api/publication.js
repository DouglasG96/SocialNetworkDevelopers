import axios from "axios";
import enpoint from './endpoint'
import  category from "./category";
import subCategory from "./subCategory";

const url = enpoint;

async function getPublications() {
    var resp = await axios.get(`${url}/Publications/GetPublications`);
    return resp.data;
}
async function getPublicationsByIdUser(idUser) {
    var resp = await axios.get(`${url}/Publications/GetPublicationByIdUser?idUser=${encodeURIComponent(idUser)}`);
    return resp.data;
}

async function addPublication (publication) {
    var resp = await axios.post(`${url}/Publications/AddPublication`, publication
        , { headers: { "Content-Type": "multipart/form-data" } });
    return resp.data;
}

export default{
    getPublications,
    addPublication,
    getPublicationsByIdUser,
    ...category,
    ...subCategory,
}