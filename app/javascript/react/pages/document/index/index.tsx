import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { Document } from '../../../types/Document';
import Card from '../../../components/Card';
import Title from '../../../components/Title';

const DocumentIndex = () => {
  const [documents, setDocuments] = useState<Document[]>([]);

  useEffect(() => {
    axios
      .get<Document[]>('/api/documents')
      .then((response) => {
        const data = response.data;
        setDocuments(data);
      })
      .catch((error) => {
        console.log('error', error);
      });
  }, []);

  return (
    <>
      <Title title='Documents' actionLink='/documents/new' actionText='Create' />
      <div className='row row-cols-1 row-cols-md-2 g-4'>
        {documents.map((document) => (
          <Card key={document.id} document={document} />
        ))}
      </div>
    </>
  );
};

export default DocumentIndex;
