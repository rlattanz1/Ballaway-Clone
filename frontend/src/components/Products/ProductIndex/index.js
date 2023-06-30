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
                <h1 className="products-title">Products</h1>
                {products.map(product => (
                    <li className="">
                        <ProductIndexItem product={product} key={product.id}/>
                    </li>
                ))}
            </ul>
        </div>
    )
}
