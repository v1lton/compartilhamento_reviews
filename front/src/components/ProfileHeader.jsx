import { useState } from 'react';
import { Button } from 'antd';
import User from './User';
import { useLocation, useNavigate } from 'react-router-dom';

function ProfileHeader({
  user,
  onFollow,
  onUnfollow,
  isFollowing,
  goTo,
}) {
  const [sectionIndex, setSectionIndex] = useState(0);
  const location = useLocation();
  const navigate = useNavigate();

  return (
    <>
      <header 
        style={{
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-around",
          alignItems: "center",
          padding: "16px",
          position: "fixed",
          boxShadow: "0 0 10px 0 rgba(0, 0, 0, 0.2)",
          top: "0",
          width: "100vw",
          zIndex: 1,
          backgroundColor: "#f5f5f5"
        }}
      >
        {location.pathname === '/profile' && (
          <div style={{position: 'absolute', left: '16px', top: '16px'}}>
            <Button onClick={() => {
              navigate('/profile/edit');
            }}>
              Editar perfil
            </Button>
            <Button
              style={{ marginLeft: "16px" }}
            >
              Editar meus professores
            </Button>
          </div>
        )}
            <User alignment='bottom' userName={`${user.name} ${user.surname}`} />
            {location.pathname !== '/profile' && (
              <Button
                style={{ marginTop: "16px" }}
                onClick={isFollowing ? onUnfollow : onFollow}
              >
                {isFollowing ? "Deixar de seguir" : "Seguir"}
              </Button>
            )}

            <div
              style={{
                display: "flex",
                flexDirection: "row",
                justifyContent: "space-around",
                alignItems: "center",
                margin: "16px 0 0 0"
              }}
            >
              <Button 
                onClick={() => {
                  goTo(0);
                  setSectionIndex(0);
                }}
                type={sectionIndex === 0 ? 'primary' : 'default'}
              >
                Reviews
              </Button>
              <Button 
                style={{ margin: "0 8px" }}
                onClick={() => {
                  goTo(1);
                  setSectionIndex(1);
                }}
                type={sectionIndex === 1 ? 'primary' : 'default'}
                data-testid='followers-button'
              >
                Seguidores
              </Button>
              <Button 
                onClick={() => {
                  goTo(2);
                  setSectionIndex(2);;
                }}
                type={sectionIndex === 2 ? 'primary' : 'default'}
              >
                Seguindo
              </Button>
            </div>

        </header>

        <header 
          style={{
            display: "flex",
            flexDirection: "column",
            justifyContent: "space-around",
            alignItems: "center",
            padding: "16px",
            boxShadow: "0 0 10px 0 rgba(0, 0, 0, 0.2)",
            zIndex: 1,
            backgroundColor: "#f5f5f5",
            position: 'relative', 
            top: 0, 
            left: 0, 
            visibility: 'hidden',
          }}
        >
            <User alignment='bottom'/>
            <Button
              style={{ marginTop: "16px" }}
            >
              Seguir
            </Button>

            <div
              style={{
                display: "flex",
                flexDirection: "row",
                justifyContent: "space-around",
                alignItems: "center",
                margin: "16px 0 0 0"
              }}
            >
              <Button 
                className='section-button' 
                style={{ margin: "0 8px" }}
                onClick={() => {
                  goTo(0);
                  setSectionIndex(0);
                }}
                type={sectionIndex === 0 ? 'primary' : 'default'}
              >
                Reviews
              </Button>
              <Button 
                className='section-button' 
                onClick={() => {
                  goTo(1);
                  setSectionIndex(1);
                }}
                type={sectionIndex === 1 ? 'primary' : 'default'}
              >
                Seguidores
              </Button>
              <Button 
                className='section-button' 
                onClick={() => {
                  goTo(2);
                  setSectionIndex(2);;
                }}
                type={sectionIndex === 2 ? 'primary' : 'default'}
              >
                Seguindo
              </Button>
            </div>

        </header>
    </>
  );
}

export default ProfileHeader;
