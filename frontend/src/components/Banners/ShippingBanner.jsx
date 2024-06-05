import './ShippingBanner.css';
import ShippingFormModal from '../ShippingModal/ShippingModalForm';

export default function ShippingBanner() {


    return (
        <>
        <div className='shipping-outer-banner-container'>
            <div className='shipping-inner-banner-info'>
                <div className='shipping-inner-banner-text'>
                    <h3>
                        Free Shipping & Free Returns On All Orders!
                    </h3>
                </div>
                <div className='modal-link'>
                    <ShippingFormModal  className='shipping-modal' text={'View Details'}/>
                </div>
            </div>
        </div>
        </>
    ) 
}
