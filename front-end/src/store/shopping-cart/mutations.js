
export function setAddCart(state, payload) {
    state.shoppingCart.push(payload);

}
export function clearCart(state) {
    state.shoppingCart = [];
}
export function deleteItemCart(state, payload) {
    state.shoppingCart.splice(payload, 1);
}