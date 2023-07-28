import CartIndexItem from "./cartIndexItem";
import { fetchCartItems, getCartItems } from "../../store/cartItems";
import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import './cartIndex.css'
import { fetchProducts, getProducts } from "../../store/products";





export default function CartIndex() {
    const dispatch = useDispatch();
    const carts = useSelector(getCartItems);
    const products = useSelector(getProducts);

    useEffect(() => {
        dispatch(fetchCartItems())
        dispatch(fetchProducts())
    }, [dispatch])

    let totalSum = 0;
    let totalTax = 0;
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
                        <div className="item-prices">
                        items total price
                        <br />
                        {carts.map(cartItem => {
                            const product = products.find(product => product.id === cartItem.productId);
                            if (product) {
                                totalSum += product.price * cartItem.quantity;
                                return (
                                    <div>
                                        {product.name}: (${product.price * cartItem.quantity}.00)
                                    </div>
                                )
                            }
                        })}
                        </div>
                        <br/>
                        <div className="total-tax">
                            items total tax
                            <br />
                            ${totalTax = totalSum * 0.01}
                        </div>
                        <br/>
                        <div className="total-cost">
                            total purchase sum
                            <br />
                            ${totalSum += totalTax}
                        </div>
                    </div>
                    <button className="purchase-button">Fake Purchase Items</button>
                </div>
            </div>
        </div>
    ) : null
}
