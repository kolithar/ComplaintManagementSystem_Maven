<%@ page import="java.util.*, model.Complaint, dao.ComplaintDAO" %>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Complaint> allComplaints = ComplaintDAO.getAllComplaints();
%>
<html>
<head><title>All Complaints - Admin</title></head>
<body>
<h2>All Complaints</h2>
<table border="1">
    <tr>
        <th>ID</th><th>Title</th><th>Description</th><th>User ID</th><th>Status</th>
    </tr>
    <% for (Complaint c : allComplaints) { %>
    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getTitle() %></td>
        <td><%= c.getDescription() %></td>
        <td><%= c.getUserId() %></td>
        <td><%= c.getStatus() %></td>
    </tr>
    <% } %>
</table>
<p><a href="dashboard.jsp">Back to Dashboard</a></p>
</body>
</html>
