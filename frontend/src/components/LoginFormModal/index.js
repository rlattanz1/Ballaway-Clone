import React, { useState } from 'react';
import { Modal } from '../../context/Modal';
import LoginForm from "./LoginForm";



function LoginFormModal({text}) {
  const [showModal, setShowModal] = useState(false);

  return (
    <>
      <p class="login_modal" onClick={() => setShowModal(true)}>{text}</p>
      {showModal && (
        <Modal onClose={() => setShowModal(false)}>
          <LoginForm setShowModal={setShowModal}/>
        </Modal>
      )}
    </>
  );
}

export default LoginFormModal;
