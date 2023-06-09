import { useState, useEffect } from "react";
import { useParams, Redirect, useHistory } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { getReview, createReview, fetchReview, updateReview } from "../../store/reviews";
import './ReviewForm.css'
import { NavLink } from "react-router-dom/cjs/react-router-dom.min";
import StarRatingInput from "./StarRatingInput";



export default function CreateReviewPage() {
    const {productId} = useParams();
    const {reviewId} = useParams();
    const dispatch = useDispatch();
    const history = useHistory()
    let review = useSelector(getReview(reviewId));
    const formType = reviewId ? 'Update Review' : 'Create Review';
    if (formType === 'Create Review') {
        review = {
            product_id: productId,
            rating: 0,
            value: 0,
            quality: 0,
            durability: 0,
            recomendation: null,
            title: '',
            body: ''
        }
    }
    const [rating, setRating] = useState(review?.rating);
    const [value, setValue] = useState(review?.value);
    const [quality, setQuality] = useState(review?.quality);
    const [durability, setDurability] = useState(review?.durability);
    const [recomendation, setRecomendation] = useState(review?.recomendation);
    const [title, setTitle] = useState(review?.title);
    const [body, setBody] = useState(review?.body);

    useEffect(() => {
        if (formType === 'Update Review') {
            dispatch(fetchReview(reviewId))
        }
    }, [reviewId]);

    const handleSubmit = e => {
        e.preventDefault();

        const newReview = {
            ...review,
            rating,
            value,
            quality,
            durability,
            recomendation,
            title,
            body
        }

        if (formType === 'Create Review') {
            dispatch(createReview(newReview));
            history.push(`/products/${productId}`)
        } else {
            dispatch(updateReview(newReview));
            history.push(`/products/${productId}`)
        }
    }


    return review ? (
        <form onSubmit={handleSubmit}>
            <div className="review-container">

            <h1>{formType}</h1>
            <br/>
            <label>Overall Rating
                <input
                    type="number"
                    value={rating}
                    onChange={e => setRating(e.target.value)}
                    />
                {/* <StarRatingInput/> */}
            </label>
            <br/>
            <label>Value
                <input
                    type="number"
                    value={value}
                    onChange={e => setValue(e.target.value)}
                    />
            </label>
            <br/>
            <label>Quality
                <input
                    type="number"
                    value={quality}
                    onChange={e => setQuality(e.target.value)}
                />
            </label>
            <br/>
            <label>Durability
                <input
                    type="number"
                    value={durability}
                    onChange={e => setDurability(e.target.value)}
                    />
            </label>
            <br/>
            <label>Do you recommend this product
                <input
                    type="radio"
                    name="radio1"
                    onChange={() => setRecomendation(true)}
                    />yes
                <input
                    type="radio"
                    name="radio1"
                    onChange={() => setRecomendation(false)}
                    />no
            </label>
            <br/>
            <label>Title
                <input
                    type="text"
                    value={title}
                    onChange={e => setTitle(e.target.value)}
                    />
            </label>
            <br/>
            <label>Body
                <textarea
                    type="text"
                    value={body}
                    onChange={e => setBody(e.target.value)}
                />
            </label>
            <br/>
            <button className="submit-button">{formType}</button>

            <NavLink to={`/products/${productId}`}>
                <button className="cancel-button">Cancel</button>
            </NavLink>

            </div>
        </form>
    ) : null
}
