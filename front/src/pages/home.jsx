import { React, useState, useEffect } from "react";
import { Button } from "antd";
import ReactDOM from "react-dom";
import axios from "axios";
import ReviewCard from "../components/ReviewCard";
import AddReviewModal from "../components/AddReviewModal";
import AddReviewButton from "../components/AddReviewButton";
import { PlusOutlined } from "@ant-design/icons";
import Search from "../components/Search";


const Home = () => {
  const [inputValueSearch, setInputValueSearch] = useState("");
  const [searchError, setSearchError] = useState("");
  const [reviews, setReviews] = useState([]);
  const [addVisible, setAddVisible] = useState(false);

  const executeSearch = async () => {
    try {
      if (inputValueSearch === "") {
        setSearchError(`Nenhuma categoria selecionada`)
        setReviews([]);
        return;
      }

      const result = await axios.get(`http://localhost:3000/reviews_by_category/?category_name=${inputValueSearch}`);
      setReviews(result.data);
      console.log(result.data)
      setSearchError(`Infelizmente não encontramos nenhum resultado para ${inputValueSearch}`)
    }
    catch (error) {
      setSearchError(`A categoria ${inputValueSearch} não existe`)
      setReviews([]);
    }
  };

  useEffect(() => {
    document.title = "Página Inicial";
    getReviews();
  }, []);


  const getReviews = async () => {
    const response = await axios.get("http://localhost:3000/reviews");
    setReviews(response.data);
    console.log(response.data)
  };

  const showAddModal = () => {
    setAddVisible(true);
  };

  const handleAddOk = () => {
    setAddVisible(false);
  };

  const handleAddCancel = () => {
    setAddVisible(false);
  };

  return (
    <div className="home-container">

      <div className="feed">

        <main
          style={{
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            justifyContent: "center",
            padding: "16px",
            margin: "0 auto",
            maxWidth: "1080px",
          }}
        >
          <Search onChange={setInputValueSearch} onClick={executeSearch} />
          {reviews.length > 0 ? reviews.map((review, index) => (
            <div
              style={{
                marginBottom: "16px",
              }}
            >
              <ReviewCard key={index} reviewContent={review.review_content} studentName={review.user_name} teacherName={review.professor_name} categoryName={review.category_name} />
            </div>
          )) : <h1 id="search-error">{searchError}</h1>}
        </main>
      </div>

      <AddReviewButton onClick={showAddModal} />
      <AddReviewModal
        open={addVisible}
        handleOk={handleAddOk}
        handleCancel={handleAddCancel}
        getReviews={getReviews}
      />
    </div>
  );
};

export default Home;
