import { useSelector, useDispatch } from "react-redux";
import { useEffect } from "react";
import { fetchCategoryProducts, fetchProducts, getProducts } from "../../../store/products";
import ProductIndexItem from "../../Products/ProductIndexItem";
import './index.css'
import { useParams } from "react-router-dom/cjs/react-router-dom.min";



export default function ProductIndex() {
    const {category} = useParams();
    const dispatch = useDispatch();
    const products = useSelector(getProducts);
    useEffect(() => {
        if (!category) {
            dispatch(fetchProducts());
        } else {
            dispatch(fetchCategoryProducts(category));
        }
    }, [dispatch, category]);

    return (
        <div className="products_wrapper">
            <div className="top-product-banner">

            </div>
            <div className="products-title">
                <h1>Products</h1>
            </div>
            <div className="products-container">
                <div className="products-list">
                    {products.map(product => (
                        <ProductIndexItem product={product} key={product.id}/>
                    ))}
                </div>
            </div>
            <div className="bottom-product-banner">

            </div>
        </div>
    )
}
