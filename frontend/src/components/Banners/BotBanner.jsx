import './BotBanner.css'

export default function BotBanner() {


    const handleClick = (e) => {

        e.preventDefault();

    }

    return (
        <>
        <div className='bot-outer-banner-container'>
            <div className='bot-inner-banner-image'>
                {/* swag golf bag image */}
                {/* hard code the image link from AWS after uploading it there */}
                <div>
                    <img className='iron-pic' src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/iron-paradym-1.webp" alt="" />
                </div>
                <div>
                    <img className='driver-pic' src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/paradym-1.webp" alt="" />
                </div>
                <div>
                    <img className='iron-pic' src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/iron-paradym-1.webp" alt="" />
                </div>
            </div>
            <div className='bot-inner-banner-info'>
                <div className='bot-inner-banner-text'>
                    <span>SELECTOR TOOLS</span>
                    <br />
                    <h2>FIND THE CLUBS THAT ARE RIGHT FOR YOUR GAME</h2>
                    <br />
                    <p>personalized fittings with true golf professional's</p>
                </div>
                <br />
                <div className='bot-inner-banner-button'>
                    <button onClick={(e) => handleClick(e)}>
                        GET STARTED
                    </button>
                </div>
            </div>
        </div>
        </>
    )
}
