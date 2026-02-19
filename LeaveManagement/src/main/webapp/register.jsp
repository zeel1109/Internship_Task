<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
body {
    margin:0;
    font-family:'Poppins',sans-serif;
    height:100vh;
    background:linear-gradient(135deg,#ff9a9e,#fad0c4);
    display:flex;
    align-items:center;
    justify-content:center;
}

.card {
    background:white;
    padding:40px;
    border-radius:20px;
    width:100%;
    max-width:420px;
    box-shadow:0 20px 40px rgba(0,0,0,0.2);
    animation:fadeIn 0.8s ease;
}

h2 { text-align:center; margin-bottom:25px; }

.input-group { margin-bottom:16px; }
input {
    width:100%;
    padding:12px;
    border-radius:10px;
    border:1px solid #ddd;
    transition:0.3s;
}

input:focus {
    border-color:#ff758c;
    outline:none;
    box-shadow:0 0 8px rgba(255,117,140,0.3);
}

button {
    width:100%;
    padding:12px;
    border:none;
    border-radius:12px;
    background:linear-gradient(135deg,#ff758c,#ff7eb3);
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

button:hover { transform:translateY(-2px); box-shadow:0 10px 20px rgba(0,0,0,0.2); }

p { text-align:center; margin-top:15px; }

a { color:#ff4d6d; text-decoration:none; font-weight:500; }
@keyframes fadeIn { from{opacity:0; transform:translateY(20px);} to{opacity:1;} }
</style>
</head>

<body>
<div class="card">
    <h2>Create Account</h2>
    <form action="RegisterServlet" method="post">
        <div class="input-group">
            <input type="text" name="name" placeholder="Full Name" required>
        </div>
        <div class="input-group">
            <input type="email" name="email" placeholder="Email Address" required>
        </div>
        <div class="input-group">
            <input type="password" name="password" placeholder="Password" required>
        </div>
        <button type="submit">Register</button>
    </form>

    <p>Already have an account? <a href="login.jsp">Login</a></p>
</div>
</body>
</html>