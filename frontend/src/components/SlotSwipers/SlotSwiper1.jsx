import { useDispatch, useSelector } from 'react-redux'
import './SlotSwiper1.css'
import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';
import { fetchProducts, getProducts } from '../../store/products'
import { useEffect} from 'react'
import ProductIndexItem from '../Products/ProductIndexItem'


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
      <>
        <h1 className='featured-carousel-title'>Featured Paradym Clubs</h1>
        <div className='ssl-1'>
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
                        {products.slice(0, 4).map(product => (
                                    <ProductIndexItem product={product}/>
                        ))}
            </Carousel>
        </div>
      </>
    )
}
