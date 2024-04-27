import { useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { deleteCartItem, updateCartItem } from "../../store/cartItems";
import { fetchProduct, getProduct } from "../../store/products";
import { NavLink } from "react-router-dom";
import {FaTrashAlt} from 'react-icons/fa'
import './cartIndexItem.css'



export default function CartIndexItem({cartItem}) { //cart item being passed into the functional component
    const dispatch = useDispatch();
    const [quantity, setQuantity] = useState(cartItem.quantity); //this will set the initial quantity of the cart item to the quantity passed when created by the user clicking 'add to cart'
    const product = useSelector(getProduct(cartItem.productId)) //get product will take in the product id of this cart item as an arg
    const currentUser = useSelector(state => state.session.user.id)

    useEffect(() => {
        if (cartItem.productId) { //if a cart item exists
            dispatch(fetchProduct(cartItem.productId));
            // setQuantity(cartItem.quantity); //is this ok or is there a more efficient way to do this with out having it happen on every render
        }
    }, [dispatch, cartItem, quantity]);

    const handleDelete = (e) => {
        e.preventDefault()
        dispatch(deleteCartItem(cartItem.id))
    }
 
    const handleQuantity = (num) => {
        if (quantity >= 1) {
            const newCartItem = {
                ...cartItem,
                quantity: quantity + num
            }
            dispatch(updateCartItem(newCartItem));
            setQuantity(quantity + num);
        }
    }

if (cartItem.userId === currentUser) {

    return product ? (
        <div className="cart-item-wrapper">
            <div className="cart-item-container">
                <div className="cart-item-top">
                </div>
                <div className="cart-item-left">
                    <div class="cart-prod-image">
                    <NavLink to={`/products/${cartItem.productId}`}>
                        <img
                            class="cart-prod-image"
                            src={product.photoUrl[0]} alt={product.name}
                        />
                    </NavLink>
                    </div>
                </div>
                <div className="cart-item-right">
                    <div className="quantity-buttons">
                        <button className="less-quantity" onClick={() => handleQuantity(-1)}>-</button>
                        <input
                        className="quantity"
                        type="text"
                        value={quantity}
                        />
                        <button className="more-quantity" onClick={() => handleQuantity(1)}>+</button>
                    </div>
                    <div className="trash-button">
                        <button onClick={e => handleDelete(e)}><FaTrashAlt/></button>
                    </div>
                </div>
                <div className="cart-item-bottom">
                </div>
            </div>
        </div>
    ) : null
    }
};
