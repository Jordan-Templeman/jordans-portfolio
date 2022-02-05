import React from 'react';
import { Document } from '../types/Document';

interface Props {
  document: Document;
  displayFooter?: boolean;
}

const Card = (props: Props) => {
  const {
    document: { id, description, title },
    displayFooter = true,
  } = props;

  return (
    <div id={`document-${id}`} className='col-lg-4 mb-3 d-flex align-items-stretch'>
      <div className='card w-100'>
        <div className='card-body'>
          <h5 className='card-title'>{title}</h5>
          <p className='card-text'>{description}</p>
        </div>
        {displayFooter && (
          <div className='card-footer'>
            <a href={`/documents/${id}`} className='btn btn-primary mt-auto align-self-start'>
              View
            </a>
          </div>
        )}
      </div>
    </div>
  );
};

export default Card;
