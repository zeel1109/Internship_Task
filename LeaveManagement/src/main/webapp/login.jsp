<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>

body{font-family:Poppins,sans-serif;background:linear-gradient(135deg,#667eea,#764ba2);display:flex;height:100vh;align-items:center;justify-content:center;margin:0}
.card{background:#fff;padding:40px;border-radius:20px;width:360px;text-align:center}
.msg{margin-bottom:10px;font-weight:600}
.error{color:red}.success{color:green}
input,button{width:100%;padding:10px;margin:8px 0;border-radius:8px;border:1px solid #ccc}
button{background:#667eea;color:#fff;border:none}
</style>
</head>
<body>
<div class="card">
<h2>Welcome Back !! Login</h2>
    <% if(request.getParameter("error")!=null){ %>
<div class="msg error">Invalid email or password</div>
<% } %>

<form action="LoginServlet" method="post">
<input type="email" name="email" placeholder="Email" required>
<input type="password" name="password" placeholder="Password" required>
<button type="submit">Login</button>
</form>

<p>New user? <a href="register.jsp">Register</a></p>
</div>
</body>
</html>