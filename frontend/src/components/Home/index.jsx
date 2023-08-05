import './index.css'
import VideoComponent from '../VideoAnimation/video'
import SlotSwiper1 from '../SlotSwipers/SlotSwiper1'
import TopBanner from '../Banners/TopBanner'
import SlotSwiper2 from '../SlotSwipers/SlotSwiper2'
import MidBanner from '../Banners/MidBanner'
import SlotSwiper3 from '../SlotSwipers/SlotSwiper3'
import CategorySlot1 from '../Navigation/categories/CategorySlots/CategorySlot1'
import BotBanner from '../Banners/BotBanner'
import CategorySlot2 from '../Navigation/categories/CategorySlots/CategorySlot2'
// import Footer from '../Footer/footer'


export default function HomeComponent() {

    return (
    <div className='home-container'>
        <div className='video-wrapper'>
            <VideoComponent />
        </div>
        <div className='slot-swiper-1'>
            <SlotSwiper1 />
        </div>
        <div className='top-banner'>
            <TopBanner />
        </div>
        <div className='slot-swiper-2'>
            <SlotSwiper2 />
        </div>
        <div className='mid-banner'>
            <MidBanner />
        </div>
        <div className='slot-swiper-3'>
            <SlotSwiper3 />
        </div>
        <div className='category-slot-1'>
            <CategorySlot1 />
        </div>
        <div className='bot-banner'>
            <BotBanner />
        </div>
        <div className='category-slot-2'>
            <CategorySlot2 />
        </div>
    </div>
    )
}
