import { useMemo } from 'react';
import { Typography } from 'antd';

const { Title, Paragraph } = Typography;

function User({
  alignment = 'left',
  userName = 'Nome da pessoa',
  imgSrc = 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2970&q=80',
  imgSize = '100px',
  role = 'Discente'
}) {
  const componentStyle = useMemo(() => {
    switch (alignment) {
      case 'left':
        return {
          display: "flex",
          flexDirection: "row",
          alignItems: "center",
          flexWrap: "wrap",
          justifyContent: "flex-start",
        };
      case 'right':
        return {
          display: "flex",
          flexDirection: "row-reverse",
          alignItems: "center",
          flexWrap: "wrap",
          justifyContent: "flex-end",
        };
      default:
        return {
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          flexWrap: "wrap",
          justifyContent: "space-between",
        };
    }
  }, [alignment])

  const TextDivStyle = useMemo(() => {
    switch (alignment) {
      case 'left':
        return {
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'flex-start',
        };
      case 'right':
        return {
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'flex-end',
        };
      default:
        return {
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          marginTop: '16px',
        };
    }
  }, [alignment])

  return (
    <div
      style={componentStyle}
    >
        <img 
					src={imgSrc}
					alt='Foto de perfil'
          style={{ 
            width: imgSize,
            height: imgSize,
            objectFit: 'cover',
            borderRadius: '50%',
            border: '5px solid black',
          }}
				/>
        <div
          style={TextDivStyle}
        >
          <Paragraph
            style={{
              margin: "0 16px",
              textAlign: "center",
            }}
          >
            {role}
          </Paragraph>
          <Title
            style={{
              margin: "0 16px",
              textAlign: "center",
            }}
          >
            {userName}
          </Title>
        </div>
	  </div>
  );
}

export default User;
