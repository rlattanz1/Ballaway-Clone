import React, { useState } from 'react';
import { ShippingModal } from '../../context/ShippingModal';
import ShippingForm from "./ShippingForm";



function ShippingFormModal({text}) {
  const [showModal, setShowModal] = useState(false);

  return (
    <>
      <p class="shipping_modal" onClick={() => setShowModal(true)}>{text}</p>
      {showModal && (
        <ShippingModal onClose={() => setShowModal(false)}>
          <ShippingForm setShowModal={setShowModal}/>
        </ShippingModal>
      )}
    </>
  );
}

export default ShippingFormModal;
