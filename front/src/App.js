import './App.css';
import Home from "./pages/home"
import Profile from "./pages/Profile"
import LoginForm from "./pages/LoginForm"
import SignupForm from "./pages/SignupForm"
import {Routes, Route} from 'react-router-dom';
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import ProfessorListPage from './pages/ProfessorListPage';


function App() {
  const [isAuthenticated, setIsAuthenticated] = useState(false);

  const onLoad = async () => {
    try {
      axios.defaults.withCredentials = true;
      const response = await axios.get('http://localhost:3000/is_logged/');

      setIsAuthenticated(true)
      console.log(response.data);
    } catch (error) {
      setIsAuthenticated(false)
      console.error(error);
    }
  }; 

  useEffect(() => {
    onLoad();
  }, []);
  
  return (
    <div className="App">
      {isAuthenticated ? (
        <Routes>
          <Route path="/" element={ <Home /> }></Route>
          <Route path="/profile" element={<Profile/>}></Route>
          <Route path="/myprofessors" element={<ProfessorListPage/>}></Route>
        </Routes>
        ) : (
          <Routes>
            <Route path="/" element={ <LoginForm setIsAuthenticated={setIsAuthenticated} /> } ></Route>
            <Route path="/signup" element={<SignupForm setIsAuthenticated={setIsAuthenticated} />}></Route>
          </Routes>
        )}
    </div>
  );
}

export default App;
