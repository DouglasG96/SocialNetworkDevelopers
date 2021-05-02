import axios from "axios";


async function isDui(dui) {

    var resp = await axios.get(`https://api-validar-dui.herokuapp.com/api/dui/${encodeURIComponent(dui)}`);
    return resp.data;
}
export default {
    isDui
}