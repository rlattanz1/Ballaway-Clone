import React, { useState } from 'react';
import * as sessionActions from '../../store/session';
import { useDispatch, useSelector } from 'react-redux';
// import { Redirect } from 'react-router-dom';
import './LoginForm.css';
import { NavLink } from 'react-router-dom/cjs/react-router-dom.min';
import { Logo } from '../../images/logo';


export default function LoginForm(props) {
    const dispatch = useDispatch();
    const sessionUser = useSelector(state => state.session.user);
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [errors, setErrors] = useState([]);

    // if (sessionUser) return <Redirect to="/" />; // I think this is handleing what required logged out would handle for a normal login page but doesnt work for a modal

    const handleSubmit = e => {
      e.preventDefault();
      setErrors([]);
      return dispatch(sessionActions.login({ email, password }))
        .catch(async (res) => {
          let data;
          try {
            // .clone() essentially allows you to read the response body twice
            data = await res.clone().json();
          } catch {
            data = await res.text(); // Will hit this case if the server is down
          }
          if (data?.errors) setErrors(data.errors); //IDK get clarification
          else if (data) setErrors([data]);
          else setErrors([res.statusText]);
        });
    }

    return (    //frontend form submittal
      <form onSubmit={handleSubmit}>
        <ul>
          {errors.map(error => <li class="error_message" key={error}>{error}</li>)}
        </ul>
        <p>{Logo}</p>
        <p class="title">
            <b>Sign In To Start Earning Rewards</b>
        </p>
        <label class="label">
          <b>Email</b>
        </label>
          <input
            class="input"
            type="text"
            placeholder="email"
            value={email}
            onChange={e => setEmail(e.target.value)}
            required
          />
        <label class="label">
          <b>Password</b>
        </label>
          <input
            class="input"
            type="password"
            placeholder="password"
            value={password}
            onChange={e => setPassword(e.target.value)}
            required
          />
        <button type="submit">Log In</button>

        <p>Create an Account. &nbsp;
            <NavLink to="/signup" onClick={() => props.setShowModal(false)} >
                Join rewards & start earning today!
            </NavLink>
        </p>
      </form>
    );
}
