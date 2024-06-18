import { NavLink } from "react-router-dom"
import Searchbar from "../searchbar/searchbar"
import './categories.css'
import ShippingBanner from "../../Banners/ShippingBanner"


export default function Categories() {
    const categories = ['Products', 'Clubs', 'Balls', 'Bags', 'Gloves', 'Gear']


    return (
        <div className="categories-div">
            <div className="category-links">
                <ul className="category-ul">
                    <div className="prod-ele">
                        {/* why is the key prop here not being recognized as unique */}
                    {categories.map((category, i) => (
                    <li className="category-li">
                        <NavLink className="category" to={`/category/${category}`} key={i}>{category}</NavLink>
                    </li>
                    ))}
                    </div>
                </ul>
                <div className="search-bar">
                    <Searchbar />
                </div>
            </div>
            <br />
            <div className="shipping-banner">
                <ShippingBanner/>
            </div>
        </div>
    )
}
