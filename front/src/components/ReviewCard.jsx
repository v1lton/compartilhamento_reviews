import { Typography, Card } from "antd";
import { RightOutlined } from "@ant-design/icons";
import User from "./User";

const { Paragraph } = Typography;

function ReviewCard({
  studentName,
  studentPicture,
  teacherName,
  teacherPicture,
  reviewContent,
  categoryName,
}) {
  return (
    <Card bordered={false} style={{ width: "fit-content" }}>
      <header
        style={{
          display: "flex",
          flexDirection: "row",
          justifyContent: "space-between",
          alignItems: "center",
        }}
      >
        <User userName={studentName} imgSrc={studentPicture} role="Discente" />
        <RightOutlined style={{ fontSize: "300%", margin: "0 24px" }} />

        <User
          alignment="right"
          userName={teacherName}
          imgSrc={teacherPicture}
          role="Docente"
        />
      </header>
      <main
        style={{
          marginTop: "24px",
        }}
      >
        <Paragraph id="post-content"
          style={{
            fontSize: "24px",
          }}
        >
          {reviewContent}
        </Paragraph>
        <h1 id="post-category">{categoryName}</h1>
      </main>
    </Card>
  );
}

export default ReviewCard;
