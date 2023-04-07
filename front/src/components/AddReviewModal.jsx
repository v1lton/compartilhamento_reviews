import React, { useState } from "react";
import { Modal, Select, Input, Button } from "antd";
import { SendOutlined } from "@ant-design/icons";
const { Option } = Select;

const professors = [
  "Anderson Costa",
  "Augusto Sampaio",
  "Eduardo Alchieri",
  "Fernando Castor",
  "Flávio Coutinho",
  "José Antônio Fernandes de Macedo",
  "Leopoldo Teixeira",
  "Márcio Cornélio",
  "Roberto Fernandes Tavares de Melo",
  "Thais Batista",
];

const AddReviewModal = ({ open, handleOk, handleCancel }) => {
  const [selectedProfessor, setSelectedProfessor] = useState(null);
  const [inputValue, setInputValue] = useState("");

  const handleChange = (value) => {
    setSelectedProfessor(value);
  };

  const handleInputChange = (e) => {
    setInputValue(e.target.value);
    e.target.style.height = "auto";
    e.target.style.height = `${e.target.scrollHeight}px`;
  };

  const handleSendClick = () => {
    if (!inputValue) {
      alert("Escreva uma review!");
      return;
    }
    if (!selectedProfessor) {
      alert("Selecione um professor!");
      return;
    }
    if (inputValue.length > 999) {
      alert("Seu review não pode ter mais de 999 caracteres!");
      return;
    }

    console.log(`Selected professor: ${selectedProfessor}`);
    console.log(`Input value: ${inputValue}`);

    /*
    
    todo: send to the reviews db:

    ! the name of the student -> (get from session);

    *the name of the professor -> got it;
    *the review itself -> got it;
    
    */

    handleCancel();
  };

  return (
    <Modal
      title="Novo Review"
      open={open}
      onOk={handleOk}
      onCancel={handleCancel}
      footer={[
        <Button
          type="primary"
          onClick={handleSendClick}
          icon={<SendOutlined />}
        />,
      ]}
    >
      <Input.TextArea
        placeholder="Qual sua opninião sobre o professor?"
        value={inputValue}
        onChange={handleInputChange}
        style={{
          width: "100%",
          minHeight: 35,
          overflow: "hidden",
          marginBottom: 10,
        }}
      />

      <Select
        placeholder="Escolha o professor"
        value={selectedProfessor}
        onChange={handleChange}
        style={{ width: "100%", marginBottom: 10 }}
      >
        {professors.map((professor) => (
          <Option key={professor} value={professor}>
            {professor}
          </Option>
        ))}
      </Select>
    </Modal>
  );
};

export default AddReviewModal;
