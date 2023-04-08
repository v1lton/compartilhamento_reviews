import React, { useState } from 'react';
import { List, Input, Button, Avatar, Popover } from 'antd';
import { DeleteOutlined,  HeartOutlined, HeartFilled  } from '@ant-design/icons';
import moment from 'moment';


const { TextArea } = Input;
const timeStamp = moment().format('lll');



const CommentSection = () => {
  const [comment, setComment] = useState('');
  const [comments, setComments] = useState([]);

  const handleCommentSubmit = () => {
    const now = new Date().toLocaleString();
    const newComment = {
      text: comment,
      timestamp: moment().format('lll'),
      likes: 0
    };
    setComments([...comments, newComment]);
    setComment('');
  };


  const handleLikeComment = (index) => {
    const updatedComments = [...comments];
    updatedComments[index].likes += 1;
    setComments(updatedComments);
  };

  const [deletingComment, setDeletingComment] = useState(null);

  const handleDeleteComment = (index) => {
    setComments(comments.filter((_, i) => i !== index));
    setDeletingComment(null);
  };

  const handlePopoverVisibleChange = (visible, index) => {
    if (!visible) {
      setDeletingComment(null);
    } else {
      setDeletingComment(index);
    }
  };
  
  return (
    <>
      <div style={{ display: 'flex', marginBottom: '8px' }}>
        <Avatar size={32} src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2970&q=80" 
                      style={{width: '32px', height: '32px'}} />
        <div style={{ marginLeft: '8px', flexGrow: '1' }}>
          <TextArea
            placeholder="Comment hear..."
            value={comment}
            onChange={(e) => setComment(e.target.value)}
            autoSize={{ minRows: 1, maxRows: 3 }}
            style={{ borderRadius: '9px', padding: '8px 12px', fontSize: '14px' }}
          />
        </div>

        <Button
         type="primary" 
         style={{ 
            borderRadius: '999px',
            top: '1px',
            right: '-4px' 
          }} onClick={handleCommentSubmit}>
           Send
        </Button>
      </div>
      <List
        dataSource={comments}
        renderItem={(item, index) => (
          <List.Item
             actions={[
              <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                  {item.likes > 0 ? (
                    <span style={{ marginRight: '4px' }}>{item.likes}</span>
                  ) : null}
                 <Button type="text" icon={item.likes > 0 ? <HeartFilled /> : <HeartOutlined />}
                    onClick={() => handleLikeComment(index)}
                  />
                </div>,
                 <Popover
                  content={
                    deletingComment === index ?  (
                    <></>
                    ) : (
                      <>
                        <Button
                          type="primary"
                          danger
                          onClick={() => handleDeleteComment(index)}
                          >
                          Confirm   
                        </Button>
                      </>
                    )
                  }
                  trigger="click"
                  >   
                  <Button danger onClick={() => setDeletingComment(null)}>
                    <DeleteOutlined />
                  </Button>
                </Popover>,
                
              ]}
            >
            <List.Item.Meta
              avatar={ <Avatar size={32} src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2970&q=80" 
                      style={{width: '32px', height: '32px'}} />}
              title={
                <div style={{ alignItems: 'center', marginLeft: '8px', flexGrow: '1' }}>
                  <a href="#example">{item.text}</a>
                  <span style={{ display: 'flex', alignItems: 'center', justifyContent: 'flex-start', marginLeft: '650px' }}>
                  {item.timestamp}</span>
                </div>
              }
              style={{ display: 'flex', alignItems: 'center', justifyContent: 'flex-start' }}
            />
          </List.Item>
        )}
      />
    </>
  );
};


export default CommentSection;