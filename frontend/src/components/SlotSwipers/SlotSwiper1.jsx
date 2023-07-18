import { useDispatch, useSelector } from 'react-redux'
import './SlotSwiper1.css'
import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';
import { fetchProducts, getProducts } from '../../store/products'
import { useEffect, useState } from 'react'
import { Link, useParams } from 'react-router-dom/cjs/react-router-dom.min'
import ProductIndexItem from '../Products/ProductIndexItem'
import { NavLink } from 'react-router-dom'


export default function SlotSwiper1() {
    const dispatch = useDispatch()
    const products = Object.values(useSelector(getProducts))

    useEffect(() => {
        dispatch(fetchProducts())
    }, [dispatch])

    // need a way to get an arry of products for my featured products and make each product item a link element to their product show page
    // next step will be fetching only products of a certain category such as featured, clubs, or bags
    // this can then be applid to each of my slot swipers for now I will move onto bags

    return (
        <div className='ssl-1'>
            <Carousel
                       additionalTransfrom={0}
                       centerMode={false}
                       containerClass="container"
                       infinite={true}
                       itemClass=""
                       keyBoardControl
                       minimumTouchDrag={80}
                       partialVisbile
                       pauseOnHover
                       responsive={{
                           desktop: {
                             breakpoint: {
                               max: 3000,
                               min: 1100
                             },
                             items: 3,
                             partialVisibilityGutter: 40
                           },
                           mobile: {
                             breakpoint: {
                               max: 464,
                               min: 0
                             },
                             items: 1,
                             partialVisibilityGutter: 30
                           },
                           tablet: {
                             breakpoint: {
                               max: 1100,
                               min: 464
                             },
                             items: 2,
                             partialVisibilityGutter: 30
                           }
                         }}
                       showDots={false}
                       slidesToSlide={1}
                       swipeable
            >
                        {products.map(product => (
                                    <ProductIndexItem product={product}/>
                        ))}
            </Carousel>
        </div>
    )
}
