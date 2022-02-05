import React from 'react';
import { ErrorMessage, Formik, FormikErrors, FormikHelpers, Field, Form } from 'formik';
import axios from 'axios';
import { Document } from '../../../types/Document';
import Title from '../../../components/Title';
import { Errors } from '../../../types/Errors';

interface Values {
  title: string;
  description: string;
}

const DocumentNew = () => {
  return (
    <div id='document-form'>
      <Title title='Document Create' actionLink='/' actionText='Home' />
      <Formik
        initialValues={{
          title: '',
          description: '',
        }}
        onSubmit={async (
          { title, description }: Values,
          { setFieldError }: FormikHelpers<Values>
        ) => {
          axios
            .post<Document>('/api/documents', { title, description })
            .then((_response) => {
              window.location.replace('/');
            })
            .catch((error) => {
              const errorObject: Errors = error.response.data;
              const fieldErrors = errorObject.errors;

              Object.entries(fieldErrors).map((errorObject) => {
                const [param, errorMessage] = errorObject;
                const [message] = errorMessage;

                setFieldError(param, message);
              });
            });
        }}
        validate={({ title, description }: Values) => {
          const errors: FormikErrors<Values> = {};
          const genericErrorMessage = "can't be blank";

          if (!title) {
            errors.title = genericErrorMessage;
          }

          if (!description) {
            errors.description = genericErrorMessage;
          }

          return errors;
        }}
      >
        <Form className='w-50'>
          <div className='mb-3 title-field'>
            <label htmlFor='title' className='form-label'>
              Title
            </label>
            <Field
              id='title'
              className='form-control'
              name='title'
              placeholder='Please enter a title'
            />
            <ErrorMessage name='title'>
              {(msg) => <div className='invalid-feedback d-block'>{msg}</div>}
            </ErrorMessage>
          </div>

          <div className='mb-3 description-field'>
            <label htmlFor='description' className='form-label'>
              Description
            </label>
            <Field
              id='description'
              className='form-control'
              name='description'
              placeholder='Please enter a description'
              as='textarea'
            />
            <ErrorMessage name='description'>
              {(msg) => <div className='invalid-feedback d-block'>{msg}</div>}
            </ErrorMessage>
          </div>

          <button type='submit' className='btn btn-primary'>
            Submit
          </button>
        </Form>
      </Formik>
    </div>
  );
};

export default DocumentNew;
