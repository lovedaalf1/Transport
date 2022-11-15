import React, { useContext, useState } from "react";
import ReactQuill from "react-quill";
import "react-quill/dist/quill.snow.css";
import axios from "axios";
import { useLocation, useNavigate } from "react-router-dom";
import moment from "moment";
import { AuthContext } from "../context/authContext";

const Write = () => {
  const { currentUser } = useContext(AuthContext);

  const state = useLocation().state;
  const [value, setValue] = useState(state?.title || "");
  const [title, setTitle] = useState(state?.desc || "");
  const [file, setFile] = useState(null);
  const [cat, setCat] = useState(state?.cat || "");

  const navigate = useNavigate();

  const upload = async () => {
    try {
      const formData = new FormData();
      formData.append("file", file);
      const res = await axios.post(
        "http://localhost:8080/api/upload",
        formData
      );
      return res.data;
    } catch (err) {
      console.log(err);
    }
  };

  const handleClick = async (e) => {
    e.preventDefault();
    const imgUrl = await upload();

    try {
        await axios.post(`http://localhost:8080/api/posts/`, {
            title,
            desc: value,
            cat,
            img: file ? imgUrl : "",
            date: moment(Date.now()).format("YYYY-MM-DD HH:mm:ss"),
            id: currentUser.id,
          });
      navigate("/");
    } catch (err) {
      console.log(err);
    }
  };

  return (
    <div className="add">
      <div className="content">
        <input
          type="text"
          placeholder="Title"
          onChange={(e) => setTitle(e.target.value)}
        />
        <div className="editorContainer">
          <ReactQuill
            className="editor"
            theme="snow"
            value={value}
            onChange={setValue}
          />
        </div>
      </div>
      <div className="menu">
        <div className="item">
          <h1>Publish</h1>
          <span>
            <b>Status: </b> Draft
          </span>
          <span>
            <b>Visibility: </b> Public
          </span>
          <input
            style={{ display: "none" }}
            type="file"
            id="file"
            name=""
            onChange={(e) => setFile(e.target.files[0])}
          />
          <label className="file" htmlFor="file">
            Upload Image
          </label>
          <div className="buttons">
            <button onClick={handleClick}>Publish</button>
          </div>
        </div>
        <div className="item">
          <h1>Category</h1>
          <div className="cat">
            <input
              type="radio"
              checked={cat === "ThailandPost"}
              name="cat"
              value="ThailandPost"
              id="ThailandPost"
              onChange={(e) => setCat(e.target.value)}
            />
            <label htmlFor="ThailandPost">Thailand Post</label>
          </div>
          <div className="cat">
            <input
              type="radio"
              checked={cat === "KERRY"}
              name="cat"
              value="KERRY"
              id="KERRY"
              onChange={(e) => setCat(e.target.value)}
            />
            <label htmlFor="KERRY">KERRY</label>
          </div>
          <div className="cat">
            <input
              type="radio"
              checked={cat === "JT"}
              name="cat"
              value="JT"
              id="JT"
              onChange={(e) => setCat(e.target.value)}
            />
            <label htmlFor="JT">J&T</label>
          </div>
          <div className="cat">
            <input
              type="radio"
              checked={cat === "FLASH"}
              name="cat"
              value="FLASH"
              id="FLASH"
              onChange={(e) => setCat(e.target.value)}
            />
            <label htmlFor="FLASH">FLASH</label>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Write;
