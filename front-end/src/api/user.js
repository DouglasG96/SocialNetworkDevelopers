import axios from "axios";
import endpoint from './endpoint'

const url = endpoint;

async function getUsers () {
    var resp = await api.get(`/Users/GetUsers`);
    return resp.data;
}
async function userExistsEmail () {
    var resp = await api.get(`/Users/GetUsers`);
    return resp.data;
}
async function addUser (user) {
    var resp = await api.post(`/Users/AddUser`, user);
    return resp.data;
}
async function updateUser (id, user) {
    var resp = await api.put(`/Users/UpdateUser/${encodeURIComponent(id)}`, user);
    return resp.data;
}

async function deleteUser (id) {
    var resp = await api.delete(`/Users/DeleteUser/${encodeURIComponent(id)}`);
    return resp.data;
}


export default
{
    getUsers,
    addUser,
    updateUser,
    deleteUser,
    userExistsEmail,
    ...validation
}
