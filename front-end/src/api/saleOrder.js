import axios from "axios";
import enpoint from './endpoint'

const url = enpoint;

async function addSale(saleOrder) {
    var resp = await axios.post(`${url}/SaleOrders/AddSale`, saleOrder);
    return resp.data;
}

async function GetHistorySalesByIdSeller (idSeller) {
    var resp = await axios.get(`${url}/SaleOrders/GetHistorySalesByIdSeller?idSeller=${encodeURIComponent(idSeller)}`);
    return resp.data;
}

export default {
    addSale,
    GetHistorySalesByIdSeller
}