import { useState, useEffect } from "react";
import { Button, Input, List, Typography, Row, Col } from "antd";
import { DeleteOutlined } from "@ant-design/icons";
import axios from "axios"
import "./ProfessorManager.css";

const { Title } = Typography;

const ProfessorManager = () => {
  const [professors, setProfessors] = useState([]);
  const [newProfessor, setNewProfessor] = useState("");

  const handleGetProfessors = async () => {
    try {
      const response = await axios.get('http://localhost:3000/professors/')
    return response.data
    console.log(response.data);
    // Success handling
    }
    catch (error) {
      console.error(error);
      // Error handling
    }
  };

  useEffect(() => {
    // const response = handleGetProfessors()
    // setProfessors(response);
  }, [])

  const handleAddProfessor = () => {
    if (newProfessor !== "") {
      setProfessors([...professors, newProfessor]);
      setNewProfessor("");
    }
  };

  const handleRemoveProfessor = (professor) => {
    setProfessors(professors.filter((p) => p !== professor));
  };

  const handleKeyDown = (e) => {
    if (e.key === "Enter") {
      handleAddProfessor();
    }
  };


  const handleSaveProfessors = async (values) => {
    try {
      const response = await axios.post('http://localhost:3000/professors/', {professorsList: professors});
      console.log(response.data);
      // Success handling
    } catch (error) {
      console.error(error);
      // Error handling
    }
  };

  return (
    <div className="professor-manager-container">
      <Title level={2} className="professor-manager-title">
        Manage Professors
      </Title>
      <div className="professor-manager-input-container">
        <Input
          value={newProfessor}
          onChange={(e) => setNewProfessor(e.target.value)}
          onKeyDown={handleKeyDown}
          placeholder="Enter a professor's name"
          className="professor-manager-input"
        />
        <Button type="primary" onClick={handleAddProfessor}>
          Add
        </Button>
      </div>
      
      <Row justify="center">
        <Col span={20}>
          <List
            dataSource={professors}
            renderItem={(item) => (
              <List.Item className="professor-manager-list-item">
                <div className="professor-manager-name">
                <span className="professor-manager-list-item-name">{item}</span>
                </div>
                <Button
                  type="danger"
                  onClick={() => handleRemoveProfessor(item)}
                  style={{ marginRight: '5px' }}
                  icon={<DeleteOutlined />}
                  className="professor-manager-remove-button"
                />
              </List.Item>
            )}
          />
        </Col>
      </Row>

      <Button type="primary" onClick={handleSaveProfessors}>
        Save
      </Button>

    </div>
  );
};

export default ProfessorManager;
