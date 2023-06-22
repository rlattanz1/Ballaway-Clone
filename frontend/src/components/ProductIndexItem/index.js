import { NavLink } from "react-router-dom/cjs/react-router-dom.min";
import './index.css'

export default function ProductIndexItem({product}) {


    return (
        <div class='item-container'>
            <NavLink className="product-ele" to={`/products/${product.id}`}>
                <div className="prod-container">
                    {/* image when AWS is working also this should all go into a seperate product index item*/}
                    <p className="prod-name">{product.name}</p>
                    {/* <p className="prod-description">{product.description}</p> */}
                    <br/>
                    <p className="prod-price">{product.price}</p>
                </div>
            </NavLink>
        </div>
    )
}
