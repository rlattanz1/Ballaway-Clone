import { NavLink } from "react-router-dom"
import Searchbar from "../searchbar/searchbar"
import './categories.css'


export default function Categories() {
    const categories = ['Clubs', 'Balls', 'Gear']
    return (
        <div className="categories_div">
            <ul className="category_links">
                {categories.map(category => (
                <li className="category_li">
                    <NavLink className="category" to="">{category}</NavLink>
                </li>
                ))}
                <div className="search_bar">
                    <Searchbar />
                </div>
            </ul>
        </div>
    )
}
