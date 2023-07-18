
import React from 'react';
import { NavLink } from 'react-router-dom';
import { useSelector } from 'react-redux';
import ProfileButton from './ProfileButton';
import './Navigation.css';
import LoginFormModal from '../LoginFormModal';
import Categories from './categories/categories';
import {cartImage} from "../../images/cartImage"
import { Logo } from '../../images/logo';
import {AiOutlineQuestionCircle} from 'react-icons/ai'
import {CgProfile} from 'react-icons/cg'

function Navigation() {
  const sessionUser = useSelector(state => state.session.user);

  let sessionLinks;
  if (sessionUser) {
    sessionLinks = (
      <div class="right_links">
        {/* phone num spells 1-800-bal-away */}
        <p className='phone_num'>1-800-225-2929</p> &nbsp; &nbsp;
        <span>|</span> &nbsp; &nbsp;
        <div className='nav_item'>
          <AiOutlineQuestionCircle/> &nbsp;
          <NavLink class="help_link" to="">Help</NavLink> &nbsp; &nbsp;
        </div>
        <div className='nav_item'>
          <CgProfile/> &nbsp;
            <ProfileButton user={sessionUser} />
        </div>
        <div className='nav_item'>
            <NavLink className='cart_button' to="/cart">{cartImage} &nbsp; Cart(num of cartItems)</NavLink> &nbsp;
        </div>
      </div>
    );
  } else {
    sessionLinks = (
        <div class="right_links">
            {/* phone num spells 1-800-bal-away */}
        <p className='phone_num'>1-800-225-2929</p> &nbsp; &nbsp;
        <span>|</span> &nbsp; &nbsp;
        <div className='nav_item'>
            <AiOutlineQuestionCircle/> &nbsp;
            <NavLink class="help_link" to="">Help</NavLink> &nbsp; &nbsp;
        </div>
        <div className='nav_item'>
            <CgProfile/> &nbsp;
            <LoginFormModal /> &nbsp; &nbsp;
        </div>
        <div className='nav_item'>
            <NavLink  className='cart_button' to="/cart">{cartImage} &nbsp; Cart(num of cartItems)</NavLink> &nbsp;
            {/* nav link to cart is not working */}
        </div>
      </div>
    );
  }

  return (
    <ul>
      <li>
        <div class="left_link">
            <NavLink class="home" to="/">{Logo}</NavLink>
        </div>
        {sessionLinks}
      </li>
      <br/>
      <li className="categories">
        <Categories />
      </li>
    </ul>
  );
}

export default Navigation;
