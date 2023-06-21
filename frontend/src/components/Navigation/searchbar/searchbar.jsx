import {AiOutlineSearch} from "react-icons/ai"
import './searchbar.css'


export default function Searchbar() {

    // const handleSubmit = e => {
    //     e.preventDefault()


    // }

    return (
        <form /*onSubmit={handleSubmit}*/ className="product_search">
            <input type="text" className="searchbar" placeholder="search">
            </input>
            <button type="submit" className="search_icon"> <AiOutlineSearch /> </button>
        </form>
    )
}
