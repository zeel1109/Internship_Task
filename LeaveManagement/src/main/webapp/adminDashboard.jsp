<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*, dao.Leave" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Dashboard</title>

<style>
body {
    margin:0;
    font-family:'Poppins',sans-serif;
    background:linear-gradient(135deg,#667eea,#764ba2);
    padding:30px;
}

.table-container {
    background:white;
    border-radius:20px;
    padding:25px;
    box-shadow:0 20px 40px rgba(0,0,0,0.2);
    overflow-x:auto;
}

table {
    width:100%;
    border-collapse:collapse;
}
th, td {
    padding:12px;
    text-align:center;
}

th { background:#667eea; color:white; }

tr:nth-child(even) { background:#f2f2f2; }

button {
    padding:6px 12px;
    border:none;
    border-radius:8px;
    color:white;
    cursor:pointer;
}

.approve { background:#28a745; }
.reject { background:#dc3545; }

.no-data {
    text-align:center;
    padding:20px;
    font-weight:bold;
    color:#666;
}
</style>
</head>

<body>
<div class="table-container">
<table>
<tr>
<th>Name</th>
<th>From</th>
<th>To</th>
<th>Reason</th>
<th>Status</th>
<th>Action</th>
</tr>

<%

List<Leave> list = (List<Leave>) request.getAttribute("leaveList");

if (list != null && !list.isEmpty()) {
    for (Leave l : list) {
%>
<tr>
<td><%= l.getName() %></td>
<td><%= l.getFromDate() %></td>
<td><%= l.getToDate() %></td>
<td><%= l.getReason() %></td>
<td><%= l.getStatus() %></td>
<td>
<form action="UpdateLeaveStatusServlet" method="post">
<input type="hidden" name="id" value="<%= l.getId() %>">
<button class="approve" name="status" value="Approved">Approve</button>
<button class="reject" name="status" value="Rejected">Reject</button>
</form>
</td>
</tr>
<%
    }
} else {
%>
<tr>
<td colspan="6" class="no-data">No leave requests found</td>
</tr>
<%
}
%>

</table>
</div>
</body>
</html>
