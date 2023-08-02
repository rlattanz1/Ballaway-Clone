import {AiOutlineSearch} from "react-icons/ai"
import './searchbar.css'
import { useDispatch } from "react-redux"
import { useState } from "react";
import { fetchSearchResults } from "../../../store/products";
import { useHistory } from "react-router-dom/cjs/react-router-dom.min";


export default function Searchbar() {
    const dispatch = useDispatch();
    let [searchTerm, setSearchTerm] = useState('');
    const history = useHistory();


    const handleKeyPress = e => {
        if (e.key === "Enter") {
            if (searchTerm) {
                console.log(searchTerm);
                history.push(`/search?query=${searchTerm}`);
                dispatch(fetchSearchResults(searchTerm));
                setSearchTerm("");
            } else {
                history.push('/')
            }
        }
    }

    const handleSubmit = e => {
        e.preventDefault();

        if (searchTerm) {
            console.log(searchTerm);
            history.push(`/search?query=${searchTerm}`);
            dispatch(fetchSearchResults(searchTerm));
            setSearchTerm("");
        } else {
            history.push('/')
        }
    }

    return (
        <form onSubmit={handleSubmit} className="product_search">
            <input
            type="text"
            className="searchbar"
            placeholder="search"
            onChange={(e) => setSearchTerm(e.target.value)}
            onKeyDown={(e) => handleKeyPress(e)}
            >
            </input>
            <button type="submit" className="search_icon"> <AiOutlineSearch /> </button>
        </form>
    )
}
