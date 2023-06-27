import { useSelector } from "react-redux"
import { getProductReviews } from "../../store/reviews"
import { useParams } from "react-router-dom/cjs/react-router-dom.min";
import './ReviewIndex.css'


export default function ReviewIndex (props) {
    const {productId} = useParams()
    const reviews = useSelector((state) => Object.values(state.reviews));

    return (
    <>
        {reviews.map(review => {

        return (
            <div>
            <div className="inner-reviews-container">
                <div className="review-details">
                    <span>
                        <p>{review.rating }</p>
                        <p>{review.username}</p>
                        <p>{review.createdAt}</p>
                        <p>{review.updatedAt}</p>
                    </span>
                    <br/>
                    <p>user details</p>
                </div>
                <div className="review-message">
                    <p className="review-title">{review.title}</p>
                    <span className="spacer">___</span>
                    <p>{review.body}</p>
                    <p> would you reccomend this product:
                        review.reccomendation(yes or no)
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
    })}
    </>
    )
}
