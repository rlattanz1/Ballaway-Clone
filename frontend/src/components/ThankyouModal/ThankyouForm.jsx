import "./ThankyouForm.css"
import {FaGithubSquare} from 'react-icons/fa'
import {FaLinkedin} from 'react-icons/fa'
import * as sessionActions from '../../store/session';
import { useDispatch } from "react-redux";
import { useHistory } from "react-router-dom";



export default function ThankyouForm () {
    const dispatch = useDispatch();
    const history = useHistory();

    const logout = (e) => {
        e.preventDefault();
        dispatch(sessionActions.logout());
        history.push('/')
    };


    return (
        <div className="thankyou-form-wrapper">
            <div className="thankyou-form-title">
                <p>Thankyou For Using My Website!</p>
            </div>
            <br />
            <div className="website-warning">
                <p>
                    Unfortunately this is not a real website but a clone of Callaway golf. If you are interested in purchasing any of these products you can find them at the real callaway golf website using the link below.
                </p>
            </div>
                    <br />
                    <br />
                    <a href="https://www.callawaygolf.com/" rel="noreferrer" target="_blank">Callaway Golf</a>
                    {/* anchor tag not working in my modal*/}
            <div className="social-media-links">
                <label className='image-label'>Rocco
                <br />
                    <div className='personal-image'>
                        <img src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/1554072800356.jpg" alt="" />
                    </div>
                </label>
                <label className='github-label'>Github
                <br />
                    <div className='Github-link'>
                        <a href="https://github.com/rlattanz1" rel="noreferrer" target="_blank">
                            <FaGithubSquare size={100}/>
                        </a>
                    </div>
                </label>
                <label className='linkedin-label'>LinkedIn
                <br />
                    <div className='LinkedIn-link'>
                        <a href="https://www.linkedin.com/in/rocco-lattanzio-a8aba5a5/" rel="noreferrer" target="_blank">
                            <FaLinkedin size={100}/>
                        </a>
                    </div>
                </label>
            </div>
            <div className="logout-button">
                <button onClick={logout}>logout</button>
            </div>
        </div>
    )
}
