import { NavLink } from "react-router-dom/cjs/react-router-dom.min";
import './index.css'

export default function ProductIndexItem({product}) {


    return (
        <NavLink className="product-ele" to={`/products/${product.id}`}>
            <div className="prod-container">
                <div class='item-container'>
                    <div className="image-container">
                        <img class="prod-image" src={product.photoUrl[0]} alt="" />
                    </div>
                </div>
                <p className="prod-name">{product.name}</p>
                <p className="prod-description">{product.description}</p>
                <br/>
                <p className="prod-price">{product.price}</p>
            </div>
        </NavLink>
    )
}
