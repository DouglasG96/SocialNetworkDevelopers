import axios from "axios";
import enpoint from './endpoint'

const url = enpoint;

async function getBuyHistory(idUser) {
  var resp = await axios.post(`${url}/BuyOrders/GetHistoryBuysByIdBuyer`, idUser);
  return resp.data;
}

export default {
  getBuyHistory
}
