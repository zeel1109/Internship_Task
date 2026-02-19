<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Student Dashboard</title>

<style>
body {
    margin:0;
    font-family:'Poppins',sans-serif;
    background:linear-gradient(120deg,#89f7fe,#66a6ff);
    min-height:100vh;
    display:flex;
    align-items:center;
    justify-content:center;
}

.glass {
    backdrop-filter:blur(20px);
    background:rgba(255,255,255,0.2);
    padding:30px;
    border-radius:20px;
    width:95%;
    max-width:700px; /* little wider for table */
    box-shadow:0 20px 40px rgba(0,0,0,0.2);
}

h2 {
    text-align:center;
    color:#333;
}

input, textarea {
    width:100%;
    margin-top:10px;
    padding:12px;
    border-radius:12px;
    border:none;
}

button {
    width:100%;
    margin-top:15px;
    padding:12px;
    border:none;
    border-radius:12px;
    background:#4facfe;
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

button:hover { background:#00c6ff; }

/* ===== Leave table styles (matching UI) ===== */

.table-title {
    margin-top:30px;
}

table {
    width:100%;
    margin-top:10px;
    border-collapse:collapse;
    background:rgba(255,255,255,0.4);
    border-radius:12px;
    overflow:hidden;
}

th, td {
    padding:10px;
    text-align:center;
}

th {
    background:#4facfe;
    color:white;
}

tr:nth-child(even) {
    background:rgba(255,255,255,0.3);
}

.status-pending { color:orange; font-weight:bold; }
.status-approved { color:green; font-weight:bold; }
.status-rejected { color:red; font-weight:bold; }

.no-data {
    text-align:center;
    padding:15px;
    font-weight:bold;
    color:#333;
}
</style>
</head>

<body>
<div class="glass">

    <!-- ===== Apply Leave Form ===== -->
    <h2>Apply Leave</h2>
    <form action="ApplyLeaveServlet" method="post">
        <input type="date" name="from_date" required>
        <input type="date" name="to_date" required>
        <textarea name="reason" placeholder="Enter reason" required></textarea>
        <button type="submit">Submit Leave</button>
    </form>


    <!-- ===== My Leave Status Section ===== -->
    <h2 class="table-title">My Leave Status</h2>

    <table>
        <tr>
            <th>From</th>
            <th>To</th>
            <th>Reason</th>
            <th>Status</th>
        </tr>

        <%
        ResultSet rs = (ResultSet) request.getAttribute("leaveList");

        if (rs != null && rs.next()) {
            do {
                String status = rs.getString("status");
        %>
        <tr>
            <td><%= rs.getString("from_date") %></td>
            <td><%= rs.getString("to_date") %></td>
            <td><%= rs.getString("reason") %></td>
            <td class="
                <%= status.equals("Approved") ? "status-approved" :
                    status.equals("Rejected") ? "status-rejected" :
                    "status-pending" %>">
                <%= status %>
            </td>
        </tr>
        <%
            } while (rs.next());
        } else {
        %>
        <tr>
            <td colspan="4" class="no-data">No leave applied yet</td>
        </tr>
        <%
        }
        %>

    </table>

</div>
</body>
</html>
