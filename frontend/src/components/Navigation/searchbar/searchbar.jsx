import {AiOutlineSearch} from "react-icons/ai"
import './searchbar.css'
import { useDispatch } from "react-redux"
import { useEffect, useState } from "react";
import { fetchSearchResults } from "../../../store/products";
import { useHistory } from "react-router-dom/cjs/react-router-dom.min";


export default function Searchbar() {
    const [searchTerm, setSearchTerm] = useState('');
    const history = useHistory();
    // const dispatch = useDispatch();

    // useEffect(() => {
    //     dispatch(fetchSearchResults(searchTerm))
    // }, [dispatch])

    const capitalize = (string) => {
        let words = string.split(' ');
        let capWords = words.map((word, idx) => {
            if (idx < word.length) {
                return word[0].toUpperCase() + word.slice(1).toLowerCase();
            }
        })
        return capWords.join(' ')
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
