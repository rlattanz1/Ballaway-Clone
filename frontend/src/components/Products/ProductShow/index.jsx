import { useSelector, useDispatch } from "react-redux";
import { useEffect } from "react";
import { useParams } from "react-router-dom/cjs/react-router-dom.min";
import { fetchProduct, getProduct } from "../../../store/products";
import './index.css'

export default function ProductShowPage() {
    const {productId} = useParams();
    const product = useSelector(getProduct(productId));
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchProduct(productId))
    }, [productId])

    return (
        <div className="product-show-container">
            <div className="prod-image-container">
            <img
                class="prod-image"
                src={product.photoUrl[1]} alt=""
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
                    <p>{product.description}</p>
                </div>
                <br/>
                <div className="price-container">
                    <p>{`$${product.price}`}</p>
                </div>
                <div className="add-to-cart">
                    <button className="add-button">Add To Cart</button>
                </div>
            </div>


        </div>
    )
}
