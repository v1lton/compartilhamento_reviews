import React, { useState, useEffect } from 'react';
import { Form, Input, Button, Alert } from 'antd';
import { UserOutlined, MailOutlined, FlagOutlined, TeamOutlined } from '@ant-design/icons';
import axios from 'axios';
import { useNavigate } from "react-router-dom";

const EditProfile = ({setIsAuthenticated}) => {
  const [form] = Form.useForm();
  const [isLoading, setIsLoading] = useState(true);
  const [currentUser, setCurrentUser] = useState({});
  const [errorMessage, setErrorMessage] = useState(null);
  const navigate = useNavigate();

  const onFinish = async (values) => {
    try {
      const response = await axios.patch('http://localhost:3000/update_logged_user/', {user: {
        email: values.email,
        name: values.name,
        surname: values.surname,
        pronouns: values.pronouns,
        country: values.country,
      }});
  
      navigate('/profile');
    } catch (error) {
      setIsAuthenticated(false);
      setErrorMessage("Não foi possível editar seu perfil. Por favor, confira seus dados.");
    }
  };

  const onLoad = async (values) => {
    setIsLoading(true);
    try {
      const response = await axios.get('http://localhost:3000/logged_user/');
      setCurrentUser(response.data);
      setIsLoading(false);
    } catch (error) {
      setIsLoading(false);
    }
  };

  const onClose = (e) => {
    setErrorMessage(null);
  };

  useEffect(() => {
    onLoad();
  }, []);

  useEffect(() => {
    console.log('currentUser', currentUser);
  }, [currentUser]);

  if (isLoading) {
    return null;
  }
  
  return (
    <div style={{ maxWidth: 500, margin: '16px auto 0 auto' }}>

      <h1>Editar perfil</h1>

      {errorMessage && < Alert message="Erro ao edital perfil" description={errorMessage} type="error" closable onClose={onClose} />}

      <p></p>

      <Form 
        name="basic"
        onFinish={onFinish}
        initialValues={currentUser}
      >
        <Form.Item
          name="username"
          rules={[
            { required: true, message: 'Por favor, insira seu nome de usuário!' },
            { min: 3, message: 'O nome de usuário deve ter pelo menos 3 caracteres!' },
          ]}
        >
          <Input prefix={<UserOutlined />} placeholder="Nome de usuário" />
        </Form.Item>

        <Form.Item
          name="email"
          rules={[
            { required: true, message: 'Por favor, insira seu endereço de email!' },
            { type: 'email', message: 'O endereço de email não é válido!' },
          ]}
        >
          <Input prefix={<MailOutlined />} placeholder="Email" />
        </Form.Item>

        <Form.Item
          name="name"
          rules={[
            { required: true, message: 'Por favor, insira seu nome' },
          ]}
        >
          <Input prefix={<UserOutlined />} placeholder="Nome" />
        </Form.Item>

        <Form.Item
          name="surname"
        >
          <Input prefix={<UserOutlined />} placeholder="Sobrenome" />
        </Form.Item>

        <Form.Item
          name="pronouns"
        >
          <Input prefix={<TeamOutlined />} placeholder="Pronomes" />
        </Form.Item>

        <Form.Item
          name="country"
        >
          <Input prefix={<FlagOutlined />} placeholder="País" />
        </Form.Item>

        <Form.Item>
          <Button type="primary" htmlType="submit">
            Atualizar
          </Button>
        </Form.Item>

      </Form>
    </div>
  );
};

export default EditProfile;