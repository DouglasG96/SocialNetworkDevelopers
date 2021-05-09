import { api } from 'boot/axios'
// import enpoint from './endpoint'

// const url = enpoint;

async function GetHistoryBuysByIdBuyer(idBuyer) {
  var resp = await api.get(`/BuyOrders/GetHistoryBuysByIdBuyer?idBuyer=${encodeURIComponent(idBuyer)}`);
  return resp.data;
}

async function ReceivedBuyer(buyerOrder) {
  var resp = await api.put(`/BuyOrders/ReceivedBuyer`, buyerOrder);
  return resp.data;
}

async function GetBuySummary () {
  var resp = await api.get(`/BuyOrders/GetBuySummary`);
  return resp.data;
}

export default {
  GetHistoryBuysByIdBuyer,
  ReceivedBuyer,
  GetBuySummary
}
