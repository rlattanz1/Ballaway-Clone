import './MidBanner.css'

export default function MidBanner() {


    const handleClick = (e) => {

        e.preventDefault();

    }

return (
    <div className='mid-outer-banner-container'>
        <div className='mid-inner-banner-info'>
            <div className='mid-inner-banner-text'>
                <span>ALL-NEW</span>
                <br />
                <div>
                    <img src="https://cdn-fsly.yottaa.net/58f0c36232f01c6abd17a924/www.callawaygolf.com/v~4b.58/on/demandware.static/-/Sites-CG4-Library/en_US/v1689951322466/landing/big-bertha/2023-Big-Bertha-Logo-White.png?yocs=P_S_" alt="" />
                </div>
                <br />
                <p>A new, extreemly forgiving lineup designed to make every shot your best.</p>
            </div>
            <br />
            <div className='mid-inner-banner-button'>
                <button onClick={(e) => handleClick(e)}>
                    SHOP NOW
                </button>
            </div>
        </div>
        <div className='mid-inner-banner-image'>
            {/* swag golf bag image */}
            {/* hard code the image link from AWS after uploading it there */}
            <img className='big-bertha' src="https://ballaway-seeds.s3.us-west-1.amazonaws.com/paradym-1.webp" alt="" />
        </div>
    </div>
    )
}
