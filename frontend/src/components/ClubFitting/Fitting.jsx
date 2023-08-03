// import { useHistory } from 'react-router-dom';
// import './Fitting.css'
// import { useSelector } from 'react-redux';


// export default function ClubFitting() {
//     const history = useHistory()
//     const user = useSelector(state => state.session.user)

//     const handleSubmit = e => {

//         e.preventDefault();

//         history.push(`/users/${user}/profile`)
//     }

//     return (
//         <form onSubmit={handleSubmit}>
//             <div className='club-fitting-container'>
//                 <div className='club-fitting-info'>
//                     <div className='iron-fitting-info'>

//                     </div>
//                     <div className='wood-fitting-info'>

//                     </div>
//                     <div className='driver-fitting-info'>

//                     </div>
//                     <div className='button-container'>
//                         <button type='submit' className='fitting-button'>
//                             Submit
//                         </button>
//                     </div>
//                 </div>
//             </div>
//         </form>
//     )
// }
