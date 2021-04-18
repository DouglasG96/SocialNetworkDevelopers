import jwt_decode from "jwt-decode";
export function  auth_request(state){
    state.status = 'loading'
}
export async function  auth_success(state, token){
    state.status = 'success'
    state.token = token
    if (token === '')
        state.user = {};
    else
        state.user =  jwt_decode(token);
}
export function auth_error(state){
    state.status = 'error'
}

export function logout(state){
    state.status = ''
    state.token = ''
    state.user = {}
}

// export function getUser(state, payload){
//     if(state.token === '')
//         state.user = {};
//     else
//         state.user =  jwt_decode(payload);

// }

