import { NavLink } from "react-router-dom/cjs/react-router-dom.min";
import { useState } from "react";
import './index.css'

export default function ProductIndexItem({product}) {
    const [prodIdx, setProdIdx] = useState(0)

    return (
        <NavLink className="product-ele" to={`/products/${product.id}`}>
            <div className="prod-container">
                <div class='item-container'>
                    <div className="image-container">
                        <img
                            class="prod-image"
                            onMouseEnter={() => setProdIdx(prodIdx => prodIdx + 1)}
                            onMouseLeave={() => setProdIdx(prodIdx => prodIdx - 1)}
                            src={product.photoUrl[prodIdx]} alt=""
                        />
                    </div>
                </div>
                <p className="prod-name">{product.name}</p>
                <br/>
                <p className="prod-price">${product.price}</p>
            </div>
        </NavLink>
    )
}
