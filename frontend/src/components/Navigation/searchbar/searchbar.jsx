import {AiOutlineSearch} from "react-icons/ai"
import './searchbar.css'
import { useDispatch } from "react-redux"
import { useState } from "react";
import { fetchSearchResults } from "../../../store/products";
import { useHistory } from "react-router-dom/cjs/react-router-dom.min";


export default function Searchbar() {
    const [searchTerm, setSearchTerm] = useState('');
    const history = useHistory();

    const capitalize = (string) => {
        let chars = string.split('').map((char, idx) => {
            if (idx === 0) {
                return char.toUpperCase();
            } else {
                return char.toLowerCase();
            }
        })
        return chars.join('')
    }

    const handleSubmit = e => {
        e.preventDefault();

        history.push(`/${searchTerm}`);
        setSearchTerm(''); //this is not working how I want it to
    }

    return (
        <form onSubmit={handleSubmit} className="product_search">
            <input
            type="text"
            className="searchbar"
            placeholder="search"
            onChange={(e) => setSearchTerm(capitalize(e.target.value))}
            >
            </input>
            <button type="submit" className="search_icon" > <AiOutlineSearch /> </button>
        </form>
    )
}
