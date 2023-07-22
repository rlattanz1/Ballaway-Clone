import { useDispatch, useSelector } from 'react-redux';
import './TopBanner.css';
import { fetchProduct, getProduct } from '../../store/products';
import { useEffect } from 'react';

export default function TopBanner() {


    const handleClick = (e) => {

        e.preventDefault();

    }

    return (
        <>
        <div className='top-outer-banner-container'>
            <div className='top-inner-banner-image'>
                {/* swag golf bag image */}
                {/* hard code the image link from AWS after uploading it there */}
                <img className='swag-bag' src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/fairway-c-1.png" alt="" />
            </div>
            <div className='top-inner-banner-info'>
                <div className='top-inner-banner-text'>
                    <h2>JULY MAJOR SWAG BAG SWEEPSTAKES</h2>
                    <br />
                    <p>Enter now for a chance to WIN!</p>
                </div>
                <br />
                <div className='top-inner-banner-button'>
                    <button onClick={(e) => handleClick(e)}>
                        ENTER NOW
                    </button>
                </div>
            </div>
        </div>
        </>
    )
}
