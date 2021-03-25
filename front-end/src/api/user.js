import axios from "axios";
import enpoint from './endpoint'

const url = enpoint;

async function getUsers () {
    var resp = await axios.get(`${url}/Users/GetUsers`);
    return resp.data;
}
async function addUser (user) {
    var resp = await axios.post(`${url}/Users/AddUser`, user);
    return resp.data;
}

export default
{
    getUsers, 
    addUser
}