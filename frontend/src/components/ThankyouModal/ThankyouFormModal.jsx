import React, { useState } from 'react';
import { Modal } from '../../context/Modal';
import ThankyouForm from './ThankyouForm';



export default function ThankyouFormModal({text}) {
  const [showModal, setShowModal] = useState(true);

  return (
    <>
      <p class="thankyou_modal" onClick={() => setShowModal(true)}>{text}</p>
      {showModal && (
        <Modal onClose={() => setShowModal(true)}>
          <ThankyouForm setShowModal={setShowModal}/>
        </Modal>
      )}
    </>
  );
}
