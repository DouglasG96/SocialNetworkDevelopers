import axios from "axios";
import enpoint from './endpoint'

const url = enpoint;

async function GetHistoryBuysByIdBuyer(idBuyer) {
  var resp = await axios.get(`${url}/BuyOrders/GetHistoryBuysByIdBuyer?idBuyer=${encodeURIComponent(idBuyer)}`);

  return resp.data;
}

export default {
  GetHistoryBuysByIdBuyer
}
