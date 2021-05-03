// import axios from "axios";
import { api } from 'boot/axios'
// import enpoint from './endpoint'
import  category from "./category";
import subCategory from "./subCategory";
import { LocalStorage } from 'quasar'


// const url = enpoint;

//const axiosHeader = { headers: { "Content-type": "application/json", Authorization: `Bearer ${LocalStorage.getItem('token')}` } }

async function getPublications() {
    var resp = await api.get(`/Publications/GetPublications` );
    return resp.data;
}
async function getPublicationsByIdUser(idUser) {
    var resp = await api.get(`/Publications/GetPublicationByIdUser?idUser=${encodeURIComponent(idUser)}`);
    return resp.data;
}

async function addPublication (publication) {
    var resp = await api.post(`/Publications/AddPublication`, publication
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