import CartIndexItem from "./cartIndexItem";
import { fetchCartItems, getCartItems } from "../../store/cartItems";
import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";


export default function CartIndex() {
    const dispatch = useDispatch();

    const carts = useSelector(getCartItems)

    useEffect(() => {
        dispatch(fetchCartItems())
    }, [dispatch])

    return carts ? (

        <>
        {carts.map(cartItem => (
            <CartIndexItem  cartItem={cartItem}/>
        ))};
        </>
    ) : null
}
