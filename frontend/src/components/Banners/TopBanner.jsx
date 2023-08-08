import { useDispatch, useSelector } from 'react-redux';
import './TopBanner.css';
import { fetchProduct, getProduct } from '../../store/products';
import { useEffect } from 'react';
import { useHistory } from 'react-router-dom/cjs/react-router-dom.min';

export default function TopBanner() {
    const history = useHistory()

    const handleClick = (e) => {

        e.preventDefault();
        history.push(`/category/Geo`)
    }

    return (
        <>
        <div className='top-outer-banner-container'>
            <div className='top-inner-banner-image'>
                <div>
                    <img className='geo-balls' src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-vegas-1.png" alt="" />
                    <img className='geo-balls' src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-california-1.png" alt="" />
                    <img className='geo-balls' src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-arizona-1.png" alt="" />
                </div>
            </div>
            <div className='top-inner-banner-info'>
                <div className='top-inner-banner-text'>
                    <h2>Special State Design Themed Golf Balls</h2>
                    <br />
                    <p>Check em out!</p>
                </div>
                <br />
                <div className='top-inner-banner-button'>
                    <button onClick={(e) => handleClick(e)}>
                        SHOP NOW
                    </button>
                </div>
            </div>
        </div>
        </>
    )
}
