import { useSelector, useDispatch } from "react-redux";
import { useEffect } from "react";
import { fetchSearchResults, getProducts } from "../../../store/products";
import ProductIndexItem from "../../Products/ProductIndexItem";
import './ProductSearchIndex.css'
import { useParams } from "react-router-dom/cjs/react-router-dom.min";
import Searchbar from "../../Navigation/searchbar/searchbar";



export default function ProductSearchIndex() {
    const {searchTerm} = useParams();
    const dispatch = useDispatch();
    const products = useSelector(getProducts);

    useEffect(() => {
        if (searchTerm) {
            dispatch(fetchSearchResults(searchTerm));
        }
    }, [dispatch, searchTerm]);


if (products.length > 0) {
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
} else {
    return (
        <div className="products_wrapper">
            <div className="products-container">
                <div className="products-list">
                    <h2>No Products Match Your Search</h2>
                </div>
                <div className="try-again-message">
                    <p>Please Try Again</p>
                </div>
                <div className="search-again-bar">
                    <Searchbar/>
                </div>
            </div>
        </div>
    )
}}
