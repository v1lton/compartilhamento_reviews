import { useRef, useEffect, useState } from 'react';
import { Carousel, Card } from 'antd';
import ReviewCard from '../../components/ReviewCard';
import ProfileHeader from '../../components/ProfileHeader';
import User from '../../components/User';
import axios from 'axios';
import { useParams, useNavigate } from 'react-router-dom';

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
  const [following, setFollowing] = useState([]);
  const [followers, setFollowers] = useState([]);
  const [isFollowing, setIsFollowing] = useState(false);
  const {user_id} = useParams()
  const navigate = useNavigate();

  const onLoadProfile = async () => {
    try {
      const response = await axios.get('http://localhost:3000/logged_user/');
      setCurrentUser(response.data.user);
      setFollowing(response.data.following);
      setFollowers(response.data.followers);
    } catch (error) {
      // Error handling
    }
  };

  const onLoadOtherUser = async () => {
    try {
      const response = await axios.get(`http://localhost:3000/users/${user_id}`);
      setIsFollowing(response.data.follows);
      setCurrentUser(response.data.user);
      setFollowing(response.data.following);
      setFollowers(response.data.followers);
    } catch (error) {
      navigate('/');
    }
  }

  const follow = async () => {
    try {
      const response = await axios.post('http://localhost:3000/relationships/', { followed_id: user_id });
      setIsFollowing(true);
    } catch (error) {
      // Error handling
    }
  }

  const unfollow = async () => {
    try {
      const response = await axios.delete(`http://localhost:3000/relationships/${user_id}`);
      setIsFollowing(false);
    } catch (error) {
      // Error handling
    }
  }

  useEffect(() => {
    if (user_id) {
      onLoadOtherUser();
    } else {
      onLoadProfile();
    }
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
        onFollow={follow}
        onUnfollow={unfollow}
        isFollowing={isFollowing}
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
            {followers.map((user, index) => (
              <div className='review-card-container'>
                <Card
                  style={{
                    width: 'fit-content',
                    margin: '8px auto'
                  }}
                >
                  <User userName={`${user.name} ${user.surname}`}></User>
                </Card>
              </div>
            ))}
          </main>
        </div>
        <div>
          <main>
            {following.map((user, index) => (
              <div className='review-card-container'>
                <Card
                  style={{
                    width: 'fit-content',
                    margin: '8px auto'
                  }}
                >
                  <User userName={`${user.name} ${user.surname}`}></User>
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
