import {useState} from 'react'
import {AiOutlineStar} from 'react-icons/ai'

export default function StarRatingInput({ rating, disabled, onChange }) {

  const [activeRating, setActiveRating] = useState(rating);

  return (
    <>
    <input
      type="number"
      disabled={disabled}
      value={rating}
      onChange={onChange}
    />

    <div className="rating-input">

      <div className={activeRating >=  1 ? "filled" : "empty" }
      onMouseEnter={disabled ? () => activeRating : () => setActiveRating(1)}
      onMouseLeave={ () => setActiveRating(rating)}>
        <AiOutlineStar/>
      </div>

      <div className={activeRating >=  2 ? "filled" : "empty" }
      onMouseEnter={disabled ? () => activeRating : () => setActiveRating(2)}
      onMouseLeave={() => setActiveRating(rating)}>
        <AiOutlineStar/>
      </div>

      <div className={activeRating >=  3 ? "filled" : "empty" }
      onMouseEnter={disabled ? () => activeRating : () => setActiveRating(3)}
      onMouseLeave={() => setActiveRating(rating)}>
        <AiOutlineStar/>
      </div>

      <div className={activeRating >=  4 ? "filled" : "empty" }
      onMouseEnter={disabled ? () => activeRating : () => setActiveRating(4)}
      onMouseLeave={() => setActiveRating(rating)}>
        <AiOutlineStar/>
      </div>

      <div className={activeRating >=  5 ? "filled" : "empty" }
      onMouseEnter={disabled ? () => activeRating : () => setActiveRating(5)}
      onMouseLeave={() => setActiveRating(rating)}>
        <AiOutlineStar/>
      </div>

    </div>
    </>
  );
};


