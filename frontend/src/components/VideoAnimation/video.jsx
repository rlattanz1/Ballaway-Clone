import './video.css'
import Video from "./Video.mp4"

export default function VideoComponent() {

    return (
        <div className='video-container'>
            <video autoPlay loop muted playsInline >
                <source src={Video} type="video/mp4" />
            </video>
        </div>
    )
}
