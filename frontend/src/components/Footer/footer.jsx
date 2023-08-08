import './footer.css'
import {FaGithubSquare} from 'react-icons/fa'
import {FaLinkedin} from 'react-icons/fa'

export default function Footer() {

    return(
        <div className='footer-container'>
            <label className='help-links'>Rocco Lattanzio
            <br />
                <div className='personal-image'>
                    <img src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/1554072800356.jpg" alt="" />
                </div>
            </label>
            <label className='corporate-links'>Github
            <br />
                <div className='Github-link'>
                    <a href="https://github.com/rlattanz1" rel="noreferrer" target="_blank">
                        <FaGithubSquare size={100}/>
                    </a>
                </div>
            </label>
            <label className='legal-links'>LinkedIn
            <br />
                <div className='LinkedIn-link'>
                    <a href="https://www.linkedin.com/in/rocco-lattanzio-a8aba5a5/" rel="noreferrer" target="_blank">
                        <FaLinkedin size={100}/>
                    </a>
                </div>
            </label>
        </div>
    )
}
