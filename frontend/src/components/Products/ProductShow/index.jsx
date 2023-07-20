import { useSelector, useDispatch } from "react-redux";
import { useEffect, useState } from "react";
import { NavLink, Redirect, useParams } from "react-router-dom";
import { fetchProduct, getProduct } from "../../../store/products";
import './index.css'
import ReviewIndex from "../../Reviews/ReviewIndex";
import { createCartItem, fetchCartItem } from "../../../store/cartItems";
import ImageGallery from 'react-image-gallery';
import "react-image-gallery/styles/css/image-gallery.css";

export default function ProductShowPage() {
    const {productId} = useParams();
    const product = useSelector(getProduct(productId));
    const user = useSelector(state => state.session.user);
    const dispatch = useDispatch();
    // const images = useSelector(state => state.products[productId]);

    const [isReadMore, setIsReadMore] = useState(true);
    let toggleReadMore = () => {
        setIsReadMore(isReadMore => !isReadMore);
    };

    useEffect(() => {
        dispatch(fetchProduct(productId))
    }, [dispatch])

    const handleClick = e => {
        e.preventDefault();

        const cartItem = {
            product_id: productId,
            quantity: 1
        }
        dispatch(createCartItem(cartItem))
    }



    function gallery() {
        const items = product.photoUrl.map(photo => {
        return (
            {
                original: `${photo}`,
                thumbnail: `${photo}`,
            }
        )})
        if (product && items) {
            return (
                <ImageGallery
                items={items}
                showThumbnails={true}
                thumbnailPosition="left"
                />
            )
        }
    }

    if (user) {

        return product ? (
            <div className="outer-product-show-container">
                <div className="inner-product-show-container">
                    <div className="prod-image-container">
                        {/* {console.log(images.photoUrl)}
                        {console.log(productId)} */}
                        {gallery()}

                        {/* <ImageGallery
                        items={items}
                        showThumbnails={true}
                        thumbnailPosition="left"
                        /> */}

                    {/* <img
                        class="prod-image"
                        src={product.photoUrl[0]} alt=""
                    /> */}
                </div>
                    <div className="product-content-container">
                        <br/>
                        <h1>{product.name}</h1>
                        <div className="arverage-review">
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
                            <button className="add-button" onClick={e => handleClick(e)}>Add To Cart</button>
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
    } else {
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
                            <p>Must Be logged In To Add To Cart</p>
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
                    {/* <NavLink to={`/products/${productId}/createreview`}>
                        <button className="review-button" >WRITE A REVIEW</button>
                    </NavLink> */}
                    <br/>
                    <div className="review-index">
                        <ReviewIndex/>
                    </div>
                </div>
            </div>
        ) : (<div></div>)
    }
}
