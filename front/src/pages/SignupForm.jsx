import React, { useState } from 'react';
import { Form, Input, Button, Alert } from 'antd';
import { UserOutlined, LockOutlined, MailOutlined, FlagOutlined, TeamOutlined } from '@ant-design/icons';
import axios from 'axios';
import { useNavigate } from "react-router-dom";

const SignupForm = ({setIsAuthenticated}) => {
  const [form] = Form.useForm();
  const [confirmDirty, setConfirmDirty] = useState(false);
  const [errorMessage, setErrorMessage] = useState(null);
  const navigate = useNavigate();

  const onFinish = async (values) => {
    try {
      const response = await axios.post('http://localhost:3000/users/', {user: {
        username: values.username,
        email: values.email,
        password: values.password,
        password_confirmation: values.password_confirmation,
        name: values.name,
        surname: values.surname,
        pronouns: values.pronouns,
        country: values.country,
      }});
  
      setIsAuthenticated(true);
      navigate('/');
    } catch (error) {
      setIsAuthenticated(false);
      setErrorMessage("Não foi possível criar uma conta. Por favor, confira seus dados.");
    }
  };

  const onClose = (e) => {
    setErrorMessage(null);
  };

  const handleConfirmBlur = (e) => {
    const { value } = e.target;
    setConfirmDirty(confirmDirty || !!value);
  };
  
  return (
    <div style={{ maxWidth: 500, margin: '16px auto 0 auto' }}>

      <h1>Cadastro</h1>

      {errorMessage && < Alert message="Erro ao criar nova conta" description={errorMessage} type="error" closable onClose={onClose} />}

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
          name="email"
          rules={[
            { required: true, message: 'Por favor, insira seu endereço de email!' },
            { type: 'email', message: 'O endereço de email não é válido!' },
          ]}
        >
          <Input prefix={<MailOutlined />} placeholder="Email" />
        </Form.Item>

        <Form.Item
          name="password"
          rules={[
            { required: true, message: 'Por favor, insira sua senha!' },
            { min: 8, message: 'A senha deve ter pelo menos 8 caracteres!' },
          ]}
        >
          <Input.Password prefix={<LockOutlined />} placeholder="Senha" />
        </Form.Item>

        <Form.Item
          name="password_confirmation"
          dependencies={['password']}
          rules={[
            { required: true, message: 'Por favor, confirme sua senha!' }
          ]}
        >
          <Input.Password
            prefix={<LockOutlined />}
            placeholder="Confirmar senha"
            onBlur={handleConfirmBlur}
          />
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
            Cadastrar
          </Button>
        </Form.Item>

      </Form>
    </div>
  );
};

export default SignupForm;