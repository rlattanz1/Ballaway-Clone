import { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { getReview, createReview, fetchReview, updateReview } from "../../store/reviews";
import './ReviewForm.css'


export default function CreateReviewPage() {
    const {reviewId} = useParams();
    const dispatch = useDispatch();
    let review = useSelector(getReview(reviewId));
    const formType = reviewId ? 'Update Review' : 'Create Review';
    if (formType === 'Create Review') {
        review = {
            title: '',
            body: ''
        }
    }
    const [title, setTitle] = useState(review.title);
    const [body, setBody] = useState(review.body);

    useEffect(() => {
        if (formType === 'Update Review') {
            dispatch(fetchReview(reviewId))
        }
    }, [reviewId]);

    const handleSubmit = e => {
        e.preventDefault();

        const newReview = {
            ...review,
            title,
            body
        }

        if (formType === 'Create Review') {
            dispatch(createReview(newReview));
        } else {
            dispatch(updateReview(newReview));
        }
    }

    return(
        <form onSubmit={handleSubmit}>
            <div className="review-container">

            <h1>{formType}</h1>
            <br/>
            <label>Overall Rating
                <input
                    type="number"
                    />
            </label>
            <br/>
            <label>Value
                <input
                    type="number"
                    />
            </label>
            <br/>
            <label>Quality
                <input
                    type="number"
                    />
            </label>
            <br/>
            <label>Durability
                <input
                    type="number"
                    />
            </label>
            <br/>
            <label>Do you recommend this product
                <input
                    type="radio"
                    />yes
                <input
                    type="radio"
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
            </div>
        </form>
    )
}
