import axios from "axios";
import endpoint from './endpoint'
const url = endpoint;

async function AddPublicationWishList (itemWishList) {
  var resp = await axios.post(`${url}/Wishlist/AddPublicationWishList`, itemWishList);
  return resp.data;
}

async function GetPublicationWishList (idUser) {
  var resp = await axios.get(`${url}/Wishlist/GetPublicationWishList?idUser=${idUser}`);
  return resp.data;
}

async function deleteWishList (idWishList) {
  var resp = await axios.get(`${url}/Wishlist/DeletePublicationWishlist?idWishList=${idWishList}`);
  return resp.data;
}

export default {
  AddPublicationWishList,
  GetPublicationWishList,
  deleteWishList
}
