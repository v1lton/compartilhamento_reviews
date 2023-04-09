import { React, useState, useEffect } from "react";
import { Button } from "antd";
import ReactDOM from "react-dom";
import ReviewCard from "../components/ReviewCard";
import AddReviewModal from "../components/AddReviewModal";
import AddReviewButton from "../components/AddReviewButton";
import { PlusOutlined } from "@ant-design/icons";
import Search from "../components/Search";
import axios from "axios";

const reviewsAux = [
  {
    reviewContent:
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
  },
  {
    reviewContent:
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
  },
  {
    reviewContent:
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
  },
  {
    reviewContent:
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
  },
  {
    reviewContent:
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
  },
  {
    reviewContent:
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
  },
  {
    reviewContent:
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
  },
  {
    reviewContent:
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
  },
  {
    reviewContent:
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
  },
];

const Home = () => {
  const [inputValueSearch, setInputValueSearch] = useState("");
  const [searchError, setSearchError] = useState("");
  const [reviews, setReviews] = useState(reviewsAux);

  const executeSearch = async () => {
    try {
      const result = await axios.get(`http://localhost:3000/reviews_by_category/?category_name=${inputValueSearch}`);
      setReviews(result.data);
      setSearchError(`Infelizmente não encontramos nenhum resultado para ${inputValueSearch}`)
    }
    catch (error) {
      setSearchError(`A categoria ${inputValueSearch} não existe`)
      setReviews([]);
    }
  };


  <></>
  useEffect(() => {
    document.title = "Página Inicial";
  }, []);

  const [addVisible, setAddVisible] = useState(false);

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
              <ReviewCard key={index} reviewContent={review.reviewContent} />
            </div>
          )) : <h1>{searchError}</h1>}
        </main>
      </div>

      <AddReviewButton onClick={showAddModal} />
      <AddReviewModal
        open={addVisible}
        handleOk={handleAddOk}
        handleCancel={handleAddCancel}
      />
    </div>
  );
};

export default Home;
