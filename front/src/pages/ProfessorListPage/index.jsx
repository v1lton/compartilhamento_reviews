import React from "react";
import { Table } from "antd";
import "./ProfessorListPage.css";
import ProfessorManager from "../../components/ProfessorManager";


const ProfessorListPage = () => {
  return (
    <div className="professor-list-container">
      <div className="professor-list-header">
        <h1>My Professors</h1>
      </div>
      <ProfessorManager></ProfessorManager>
    </div>
  );
};

export default ProfessorListPage;
