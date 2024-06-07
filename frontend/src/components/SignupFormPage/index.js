import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import * as sessionActions from "../../store/session";
import './SignupForm.css';
import { Logo } from "../../images/logo";

function SignupFormPage() {
  const dispatch = useDispatch();
  const sessionUser = useSelector(state => state.session.user);
  const [email, setEmail] = useState("");
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [errors, setErrors] = useState([]);


  if (sessionUser) return <Redirect to="/" />;


  const handleError = async (res) => {
    let data;
    if (password === confirmPassword) {
      try {
          data = await res.json();
      } catch {
          data = await res.text();
      }
      if (data) {
          setErrors(data.message)
      } else if (data) {
          setErrors([data.message])
      } else {
          setErrors([res.statusText])
      };
    } else {
      setErrors(['Confirm Password field must be the same as the Password field']);
    }
};

  const handleSubmit = e => {
    e.preventDefault();

    dispatch(sessionActions.signup({ email, username, password }))
    .catch((handleError));
  };

  return (
      <form onSubmit={handleSubmit}>
        <p>{Logo}</p>
          <p class="title">
              <b>Join The Team</b>
          </p>
        <div className="input-container">
          <label class="label">
            <b>Email</b>
          </label>
            <input
              class="input"
              type="text"
              placeholder="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
        </div>
        <div className="errors-container">
          <ul>
            {errors.map( error => {
            if (error.includes('Email')) {
                return(
                        <li>
                            {error}
                        </li>
                    )}
                })}
          </ul>
        </div>
        <div className="input-container">
          <label class="label">
            <b>Username</b>
          </label>
            <input
              class="input"
              type="text"
              placeholder="username"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              required
              />
        </div>
        <div className="errors-container">
          <ul>
            {errors.map( error => {
            if (error.includes('Username')) {
                return(
                        <li>
                            {error}
                        </li>
                    )}
                })}
          </ul>
        </div>
        <div className="input-container">
          <label class="label">
            <b>Password</b>
          </label>
            <input
              class="input"
              type="password"
              placeholder="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
        </div>
        <div className="errors-container">
          <ul>
            {errors.map( error => {
            if (error.includes('Password')) {
                return(
                        <li>
                            {error}
                        </li>
                    )}
                })}
          </ul>
        </div>
        <div className="input-container">
          <label class="label">
          <b>Confirm Password</b>
          </label>
            <input
              class="input"
              type="password"
              placeholder="password"
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              required
            />
        </div>
        <div className="errors-container">
          <ul>
            {errors.map( error => {
            if (error.includes('Confirm Password')) {
                return(
                        <li>
                            {error}
                        </li>
                    )}
                })}
          </ul>
        </div>
        <button type="submit">Sign Up</button>


      </form>
  );
}

export default SignupFormPage;
