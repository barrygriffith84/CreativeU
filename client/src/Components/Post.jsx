import { Card, CardImg, CardBody, ListGroup, ListGroupItem } from "reactstrap";
import { Link, useNavigate } from "react-router-dom";
import { deletePost } from "../services/PostService";


export const Post = ({ post }) => {

    const userProfileId = JSON.parse(localStorage.getItem("userProfile")).id;
   let navigate = useNavigate();

  return (
    
    <Card className="m-4">
        {console.log(userProfileId)}
            <Link to={`/Users/${post.userProfileId}`} className="navbar-brand">
            Posted by: {post.userProfile?.displayName}</Link>
      <CardImg top src={post.imageLocation} alt={post.title} />
      <CardBody>
        <p>
          <Link to={`/posts/${post.id}`}>
          <strong>{post.title}</strong>
          </Link>
        </p>
        <p>{post.content}</p>
        {post.userProfileId == userProfileId ? <><button onClick={() => {navigate(`/posts/edit/${post.id}`)}}>Edit</button> <button onClick={() => {deletePost(post.id).then(() => {navigate("/posts")})}}>Delete</button></> : ""}
    </CardBody>
    </Card>
  );
};