import { api } from 'boot/axios'
// import enpoint from './endpoint'

// const url = enpoint;

async function GetHistoryBuysByIdBuyer(idBuyer) {
  var resp = await api.get(`/BuyOrders/GetHistoryBuysByIdBuyer?idBuyer=${encodeURIComponent(idBuyer)}`);

  return resp.data;
}

export default {
  GetHistoryBuysByIdBuyer
}
