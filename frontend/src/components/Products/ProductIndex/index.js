import { useSelector, useDispatch } from "react-redux";
import { useEffect } from "react";
import { fetchProducts, getProducts } from "../../../store/products";
import ProductIndexItem from "../../Products/ProductIndexItem";
import './index.css'



export default function ProductIndex({ category }) {
    const dispatch = useDispatch();
    const products = useSelector(getProducts);

    useEffect(() => {
        dispatch(fetchProducts())
    }, []);

    return (
        <div className="products_container">
            <ul>
                {products.map(product => (
                    <ProductIndexItem product={product} key={product.id}/>
                ))}
            </ul>
        </div>
    )
}
