
import csrfFetch from "./csrf";


export const RECEIVE_CART_ITEMS = '/cartItems/RECEIVE_CART_ITEMS';
export const RECEIVE_CART_ITEM = '/cartItems/RECEIVE_CART_ITEM';
export const REMOVE_CART_ITEM = '/cartItems/REMOVE_CART_ITEM';

export const receiveCartItems = (cartItems) => {
    return {
        type: RECEIVE_CART_ITEMS,
        cartItems
    }
}

export const receiveCartItem = (cartItem) => {
    return {
        type: RECEIVE_CART_ITEM,
        cartItem
    }
}

export const removeCartItem = (cartItemId) => {
    return {
        type: REMOVE_CART_ITEM,
        cartItemId
    }
}


export const getCartItems = (state) => (
   state.cartItems ? Object.values(state.cartItems) : []
)


export const getCartItem = (cartItemId) => (state) => (
    state.cartItems ? state.cartItems[cartItemId] : null
)



export const fetchCartItems = () => async(dispatch) => {
    const res = await fetch ('/api/cart_items');

    if (res.ok) {
        const cartItems = await res.json();
        dispatch(receiveCartItems(cartItems));
    }
}

export const fetchCartItem = (cartItemId) => async(dispatch) => {
    const res = await fetch (`/api/cart_items/${cartItemId}`);

    if (res.ok) {
        const cartItem = await res.json();
        dispatch(receiveCartItem(cartItem));
    }
}

export const createCartItem = (cartItem) => async(dispatch) => {
    const res = await csrfFetch ('/api/cart_items', {
        method: 'POST',
        headers: {
            'Content-Type': 'aplication/json'
        },
        body: JSON.stringify(cartItem)
    });

    if (res.ok) {
        const newCartItem = await res.json();
        dispatch(receiveCartItem(newCartItem));
    }
}

export const updateCartItem = (cartItem) => async(dispatch) => {
    const res = await csrfFetch (`/api/cart_items/${cartItem.id}`, {
        method: 'PATCH',
        headers: {
            'Content-Type': 'aplication/json'
        },
        body: JSON.stringify(cartItem)
    });

    if (res.ok) {
        const cartItem = await res.json();
        dispatch(receiveCartItem(cartItem));
    }
}

export const deleteCartItem = (cartItemId) => async(dispatch) => {
    const res = await csrfFetch(`/api/cart_items/${cartItemId}`, {
        method: 'DELETE'
    });

    if (res.ok) {
        dispatch(removeCartItem(cartItemId))
    }
}


export default function cartItemsReducer(state={}, action) {
    let newState;
    switch(action.type) {
        case RECEIVE_CART_ITEMS:
            return action.cartItems;
        case RECEIVE_CART_ITEM:
            newState = {...state};
            const cartItemId = action.cartItem.id;
            newState[cartItemId] = action.cartItem;
            return newState;
        case REMOVE_CART_ITEM:
            newState = {...state};
            delete newState[action.cartItemId];
            return newState;
        default:
            return state;
    }
}
