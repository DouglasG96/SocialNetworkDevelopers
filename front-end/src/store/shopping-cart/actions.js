
export function addShoppingCart({ commit }, value) {
    commit("setAddCart", value);
}

export function cleanShoppingCart({ commit }) {
    commit("clearCart");
}

export function removeItemShoppingCart({ commit }, value) {
    commit("deleteItemCart", value);
}