import React from "react";
import { Button } from "antd";
import { PlusOutlined } from "@ant-design/icons";

const AddReviewButton = ({onClick}) => {
  return (
    <Button
      id="create-new-post"
      type="primary"
      shape="circle"
      size="large"
      icon={<PlusOutlined />}
      onClick={onClick}
      style={{
        position: "fixed",
        bottom: "7em",
        right: "7em",
      }}
    />
  );
};

export default AddReviewButton;
