import { useState, useEffect } from "react";
import { Button, List, Typography, Row, Col , Select} from "antd";
import { DeleteOutlined } from "@ant-design/icons";
import axios from "axios"
import "./ProfessorManager.css";

const { Title } = Typography;
const { Option } = Select;

const ProfessorManager = () => {
  const [professors, setProfessors] = useState([]);
  const [myProfessors, setMyProfessors] = useState([]);
  const [selectedProfessor, setSelectedProfessor] = useState("");

  const fetchMyProfessors = async () => {
    try {
      const response = await axios.get('http://localhost:3000/index_professors/')
      setMyProfessors(response.data)
      return response.data
      // Success handling
    }
    catch (error) {
      console.error(error);
      // Error handling
    }
  };

  const fetchProfessors = async () => {
    try {
      const response = await axios.get('http://localhost:3000/professors/')
      setProfessors(response.data)
      return response.data
      // Success handling
    }
    catch (error) {
      console.error(error);
      // Error handling
    }
  };

  useEffect(() => {
    fetchProfessors()
    fetchMyProfessors()
  }, [])

  const handleAddProfessor = async () => {
    if (selectedProfessor !== "" && !myProfessors.includes(selectedProfessor)) {
      try {
        await axios.post('http://localhost:3000/teaching_relationships/', {professor_id: selectedProfessor.id});
        setMyProfessors([...myProfessors, selectedProfessor]);
        setSelectedProfessor("");
      } catch (error) {
        console.error(error);
      }
    }
  };

  const handleRemoveProfessor = async (professor) => {
    try {
      await axios.delete(`http://localhost:3000/teaching_relationships/${professor.id}`);
      setMyProfessors(myProfessors.filter((p) => p !== professor));
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <div className="professor-manager-container">
      <Title level={2} className="professor-manager-title">
        Manage Professors
      </Title>
      <div className="professor-manager-input-container">
      <Select
          id="manage-professors-select"
          showSearch
          style={{ width: "50%", margin: "0 auto" }}
          value={selectedProfessor.name}
          onSelect={(value) => setSelectedProfessor(professors.find(x => x.id === value))}//professors.find(x => x.id === value.id))}
          placeholder="Select a professor"
          optionFilterProp="children"
          filterOption={(input, option) =>
            option.children.toLowerCase().indexOf(input.toLowerCase()) >= 0
          }
        >
          {professors.map((professor) => (
            <Option id={professor.name} key={professor.id} value={professor.id}>
              {professor.name}
            </Option>
          ))}
        </Select>
        <Button id="add-professor-button" type="primary" onClick={handleAddProfessor}>
          Add
        </Button>
      </div>
      
      <Row justify="center">
        <Col span={20}>
          <List
            dataSource={myProfessors}
            renderItem={(item) => (
              <List.Item className="professor-manager-list-item">
                <div className="professor-manager-name">
                <span className="professor-manager-list-item-name">{item.name}</span>
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

    </div>
  );
};



export default ProfessorManager;
