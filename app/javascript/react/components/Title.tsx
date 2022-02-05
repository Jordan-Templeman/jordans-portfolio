import React from 'react';

interface Props {
  title: string;
  actionLink: string;
  actionText: string;
}

const Title = (props: Props) => {
  const { title, actionText, actionLink } = props;

  return (
    <div className='d-flex justify-content-between align-items-center'>
      <h1>{title}</h1>
      <a href={actionLink} className='btn btn-primary'>
        {actionText}
      </a>
    </div>
  );
};

export default Title;
