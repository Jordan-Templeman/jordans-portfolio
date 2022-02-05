import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { Document } from '../../../types/Document';
import Title from '../../../components/Title';
import Card from '../../../components/Card';
import { Errors } from '../../../types/Errors';

const DocumentShow = () => {
  const [document, setDocument] = useState<Document>();
  const [error, setError] = useState<Errors>();
  const id = window.location.pathname.split('/').pop();

  useEffect(() => {
    axios
      .get<Document>(`/api/documents/${id}`)
      .then((response) => {
        const data = response.data;
        setDocument(data);
      })
      .catch((error) => {
        setError(error.response.data);
      });
  }, []);

  return (
    <>
      <Title title='Document' actionLink='/' actionText='Home' />
      {error && <div>{error.full_messages}</div>}
      {document && <Card document={document} displayFooter={false} />}
    </>
  );
};

export default DocumentShow;
