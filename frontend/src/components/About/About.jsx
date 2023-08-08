import { useHistory } from 'react-router-dom';
import {FaGithubSquare} from 'react-icons/fa'
import {FaLinkedin} from 'react-icons/fa'
import './About.css'


export default function AboutPage() {

    const history = useHistory()

    const handleClick = e => {
        e.preventDefault();

        history.push('/')
    }

    return (
        <div className='about-container'>
            <div className='about-title-container'>
                <h3 className='about-title'>About The Author</h3>
            </div>
            <div className='about-info'>
                <p className='personal-pitch'>
                    I graduated Cal Poly with a degree in engineering and worked in the materials testing sector for a number of years and finally determined that I wanted to make a change of career as I enjoyed learning coding and now I am a software engineer trying grow my skills and work in a collaborative work environment.
                </p>
            </div>
            <div className='return-link'>
                <button className='return-button' onClick={handleClick}>
                    Return
                </button>
            </div>
        </div>
    )
}
