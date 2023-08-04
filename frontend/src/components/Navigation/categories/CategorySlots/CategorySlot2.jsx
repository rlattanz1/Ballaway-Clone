import './CategorySlot2.css'
import { NavLink } from 'react-router-dom';


export default function CategorySlot2() {



    return (
        <>
            <h2>Club Categories</h2>
            <div className='club-slot-container'>
                <div className='bigger-clubs'>
                <div className='drivers-category-slot'>
                    <div className='category-link-img'>
                        <NavLink to={`/category/Driver`}>
                            <img src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/paradym-td-1.webp" alt="" />
                        </NavLink>
                    </div>
                    <br />
                    <h3>Drivers</h3>
                </div>
                <div className='hybrids-category-slot'>
                    <div className='category-link-img'>
                        <NavLink to={`/category/Hybrids`}>
                            <img src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/hybrids-paradym-x-1.webp" alt="" />
                        </NavLink>
                    </div>
                    <br />
                    <h3>Hybrids</h3>
                </div>

                <div className='woods-category-slot'>
                    <div className='category-link-img'>
                        <NavLink to={`/category/Woods`}>
                            <img src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-x-1.png" alt="" />
                        </NavLink>
                    </div>
                    <br />
                    <h3>Woods</h3>
                </div>
            </div>
            <div className='smaller-clubs'>
                <div className='irons-category-slot'>
                    <div className='category-link-img'>
                        <NavLink to={`/category/Iron`}>
                            <img src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/iron-paradym-1.webp" alt="" />
                        </NavLink>
                    </div>
                    <br />
                    <h3>Irons</h3>
                    </div>
                    <div className='wedges-category-slot'>
                    <div className='category-link-img'>
                        <NavLink to={`/category/Wedges`}>
                            <img src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/iron-paradym-1.webp" alt="" />
                        </NavLink>
                    </div>
                    <br />
                    <h3>Wedges</h3>
                    </div>
                    <div className='putters-category-slot'>
                    <div className='category-link-img'>
                        <NavLink to={`/category/Putters`}>
                            <img src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/iron-paradym-1.webp" alt="" />
                        </NavLink>
                    </div>
                    <br />
                    <h3>Putters</h3>
                    </div>
                </div>
            </div>
        </>
    )
}
