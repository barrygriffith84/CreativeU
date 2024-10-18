import  { useEffect,  useState } from "react";
import { ListGroup, ListGroupItem } from "reactstrap";
import { useParams } from "react-router-dom";
import { Post } from "./Post";
import { getPost } from "../services/PostService";

export const PostDetails = () => {
  const [post, setPost] = useState();
  const { id } = useParams();

  useEffect(() => {
    getPost(id).then(setPost);
  }, []);

  if (!post) {
    return null;
  }

  return (
    <div className="container">
      <div className="row justify-content-center">
        <div >
          <Post post={post} />
        </div>
      </div>
    </div>
  );
};