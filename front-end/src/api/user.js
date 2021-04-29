import axios from "axios";
import endpoint from './endpoint'

const url = endpoint;

async function getUsers () {
    var resp = await axios.get(`${url}/Users/GetUsers`);
    return resp.data;
}
async function addUser (user) {
    var resp = await axios.post(`${url}/Users/AddUser`, user);
    return resp.data;
}
async function updateUser (id, user) {
    var resp = await axios.put(`${url}/Users/UpdateUser/${encodeURIComponent(id)}`, user);
    return resp.data;
}

async function deleteUser (id) {
    var resp = await axios.delete(`${url}/Users/DeleteUser/${encodeURIComponent(id)}`);
    return resp.data;
}


export default
{
    getUsers,
    addUser,
    updateUser,
    deleteUser
}
