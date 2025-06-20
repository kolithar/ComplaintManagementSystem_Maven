<%--<%@ page import="java.util.*, model.Complaint, dao.ComplaintDAO" %>--%>
<%--<%@ page import="model.User" %>--%>
<%--<%--%>
<%--    User user = (User) session.getAttribute("user");--%>
<%--    if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {--%>
<%--        response.sendRedirect("login.jsp");--%>
<%--        return;--%>
<%--    }--%>

<%--    List<Complaint> allComplaints = ComplaintDAO.getAllComplaints();--%>
<%--%>--%>
<%--<html>--%>
<%--<head><title>All Complaints - Admin</title></head>--%>
<%--<body>--%>
<%--<h2>All Complaints</h2>--%>
<%--<table border="1">--%>
<%--    <tr>--%>
<%--        <th>ID</th><th>Title</th><th>Description</th><th>User ID</th><th>Status</th>--%>
<%--    </tr>--%>
<%--    <% for (Complaint c : allComplaints) { %>--%>
<%--    <tr>--%>
<%--        <td><%= c.getId() %></td>--%>
<%--        <td><%= c.getTitle() %></td>--%>
<%--        <td><%= c.getDescription() %></td>--%>
<%--        <td><%= c.getUserId() %></td>--%>
<%--        <td><%= c.getStatus() %></td>--%>
<%--    </tr>--%>


<%--    <td>--%>
<%--        <form action="../DeleteComplaintServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this complaint?');">--%>
<%--            <input type="hidden" name="id" value="<%= c.getId() %>" />--%>
<%--            <input type="submit" value="Delete" class="btn btn-danger btn-sm" />--%>
<%--        </form>--%>
<%--    </td>--%>

<%--    <% } %>--%>

<%--</table>--%>


<%--<p><a href="dashboard.jsp">Back to Dashboard</a></p>--%>
<%--</body>--%>
<%--</html>--%>


<%--<%@ page import="java.util.*, model.Complaint, dao.ComplaintDAO" %>--%>
<%--<%@ page import="model.User" %>--%>
<%--<%--%>
<%--    User user = (User) session.getAttribute("user");--%>
<%--    if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {--%>
<%--        response.sendRedirect("login.jsp");--%>
<%--        return;--%>
<%--    }--%>

<%--    List<Complaint> allComplaints = ComplaintDAO.getAllComplaints();--%>
<%--%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>All Complaints - Admin</title>--%>
<%--    <!-- ✅ Bootstrap CSS -->--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--</head>--%>
<%--<body class="container mt-5">--%>
<%--<h2 class="mb-4">All Complaints</h2>--%>






<%--<table class="table table-bordered table-hover table-striped">--%>
<%--    <thead class="table-dark">--%>
<%--    <tr>--%>
<%--        <th>ID</th>--%>
<%--        <th>Title</th>--%>
<%--        <th>Description</th>--%>
<%--        <th>User ID</th>--%>
<%--        <th>Status</th>--%>
<%--        <th>Action</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <% for (Complaint c : allComplaints) { %>--%>
<%--    <tr>--%>
<%--        <td><%= c.getId() %></td>--%>
<%--        <td><%= c.getTitle() %></td>--%>
<%--        <td><%= c.getDescription() %></td>--%>
<%--        <td><%= c.getUserId() %></td>--%>
<%--        <td><%= c.getStatus() %></td>--%>
<%--        <td>--%>
<%--            <form action="../DeleteComplaintServlet" method="post"--%>
<%--                  onsubmit="return confirm('Are you sure you want to delete this complaint?');">--%>
<%--                <input type="hidden" name="id" value="<%= c.getId() %>" />--%>
<%--                <input type="submit" value="Delete" class="btn btn-danger btn-sm" />--%>
<%--            </form>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--    <% } %>--%>
<%--    </tbody>--%>
<%--</table>--%>

<%--<a href="dashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>--%>
<%--</body>--%>
<%--</html>--%>



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
<!DOCTYPE html>
<html>
<head>
    <title>All Complaints - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
<h2 class="mb-4">All Complaints</h2>

<table class="table table-bordered table-hover table-striped">
    <thead class="table-dark">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Description</th>
        <th>User ID</th>
        <th>Status</th>
        <th>Remarks</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% for (Complaint c : allComplaints) { %>
    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getTitle() %></td>
        <td><%= c.getDescription() %></td>
        <td><%= c.getUserId() %></td>
        <td><%= c.getStatus() %></td>
        <td><%= c.getRemarks() != null ? c.getRemarks() : "" %></td>
        <td>
            <!-- Update Status and Remarks Form -->
            <form action="../UpdateComplaintServlet" method="post" class="mb-2">
                <input type="hidden" name="id" value="<%= c.getId() %>" />
                <div class="mb-1">
                    <select name="status" class="form-select form-select-sm" required>
                        <option value="Pending" <%= "Pending".equalsIgnoreCase(c.getStatus()) ? "selected" : "" %>>Pending</option>
                        <option value="In Progress" <%= "In Progress".equalsIgnoreCase(c.getStatus()) ? "selected" : "" %>>In Progress</option>
                        <option value="Resolved" <%= "Resolved".equalsIgnoreCase(c.getStatus()) ? "selected" : "" %>>Resolved</option>
                    </select>
                </div>
                <div class="mb-1">
                    <textarea name="remarks" class="form-control form-control-sm" rows="2" placeholder="Add remarks..."><%= c.getRemarks() != null ? c.getRemarks() : "" %></textarea>
                </div>
                <button type="submit" class="btn btn-warning btn-sm w-100">Update</button>
            </form>

            <!-- Delete Form -->
            <form action="../DeleteComplaintServlet" method="post"
                  onsubmit="return confirm('Are you sure you want to delete this complaint?');">
                <input type="hidden" name="id" value="<%= c.getId() %>" />
                <input type="submit" value="Delete" class="btn btn-danger btn-sm w-100" />
            </form>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>

<a href="dashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>

</body>
</html>
