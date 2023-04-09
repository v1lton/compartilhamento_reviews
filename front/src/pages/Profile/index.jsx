import { useRef, useEffect, useState } from 'react';
import { Carousel, Card } from 'antd';
import ReviewCard from '../../components/ReviewCard';
import ProfileHeader from '../../components/ProfileHeader';
import User from '../../components/User';
import axios from 'axios';

const reviews = [
  {
    reviewContent: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
  },
  {
    reviewContent: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
  },
  {
    reviewContent: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
  },
  {
    reviewContent: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
  },
  {
    reviewContent: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
  },
  {
    reviewContent: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
  },
  {
    reviewContent: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
  },
  {
    reviewContent: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
  },
  {
    reviewContent: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
  },

]

function App() {
  const carouselRef = useRef(null);
  const [currentUser, setCurrentUser] = useState({});

  const onLoad = async (values) => {
    try {
      const response = await axios.get('http://localhost:3000/logged_user/');
      setCurrentUser(response.data);
    } catch (error) {
      // Error handling
    }
  };

  useEffect(() => {
    onLoad();
  }, []);

  return (
    <section
      style={{
        minHeight: '100vh',
        height: '100%',
        backgroundColor: '#f5f5f5',
      }}
    >

      <ProfileHeader
        user={currentUser}
        goTo={(index) => {
          carouselRef.current.goTo(index)
        }}
      />

      <Carousel ref={carouselRef} dots={false}>
        <div>
          <main
            style={{
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
              justifyContent: 'center',
              padding: '16px',
              margin: '0 auto',
              maxWidth: '1080px',
            }}
          >
            {reviews.map((review, index) => (
              <div
                style={{
                  marginBottom: '16px'
                }}
              >
                <ReviewCard key={index} reviewContent={review.reviewContent} />
              </div>
            ))}
          </main>
        </div>
        <div>
          <main>
            {reviews.map((review, index) => (
              <div className='review-card-container'>
                <Card
                  style={{
                    width: 'fit-content',
                    margin: '8px auto'
                  }}
                >
                  <User></User>
                </Card>
              </div>
            ))}
          </main>
        </div>
        <div>
          <main>
            {reviews.map((review, index) => (
              <div className='review-card-container'>
                <Card
                  style={{
                    width: 'fit-content',
                    margin: '8px auto'
                  }}
                >
                  <User></User>
                </Card>
              </div>
            ))}
          </main>
        </div>
      </Carousel>

    </section>
  );
}

export default App;
