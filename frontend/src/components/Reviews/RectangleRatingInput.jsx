import { useEffect, useState } from 'react';
import {LuRectangleHorizontal} from 'react-icons/lu'


const RectangleRatingInput = ({ rating, disabled, onChange }) => {
  const [activeRating, setActiveRating] = useState(rating);

  useEffect(() => {
    setActiveRating(rating);
  }, [rating]);


  const rectangleIcon = (number) => {
    const props = {};
    if (!disabled) {
      props.onMouseEnter = () => setActiveRating(number);
      props.onMouseLeave = () => setActiveRating(rating);
      props.onClick = () => onChange(number);
    }
    return (
      <div key={number} className={activeRating >= number ? "filled" : "empty"} {...props}>
        <LuRectangleHorizontal className='rectangle' size={20}/>
      </div>
    );
  };

  return (
    <div className="rating-input">
      {[1, 2, 3, 4, 5].map(number => rectangleIcon(number))}
    </div>
  );
};

export default RectangleRatingInput;
