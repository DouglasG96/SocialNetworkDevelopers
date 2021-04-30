// import axios from "axios";
// import enpoint from './endpoint'
import { api } from 'boot/axios'


// const url = enpoint;

async function addSale(saleOrder) {
    var resp = await api.post(`/SaleOrders/AddSale`, saleOrder);
    return resp.data;
}

async function GetHistorySalesByIdSeller (idSeller) {
    var resp = await api.get(`/SaleOrders/GetHistorySalesByIdSeller?idSeller=${encodeURIComponent(idSeller)}`);
    return resp.data;
}

export default {
    addSale,
    GetHistorySalesByIdSeller
}