import { useState, useEffect } from "react";
import { useParams, useHistory } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { getReview, createReview, fetchReview, updateReview } from "../../store/reviews";
import './ReviewForm.css'
import { NavLink } from "react-router-dom/cjs/react-router-dom.min";
import StarRatingInput from "./StarRatingInput";
import RectangleRatingInput from "./RectangleRatingInput";



export default function CreateReviewPage() {
    const {productId} = useParams();
    const {reviewId} = useParams();
    const dispatch = useDispatch();
    const history = useHistory();
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
    const [err, setErr] = useState([])
    const [reviewCreated, setReviewCreated] = useState(false)
    const [reviewUpdated, setReviewUpdated] = useState(false)

    useEffect(() => {
        if (formType === 'Update Review') {
            dispatch(fetchReview(reviewId))
        }
    }, [dispatch, reviewId]);

    const handleError = async (res) => {
        let data;
        try {
            data = await res.json();
            console.log(data)
        } catch {
            data = await res.text();
        }
        if (data) {
            setErr(data.message)
            // console.log(err)
        } else if (data) {
            setErr([data.message])
            // console.log(err)
        } else {
            setErr([res.statusText])
            // console.log(err)
        };
    };

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
            dispatch(createReview(newReview))
            .then(() => {
                setReviewCreated(true);
            })
            .catch((handleError));
            // console.log(err)
        } else {
            dispatch(updateReview(newReview))
            .then(() => {
                setReviewUpdated(true);
            })
            .catch((handleError));
            // console.log(err)
        };
    }

    if (reviewCreated || reviewUpdated) {
            history.push(`/products/${productId}`);
            return null
    }

    const err_arr = err.map((error) => {
        return(
            error
        )
    })

    const handleOnChange = (e, type) => {
        switch(type) {
            case "rating":
                return setRating(parseInt(e));
            case "value":
                return setValue(parseInt(e));
            case "quality":
                return setQuality(parseInt(e));
            case "durability":
                return setDurability(parseInt(e));
        };
    };

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
                <StarRatingInput
                    disabled={false}
                    onChange={(e) => handleOnChange(e, "rating")}
                    rating={rating}
                />
            </label>
            <div className="errors-container">
                <ul>
                {err.map( error => {
                if (error.includes('Rating')) {
                    return(
                            <li>
                                {error}
                            </li>
                        )}
                    })}
                </ul>
            </div>
            <br/>
            <label>Value
                <input
                    type="number"
                    value={value}
                    onChange={e => setValue(e.target.value)}
                />
                <RectangleRatingInput
                    disabled={false}
                    onChange={(e) => handleOnChange(e, "value")}
                    rating={value}
                />
            </label>
            <div className="errors-container">
                <ul>
                {err.map( error => {
                if (error.includes('Value')) {
                    return(
                            <li>
                                {error}
                            </li>
                        )}
                    })}
                </ul>
            </div>
            <br/>
            <label>Quality
                <input
                    type="number"
                    value={quality}
                    onChange={e => setQuality(e.target.value)}
                />
                <RectangleRatingInput
                    disabled={false}
                    onChange={(e) => handleOnChange(e, "quality")}
                    rating={quality}
                />
            </label>
            <div className="errors-container">
                <ul>
                {err.map( error => {
                if (error.includes('Quality')) {
                    return(
                            <li>
                                {error}
                            </li>
                        )}
                    })}
                </ul>
            </div>
            <br/>
            <label>Durability
                <input
                    type="number"
                    value={durability}
                    onChange={e => setDurability(e.target.value)}
                />
                <RectangleRatingInput
                    disabled={false}
                    onChange={(e) => handleOnChange(e, "durability")}
                    rating={durability}
                />
            </label>
            <div className="errors-container">
                <ul>
                {err.map( error => {
                if (error.includes('Durability')) {
                    return(
                            <li>
                                {error}
                            </li>
                        )}
                    })}
                </ul>
            </div>
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
            <div className="errors-container">
                <ul>
                {err.map( error => {
                if (error.includes('Title')) {
                    return(
                            <li>
                                {error}
                            </li>
                        )}
                    })}
                </ul>
            </div>
            <br/>
            <label>Body
                <textarea
                    type="text"
                    value={body}
                    onChange={e => setBody(e.target.value)}
                />
            </label>
            <div className="errors-container">
                <ul>
                {err.map( error => {
                if (error.includes('Body')) {
                    return(
                            <li>
                                {error}
                            </li>
                        )}
                    })}
                </ul>
            </div>
            <br/>
            <button className="submit-button">{formType}</button>

            <NavLink to={`/products/${productId}`}>
                <button className="cancel-button">Cancel</button>
            </NavLink>

            </div>
        </form>
    ) : null
}
