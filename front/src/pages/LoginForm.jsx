import React, { useState } from 'react';
import { Form, Input, Button, Alert } from 'antd';
import { UserOutlined, LockOutlined } from '@ant-design/icons';
import axios from 'axios';
import { useNavigate } from "react-router-dom";

const LoginForm = ({setIsAuthenticated}) => {
  const navigate = useNavigate();
  const [errorMessage, setErrorMessage] = useState(null);

  const onFinish = async (values) => {
    try {
      const response = await axios.post('http://localhost:3000/login/', {session: {
        username: values.username,
        password: values.password
      }});
      setIsAuthenticated(true)
      navigate('/');
    } catch (error) {
      setIsAuthenticated(false)
      setErrorMessage("Não foi possível realizar o login. Por favor, confira seus dados.");
    }
  };
  
  const onClose = (e) => {
    setErrorMessage(null);
  };
  
  return (
    <div style={{ maxWidth: 500, margin: '16px auto 0 auto' }}>

      <h1>Entrar</h1>

      {errorMessage && < Alert message="Erro ao entrar" description={errorMessage} type="error" closable onClose={onClose} />}

      <p></p>

      <Form 
        name="basic"
        onFinish={onFinish}
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
          name="password"
          rules={[
            { required: true, message: 'Por favor, insira sua senha!' }
          ]}
        >
          <Input.Password prefix={<LockOutlined />} placeholder="Senha" />
        </Form.Item>

        <Form.Item>
          <Button type="link" onClick={() => {
            navigate('/signup');
          }}>
            Criar conta
          </Button>
          <Button type="primary" htmlType="submit">
            Entrar
          </Button>
        </Form.Item>

      </Form>
    </div>
  );
};

export default LoginForm;