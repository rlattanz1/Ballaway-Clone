import { useDispatch, useSelector } from "react-redux"
import { deleteReview, updateReview } from "../../store/reviews"
import { useParams } from "react-router-dom";
import './ReviewIndex.css'
import { useEffect } from "react";
import { NavLink } from "react-router-dom";
import StarRatingInput from "./StarRatingInput";
import RectangleRatingInput from "./RectangleRatingInput";


export default function ReviewIndex () {
    // const {reviewId} = useParams()
    const {productId} = useParams()
    const reviews = useSelector((state) => Object.values(state.reviews));
    const currentUser = useSelector(state => state.session.user);
    const user_review = useSelector(state => state.reviews.userId)
    const dispatch = useDispatch();


    const handleDelete = (reviewId) => {
        dispatch(deleteReview(reviewId))
    }



    return (
        <>
        {reviews.map(review => {
            if (currentUser && currentUser.id === review.userId) {
            return (
            <div>
            <div className="inner-reviews-container">
                <div className="review-details">
                    <span>
                        <p>{<StarRatingInput rating={review.rating} disabled={true}/>}</p>
                        <p>{review.username}</p>
                        <p>{review.createdAt.split('T').join(' ').slice(0, 19)}</p>
                        <p>{review.updatedAt.split('T').join(' ').slice(0, 19)}</p>
                    </span>
                    <br/>
                    <button className="delete-button" onClick={() => handleDelete(review.id)}>Delete Review</button>
                    <br/>
                    <NavLink className="update-link" to={`/products/${productId}/reviews/${review.id}/updatereview`}>
                        Update Review
                    </NavLink>

                </div>
                <div className="review-message">
                    <p className="review-title">{review.title}</p>
                    <span className="spacer">___</span>
                    <p>{review.body}</p>
                    <p> would you reccomend this product:
                        {review.reccomendation === true ? 'no' : 'yes'}
                    </p>
                    <p>was this helpful
                        <button className="helpful-button">yes (num who clicked yes)</button>
                    </p>
                </div>
                <div className="review-stats">
                    <p>
                        value
                        <br/>
                        {<RectangleRatingInput rating={review.value} disabled={true}/>}
                    </p>
                    <p>
                        quality
                        <br/>
                        {<RectangleRatingInput rating={review.quality} disabled={true}/>}

                    </p>
                    <p>
                        durability
                        <br/>
                        {<RectangleRatingInput rating={review.durability} disabled={true}/>}
                    </p>
                </div>
            </div>
                <br/>
                <br/>
                <p className="end-line"></p>
                <br/>
            </div>
        )
    } else {
        return (
            <div>
            <div className="inner-reviews-container">
                <div className="review-details">
                    <span>
                        <p>{review.rating }</p>
                        <p>{review.username}</p>
                        <p>{review.createdAt.split('T').join(' ').slice(0, 19)}</p>
                        <p>{review.updatedAt.split('T').join(' ').slice(0, 19)}</p>
                    </span>
                    <br/>
                </div>
                <div className="review-message">
                    <p className="review-title">{review.title}</p>
                    <span className="spacer">___</span>
                    <p>{review.body}</p>
                    <p> would you reccomend this product:
                        {review.reccomendation === true ? 'no' : 'yes'}
                    </p>
                    <p>was this helpful
                        <button className="helpful-button">yes (num who clicked yes)</button>
                    </p>
                </div>
                <div className="review-stats">
                    <p>
                        value
                        <br/>
                        {review.value}
                    </p>
                    <p>
                        quality
                        <br/>
                        {review.quality}
                    </p>
                    <p>
                        durability
                        <br/>
                        {review.durability}
                    </p>
                </div>
            </div>
                <br/>
                <br/>
                <p className="end-line"></p>
                <br/>
            </div>
        )
    }
    })}
    </>
    )
}
