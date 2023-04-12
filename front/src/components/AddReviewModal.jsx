import { React, useState, useEffect } from "react";
import { Modal, Select, Input, Button } from "antd";
import { SendOutlined } from "@ant-design/icons";
import axios from "axios";
const { Option } = Select;

const AddReviewModal = ({ open, handleOk, handleCancel, getReviews}) => {
  useEffect(() => {
    getProfessors();
    getCategories();
  }, []);

  const [professors, setProfessors] = useState([]);
  const [categories, setCategories] = useState([]);

  const [selectedCategory, setSelectedCategory] = useState(null);
  const [selectedProfessor, setSelectedProfessor] = useState(null);
  const [inputValue, setInputValue] = useState("");

  const getProfessors = async () => {
    const response = await axios.get("http://localhost:3000/index_professors/");
    setProfessors(response.data);
  };

  const getCategories = async () => {
    const response = await axios.get("http://localhost:3000/categories");
    setCategories(response.data);
  };

  const sendReview = () => {
    axios.post("http://localhost:3000/reviews", {
      description: inputValue,
      professor_id: selectedProfessor,
      category_id: selectedCategory,
    }).then(
      getReviews()
    )
  }

  const handleChangeProfessor = (value) => {
    setSelectedProfessor(value);
  };

  const handleChangeCategory = (value) => {
    setSelectedCategory(value);
  };

  const handleInputChange = (e) => {
    setInputValue(e.target.value);
    e.target.style.height = "auto";
    e.target.style.height = `${e.target.scrollHeight}px`;
  };

  const handleSendClick = () => {
    if (!inputValue) {
      alert("Escreva um review!");
      return;
    }
    if (!selectedProfessor) {
      alert("Selecione um professor!");
      return;
    }
    if(!selectedCategory) {
      alert("Selecione uma categoria!");
      return;
    }
    if (inputValue.length > 999) {
      alert("Seu review não pode ter mais de 999 caracteres!");
      return;
    }

    sendReview();
    setSelectedCategory(null);
    setSelectedProfessor(null);
    setInputValue("");
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
          id="send-post"
          type="primary"
          onClick={handleSendClick}
          icon={<SendOutlined />}
        />,
      ]}
    >
      <Input.TextArea
        id="new-post-input"
        placeholder="Qual sua opinião sobre o professor?"
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
        id="new-post-professor"
        placeholder="Escolha o professor"
        value={selectedProfessor}
        onChange={handleChangeProfessor}
        style={{ width: "100%", marginBottom: 10 }}
      >
        {professors.map((professor) => (
          <Option id={professor.name} key={professor.id} value={professor.id}>
            {professor.name}
          </Option>
        ))}
      </Select>

      <Select
        id="new-post-category"
        placeholder="Escolha a categoria"
        value={selectedCategory}
        onChange={handleChangeCategory}
        style={{ width: "100%", marginBottom: 10 }}
      >
        {categories.map((category) => (
          <Option id={category.name} key={category.id} value={category.id}>
            {category.name}
          </Option>
        ))}
      </Select>
    </Modal>
  );
};

export default AddReviewModal;
