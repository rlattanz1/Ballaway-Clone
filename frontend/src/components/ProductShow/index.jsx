import { useSelector, useDispatch } from "react-redux";
import { useEffect } from "react";
import { useParams } from "react-router-dom/cjs/react-router-dom.min";
import { fetchProduct, getProduct } from "../../store/products";
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
            <h1>{product.name}</h1>
            <p>{product.cost}</p>
            {/* average product review rating by all users with a text link to make a new review*/}


        </div>
    )
}
