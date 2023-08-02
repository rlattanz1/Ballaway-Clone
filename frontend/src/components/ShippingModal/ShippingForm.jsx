import './ShippingForm.css';
import { NavLink } from 'react-router-dom/cjs/react-router-dom.min';


export default function LoginForm(props) {

    return (
      <form>
        <div className='shipping-info-container'>
            <h2>
                FREE SHIPPING & RETURNS
            </h2>
            <div className='ground-shipping-info'>
                <h3>*Free Ground Shipping On All Orders</h3>
                    <br />
                    <br />
                    <ul className='ground-shipping-list'>
                        <li>No promo or coupon codes are required</li>
                        <br />
                        <li>Only valid with UPS Ground</li>
                        <br />
                        <li>Shipping discounts will automatically apply</li>
                        <br />
                        <li>Sorry, this free shipping offer is not valid in conjunction with GMC promo coupons or any type of Shopping Spree gift cards</li>
                    </ul>
            </div>
            <br />
            <br />
            <div className='two-day-shipping-info'>
                <h3>*Free 2-Day Shipping On Orders Over $200</h3>
                <br />
                    <br />
                    <ul className='two-day-shipping-list'>
                        <li>Free 2-Day Shipping On Orders Over $200</li>
                        <br />
                        <li>No promo or coupon codes are required</li>
                        <br />
                        <li>Shipping discounts will automatically apply when you reach the $200 threshold and select UPS 2 Business Day shipping</li>
                        <br />
                        <li>Sorry, this free shipping offer is not valid in conjunction with GMC promo coupons or any type of Shopping Spree gift cards. This offer excludes custom logo orders and shipping to Hawaii or Alaska</li>
                    </ul>
            </div>
            <br />
            <br />
            <div className='free-return-shipping-info'>
                <h3>FREE RETURN SHIPPING</h3>
                <br />
                <div className='free-return-shipping-text'>
                    <p>Callaway Golf wants you to be fully satisfied with every item you purchase. If you are not satisfied with the item you have purchased, you may return it within 30 days of shipment for a full refund of the product price. If product is unused, the refund will credit back to your original payment method. If product has been used the refund will be in the form of a CallawayGolf.com Gift Card with no expiration date.</p>
                    <br />
                    <p>For all returns, a Return Merchandise Authorization (RMA) is required. To obtain a Return Merchandise Authorization (RMA) and your FREE UPS Return Shipping Label, please contact a Sales and Customer Service Representative toll free at 1-877-723-5218</p>
                </div>
            </div>
            <br />
            <br />
            <div className='signup-link'>
                <p>Still not a member of Callaway Rewards? Join & start earning points.{`\n`}
                <NavLink to="/signup" onClick={() => props.setShowModal(false)} >
                    Join Today!
                </NavLink>
                </p>
            </div>
        </div>
      </form>
    );
}
