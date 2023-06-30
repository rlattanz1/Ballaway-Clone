import CartIndexItem from "./cartIndexItem";
import { fetchCartItems, getCartItems } from "../../store/cartItems";
import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchProducts } from "../../store/products";
import './cartIndex.css'

export default function CartIndex() {
    const dispatch = useDispatch();

    const carts = useSelector(getCartItems)

    useEffect(() => {
        dispatch(fetchCartItems())
    }, [dispatch])

    return carts ? (

        <div className="cart">
            <div className="cart-right">
                <div>
                <h1 className="cart-title">Cart</h1>
                    {carts.map(cartItem => (
                        <CartIndexItem  cartItem={cartItem}/>
                        ))}
                </div>
            </div>
            <div className="cart-left">
                <h1 className="purchase-total-title">Purchase Total</h1>
                <div className="purchase-container">
                    <div className="cart-cost">
                        items total price
                        <br/>
                        items total tax
                        <br/>
                        total purchase sum
                    </div>
                    <button className="purchase-button">Fake Purchase Items</button>
                </div>
            </div>
        </div>
    ) : null
}
