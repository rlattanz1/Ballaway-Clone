import './SlotSwiper2.css'
import { useDispatch, useSelector } from 'react-redux'
import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';
import { fetchProducts, getProducts } from '../../store/products'
import { useEffect} from 'react'
import ProductIndexItem from '../Products/ProductIndexItem'


export default function SlotSwiper2() {
    const dispatch = useDispatch()
    const products = Object.values(useSelector(getProducts))

    useEffect(() => {
        dispatch(fetchProducts())
    }, [dispatch])


    return (
        <>
        <h1 className='featured-bags-carousel'>Featured Bags</h1>
        <div className='ssl-2'>
            <Carousel
                    additionalTransfrom={0}
                    centerMode={false}
                    containerClass="container"
                    infinite={true}
                    pauseOnHover
                    responsive={{
                        desktop: {
                            breakpoint: {
                            max: 3000,
                            min: 1100
                            },
                            items: 4,
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
                        {products.slice(11, 17).map(product => (
                                    <ProductIndexItem product={product}/>
                        ))}
            </Carousel>
        </div>
        </>
    )
}
