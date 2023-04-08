import React, { useState } from 'react';
import { List, Input, Button, Avatar, Popover } from 'antd';
import { UserOutlined, EllipsisOutlined } from '@ant-design/icons';
import User from "./User";

const { TextArea } = Input;


const CommentSection = () => {
  const [comment, setComment] = useState('');
  const [comments, setComments] = useState([]);

  const handleCommentSubmit = () => {
    setComments([...comments, comment]);
    setComment('');
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
        <Avatar size={32} icon={<UserOutlined />} />
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
                <Popover
                content={
                deletingComment === index ? (
                    <>
                    <Button danger onClick={() => setDeletingComment(null)}>
                     Cancel
                    </Button>
                    <Button
                        type="primary"
                        danger
                        onClick={() => handleDeleteComment(index)}
                        >
                         Confirm   
                        </Button>
                    </>
                ) : (
                    <Button>Delete</Button>
                )
            }
            trigger="click"
            >
            <EllipsisOutlined />
            </Popover>,
             ]}
             >
            <List.Item.Meta
              avatar={<Avatar size={32} src={<User imgSrc={item.imgSrc} />} />}
              title={<a href="#example">{item}</a>}
              style={{ display: 'flex', alignItems: 'left', justifyContent: 'flex-start' }}
            />
          </List.Item>
        )}
      />
    </>
  );
};


export default CommentSection;