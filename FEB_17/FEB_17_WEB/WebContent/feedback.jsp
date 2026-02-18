<%@ page import="java.sql.*" %>
<%@ page import="DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Training Evaluation</title>

<style>
body{
    margin:0;
    font-family: Arial;
    background:#eef1f5;
}

/* Banner */
.banner img{
    width:100%;
    height:220px;
    object-fit:cover;
}

/* Form Card */
.container{
    width:700px;
    margin:-60px auto 30px;
    background:white;
    padding:25px;
    border-radius:12px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
}

h2{
    text-align:center;
}

/* Inputs */
input, select{
    width:95%;
    padding:8px;
    margin-top:5px;
    margin-bottom:15px;
}

/* Button */
button{
    background:#5b8bd9;
    color:white;
    padding:10px 18px;
    border:none;
    border-radius:6px;
    cursor:pointer;
}

/* Table */
table{
    width:100%;
    border-collapse:collapse;
    margin-top:15px;
}

th, td{
    border:1px solid #ccc;
    padding:8px;
    text-align:center;
}

th{
    background:#e6ecf7;
}
</style>
</head>

<body>

<!-- Banner Image -->
<div class="banner">
    <img src="images/banner.jpg">
</div>

<div class="container">

<h2>Training Evaluation Form</h2>

<form action="FeedbackServlet" method="post">

Name:
<input type="text" name="name" required>

Department:
<input type="text" name="dept" required>

Course:
<select name="course">
<option>Java</option>
<option>Python</option>
<option>Web Development</option>
</select>

<h3>Rate the following:</h3>

Presenter communicated clearly:
<br>
<input type="radio" name="q1" value="1">1
<input type="radio" name="q1" value="2">2
<input type="radio" name="q1" value="3">3
<input type="radio" name="q1" value="4">4
<input type="radio" name="q1" value="5" required>5
<br><br>

Learned something new:
<br>
<input type="radio" name="q2" value="1">1
<input type="radio" name="q2" value="2">2
<input type="radio" name="q2" value="3">3
<input type="radio" name="q2" value="4">4
<input type="radio" name="q2" value="5" required>5
<br><br>

Overall Rating:
<input type="range" name="overall" min="1" max="5" required>
<br><br>

<button type="submit">Submit Feedback</button>

</form>

<hr>

<h3 style="text-align:center;">Submitted Feedback</h3>

<table>
<tr>
<th>Name</th>
<th>Dept</th>
<th>Course</th>
<th>Q1</th>
<th>Q2</th>
<th>Overall</th>
</tr>

<%
Connection con = DBConnection.getConnection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM feedback");

while(rs.next()){
%>
<tr>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("dept")%></td>
<td><%=rs.getString("course")%></td>
<td><%=rs.getInt("q1")%></td>
<td><%=rs.getInt("q2")%></td>
<td><%=rs.getInt("overall")%></td>
</tr>
<% } con.close(); %>

</table>

</div>
</body>
</html>
