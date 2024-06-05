import React, { useState } from "react";
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

  const handleSubmit = e => {
    e.preventDefault();
    if (password === confirmPassword) {
      setErrors([]);
      return dispatch(sessionActions.signup({ email, username, password }))
        .catch(async (res) => {
        let data;
        try {
          // .clone() essentially allows you to read the response body twice
          data = await res.clone().json();
        } catch {
          data = await res.text(); // Will hit this case if the server is down
        }
        if (data?.errors) {
            setErrors(data.errors);
        } else if (data) {
            setErrors([data]);
        }
        else {
            setErrors([res.statusText]);
        }
      });
    }
    return setErrors(['Confirm Password field must be the same as the Password field']);
  };

  return (
    <form onSubmit={handleSubmit}>
      <ul>
        {errors.map(error => <li class="error_message" key={error}>{error.message}</li>)}
      </ul>
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
      <button type="submit">Sign Up</button>


    </form>
  );
}

export default SignupFormPage;
