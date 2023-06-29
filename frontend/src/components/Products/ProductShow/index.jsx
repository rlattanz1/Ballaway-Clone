import { useSelector, useDispatch } from "react-redux";
import { useEffect, useState } from "react";
import { NavLink, Redirect, useParams } from "react-router-dom";
import { fetchProduct, getProduct } from "../../../store/products";
import './index.css'
import ReviewIndex from "../../Reviews/ReviewIndex";
import { createCartItem, fetchCartItem } from "../../../store/cartItems";

export default function ProductShowPage() {
    const {productId} = useParams();
    const product = useSelector(getProduct(productId));
    const dispatch = useDispatch();

    const [isReadMore, setIsReadMore] = useState(true);
    let toggleReadMore = () => {
        setIsReadMore(isReadMore => !isReadMore);
    };

    useEffect(() => {
        dispatch(fetchProduct(productId))
    }, [])

    const handleClick = e => {
        e.preventDefault();

        const cartItem = {
            product_id: productId,
            user_id: userId,
            quantity: 1
        }

        dispatch(createCartItem(cartItem))
    }

    return product ? (
        <div className="outer-product-show-container">
            <div className="inner-product-show-container">
                <div className="prod-image-container">
                <img
                    class="prod-image"
                    src={product.photoUrl[0]} alt=""
                />
                </div>
                <div className="product-content-container">
                    <br/>
                    <h1>{product.name}</h1>
                    <div className="arverage-review">
    {/* average product review rating with the stars by all users with a text link to make a new review*/}
    {/*
                        <a>
                            <p className="review-smooth-scroll-label">click to view/create reviews</p>
                        </a> */}
                    </div>
                    <div className="desc-container">
                        <p className="text">
                            {isReadMore ? product.description.slice(0, 100): product.description}
                            <span className="read-hide-button" onClick={toggleReadMore}>
                                {isReadMore ? "...read more" : "show less"}
                            </span>
                        </p>
                    </div>
                    <br/>
                    <div className="price-container">
                        <p>{`$${product.price}`}</p>
                    </div>
                    <div className="add-to-cart">
                        <button className="add-button" onClick={() => handleClick}>Add To Cart</button>
                    </div>
                </div>
            </div>
            <br/>
            <br/>
            <br/>
            <div className="outer-reviews-container">
                <h1>The percentage of reviewers who reccoment this product</h1>
                <br/>
                <p>avg star rating</p>
                <br/>
                {/* <button className="review-button" >WRITE A REVIEW</button> */}
                <NavLink to={`/products/${productId}/createreview`}>
                    <button className="review-button" >WRITE A REVIEW</button>
                </NavLink>
                <br/>
                <div className="review-index">
                    <ReviewIndex/>
                </div>
            </div>
        </div>
    ) : (<div></div>)
}
