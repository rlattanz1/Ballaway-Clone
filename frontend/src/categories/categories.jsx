import { NavLink } from "react-router-dom"


export default function Categories() {
    const categories = ['Clubs', 'Balls', 'Gear']
    return (
        <div>
            <ul>
                {categories.map(category => {
                <li>
                    <NavLink to="">{category}</NavLink>
                </li>
                })}
            </ul>

        </div>
    )
}
