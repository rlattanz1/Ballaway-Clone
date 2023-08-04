import { receiveCartItems } from "./cartItems"

export const RECEIVE_PRODUCTS = 'products/RECEIVE_PRODUCTS'
export const RECEIVE_PRODUCT = 'products/RECEIVE_PRODUCT'




export const receiveProducts = (products) => {
    return {
        type: RECEIVE_PRODUCTS,
        products
    }
}

export const receiveProduct = (data) => {
    return {
        type: RECEIVE_PRODUCT,
        product: data.product,
        reviews: data.reviews
    }
}

export const getProduct = (productId) => (state) => (
    state.products ? state.products[productId] : null
)

export const getProducts = (state) => (
    state.products ? Object.values(state.products) : []
)

export const fetchProducts = () => async(dispatch) => {
    const res = await fetch('/api/products');

    if (res.ok) {
        const products = await res.json();
        dispatch(receiveProducts(products))
    }
}

export const fetchCategoryProducts = (category) => async(dispatch) => {
    const res = await fetch(`/api/products?category=${category}`);
    if (res.ok) {
        const products = await res.json();
        dispatch(receiveProducts(products));
    }
}

export const fetchSearchResults = (searchTerm) => async(dispatch) => {
    const res = await fetch(`/api/products?query=${searchTerm}`);
    if (res.ok) {
        const products = await res.json();
        dispatch(receiveProducts(products));
    }
}

export const fetchProduct = (productId) => async(dispatch) => {
    const res = await fetch(`/api/products/${productId}`);
    // console.log(res.json())
    if (res.ok) {
        const data = await res.json();
        console.log(data)
        dispatch(receiveProduct(data));
    }
}

export default function productsReducer(state={}, action) {
    let newState;
    switch(action.type) {
        case RECEIVE_PRODUCTS:
            return action.products;
        case RECEIVE_PRODUCT:
            console.log(action)
            newState = {...state};
            const productId = action.product.id;
            newState[productId] = action.product;
            return newState;
        default:
            return state;
    }
}
