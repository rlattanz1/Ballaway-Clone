import React, { useContext, useRef, useState, useEffect } from 'react';
import ReactDOM from 'react-dom';
import './ShippingModal.css';

export const ModalContext = React.createContext();

export function ShippingModalProvider({ children }) {
  const modalRef = useRef();
  const [value, setValue] = useState();

  useEffect(() => {
    setValue(modalRef.current);
  }, [])

  return (
    <>
      <ModalContext.Provider value={value}>
        {children}
      </ModalContext.Provider>
      <div ref={modalRef} />
    </>
  );
}

export function ShippingModal({ onClose, children }) {
  const modalNode = useContext(ModalContext);
  if (!modalNode) return null;

  return ReactDOM.createPortal(
    <div id="shipping-modal">
      <div id="shipping-modal-background" onClick={onClose} />
      <div id="shipping-modal-content">
        {children}
      </div>
    </div>,
    modalNode
  );
}
