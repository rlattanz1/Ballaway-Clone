import CartIndexItem from "./cartIndexItem";
import { clearCartItems, deleteCartItem, fetchCartItems, getCartItems } from "../../store/cartItems";
import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import './cartIndex.css'
import { fetchProducts, getProducts } from "../../store/products";
import ThankyouFormModal from "../ThankyouModal/ThankyouFormModal";





export default function CartIndex() {
    const dispatch = useDispatch(); 
    const carts = useSelector(getCartItems);
    const products = useSelector(getProducts);
    const currentUser = useSelector(state => state.session.user.id);
    const [purchased, setPurchased] = useState(false)

    useEffect(() => {
        dispatch(fetchCartItems())
        dispatch(fetchProducts())
    }, [dispatch])

    const handlePurchase = e => {
        e.preventDefault();

        carts.map(cart_item => {
            return (
                dispatch(deleteCartItem(cart_item.id))
            )
        });
        console.log("action done")
         setTimeout(()=>{
            setPurchased(true)
            },1000)
    };

    let totalSum = 0;
    let totalTax = 0;


if (carts.length > 0) {
        return carts ? (
            <div className="cart">
                <div className="cart-right">
                    <div>
                    <h1 className="cart-title">Cart</h1>
                        {carts.map(cartItem => (
                            <div>
                            <CartIndexItem  cartItem={cartItem} key={cartItem.id}/>
                            </div>
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
                                if (product && cartItem.userId === currentUser) {
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
                                ${totalTax = Math.round((totalSum * .02234)*100)/100}
                            </div>
                            <br/>
                            <div className="total-cost">
                                total purchase sum
                                <br />
                                ${totalSum += totalTax}
                            </div>
                        </div>
                        <br />
                        <button className="purchase-button" onClick={handlePurchase}>
                            Purchase
                        </button>
                    </div>
                </div>
            </div>
        ) : null
    } else {
        return carts ? (
                <div className="cart">
                    <div className="cart-right">
                        <div>
                        <h1 className="cart-title">Cart</h1>
                        <br />
                            No Items In Your Cart
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
                                    if (product && cartItem.userId === currentUser) {
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
                                    ${totalTax = Math.round((totalSum * .02234)*100)/100}
                                </div>
                                <br/>
                                <div className="total-cost">
                                    total purchase sum
                                    <br />
                                    ${totalSum += totalTax}
                                </div>
                                {purchased && <ThankyouFormModal/>}
                            </div>
                        </div>
                    </div>
                </div>
            ) : null
    }
}
