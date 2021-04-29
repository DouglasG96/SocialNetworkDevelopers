import axios from "axios";
import endpoint from './endpoint'
const url = endpoint;

async function addWishList (user) {
  var resp = await axios.post(`${url}/Users/AddUser`, user);
  return resp.data;
}

async function deleteWishList (user) {
  var resp = await axios.post(`${url}/Users/AddUser`, user);
  return resp.data;
}

export default {
  addWishList,
  deleteWishList
}
