import './CategorySlot1.css'
import { NavLink } from 'react-router-dom';

export default function CategorySlot1() {


    return (
        <>
            <h2>Gear Categories</h2>
            <div className='gear-slot-container'>
                <div className='balls-category-slot'>
                    <div className='category-link-img'>
                        <NavLink to={`/category/Balls`}>
                            <img src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/donut-day-1.png" alt="" />
                        </NavLink>
                    </div>
                    <br />
                    <h3>Balls</h3>
                </div>
                <div className='bags-category-slot'>
                    <div className='category-link-img'>
                        <NavLink to={`/category/Bags`}>
                            <img src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/fairway-c-1.png" alt="" />
                        </NavLink>
                    </div>
                    <br />
                    <h3>Bags</h3>
                </div>
                <div className='gloves-category-slot'>
                    <div className='category-link-img'>
                        <NavLink to={`/category/Gloves`}>
                            <img src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/gloves-opticolor-1.png" alt="" />
                        </NavLink>
                    </div>
                    <br />
                    <h3>Gloves</h3>
                </div>
            </div>
        </>
    )
}
