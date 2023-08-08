import React, { useState } from 'react';
import { Modal } from '../../context/Modal';
import ThankyouForm from './ThankyouForm';



export default function ThankyouFormModal({text}) {
  const [showModal, setShowModal] = useState(false);

  return (
    <>
      <p class="thankyou_modal" onClick={() => setShowModal(true)}>{text}</p>
      {showModal && (
        <Modal onClose={() => setShowModal(false)}>
          <ThankyouForm setShowModal={setShowModal}/>
        </Modal>
      )}
    </>
  );
}
