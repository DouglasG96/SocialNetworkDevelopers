import axios from "axios";
import enpoint from './endpoint'

const url = enpoint;

async function addSale(saleOrder) {
    var resp = await axios.post(`${url}/SaleOrders/AddSale`, saleOrder);
    return resp.data;
}

export default {
    addSale
}