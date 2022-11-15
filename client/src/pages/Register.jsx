import React, { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";

const Register = () => {
  const [inputs, setInputs] = useState({
    username: "",
    email: "",
    password: "",
  });

  const [err, setErr] = useState();

  const navigate = useNavigate();

  const handleChange = (e) => {
    setInputs((prev) => ({ ...prev, [e.target.name]: e.target.value }));
  };

  const handleSumit = async (e) => {
    e.preventDefault();
    try {
      const res = await axios.post(
        "http://localhost:8080/api/auth/register",
        inputs
      );
      console.log(res);
      navigate("/login");
    } catch (err) {
      console.log(err.response.data);
      setErr(err.response.data);
    }
  };

  console.log(inputs);

  return (
    <div className="auth">
      <h1>Register</h1>
      <form>
        <input
          required
          type="text"
          placeholder="username"
          name="username"
          onChange={handleChange}
        />
        <input
          required
          type="email"
          placeholder="email"
          name="email"
          onChange={handleChange}
        />
        <input
          required
          type="password"
          id=""
          name="password"
          placeholder="password"
          onChange={handleChange}
        />
        <button onClick={handleSumit}>Register</button>
        {err && <p>{err}</p>}
        <span>
          Do you have an account ? <Link to="/login">Login</Link>
        </span>
      </form>
    </div>
  );
};

export default Register;