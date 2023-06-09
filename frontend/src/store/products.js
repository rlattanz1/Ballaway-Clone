

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

export const fetchProduct = (productId) => async(dispatch) => {
    const res = await fetch(`/api/products/${productId}`);

    if (res.ok) {
        const data = await res.json();
        console.log(data);
        dispatch(receiveProduct(data));
    }
}

//may need an extra fetch for the searchbar category function IDK

export default function productsReducer(state={}, action) {
    let newState;
    switch(action.type) {
        case RECEIVE_PRODUCTS: //may or may not be right for the inclusion of the category search
            return action.products;
        case RECEIVE_PRODUCT:
            newState = {...state};
            const productId = action.product.id;
            newState[productId] = action.product;
            return newState;
        default:
            return state;
    }
}
