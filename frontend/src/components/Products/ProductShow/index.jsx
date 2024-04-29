import { useSelector, useDispatch } from "react-redux";
import { useEffect, useState } from "react";
import { NavLink, useParams } from "react-router-dom";
import { fetchProduct, getProduct } from "../../../store/products";
import './index.css'
import ReviewIndex from "../../Reviews/ReviewIndex";
import { createCartItem } from "../../../store/cartItems";
import ImageGallery from 'react-image-gallery';
import "react-image-gallery/styles/css/image-gallery.css";
import StarRatingInput from "../../Reviews/StarRatingInput";
// import { useHistory } from "react-router-dom";

export default function ProductShowPage() {
    const {productId} = useParams();
    const reviews = useSelector(state => Object.values(state.reviews))
    const product = useSelector(getProduct(productId));
    const user = useSelector(state => state.session.user);
    const dispatch = useDispatch();
    const user_review = useSelector(state => state.reviews.userId);
    // const history = useHistory();

    const avgRating = () => {
        let avg = 0;
        reviews.map(review => {
            return avg += review.rating
        })
        return avg / reviews.length
    }

    const [isReadMore, setIsReadMore] = useState(true);
    let toggleReadMore = () => {
        setIsReadMore(isReadMore => !isReadMore);
    };

    useEffect(() => {
        dispatch(fetchProduct(productId))
    }, [dispatch])

    // const handleClick = e => {
    //     e.preventDefault();

    //     const cartItem = {
    //         product_id: productId,
    //         quantity: 1
    //     }
    //     dispatch(createCartItem(cartItem));
    //     history.push(`/cart`);
    // }

    async function handleClick(e) {
        e.preventDefault();

        const cartItem = {
            product_id: productId,
            quantity: 1
        }
        await dispatch(createCartItem(cartItem));
        // history.push(`/cart`);
    }

    // const handleSelection = e => {
    //     e.preventDefault();
    //     if (e.target.className.includes('selected')) {
    //         e.target.classList.remove('selected');
    //     } else {
    //         e.target.classList.add('selected');
    //     }
    // }



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

    //  && product.specs !== "none"
    if (user && !(user_review === user.id)) {

        return product ? (
            <div className="outer-product-show-container">
                <div className="inner-product-show-container">
                    <div className="prod-image-container">
                        {gallery()}
                    </div>
                    <div className="product-content-container">
                        <br/>
                        <h1>{product.name}</h1>
                        <div className="arverage-review">
                            {<StarRatingInput rating={avgRating()} disabled={true}/>}
                        </div>
                        <div className="desc-container">
                            <p className="text">
                                {isReadMore ? product.description.slice(0, 100): product.description}
                                <span className="read-hide-button" onClick={toggleReadMore}>
                                    {isReadMore ? "...read more" : "show less"}
                                </span>
                            </p>
                        </div>
                        {/* <h3>
                            Loft
                        </h3>
                            <div className="spec-selection-wrapper">
                                {product.specs.split(',').map(spec => {
                                    return (
                                            <button className="spec-selection" onClick={handleSelection}>{spec}</button>
                                    )
                                })}
                            </div> */}
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
                    <p>{<StarRatingInput rating={avgRating()} disabled={true}/>}</p>
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
                        {gallery()}
                    </div>
                    <div className="product-content-container">
                        <br/>
                        <h1>{product.name}</h1>
                        <div className="arverage-review">
                            {<StarRatingInput rating={avgRating()}  disabled={true}/>}
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
                    </div>
                </div>
                <br/>
                <br/>
                <br/>
                <div className="outer-reviews-container">
                    <h1>The percentage of reviewers who reccoment this product</h1>
                    <br/>
                    <p>{<StarRatingInput rating={avgRating()} disabled={true}/>}</p>
                    <br/>
                    <div className="review-index">
                        <ReviewIndex/>
                    </div>
                </div>
            </div>
        ) : (<div></div>)
    }
}
