package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import dao.ComplaintDAO;
import model.User;

public class UpdateComplaintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
            res.sendRedirect("pages/login.jsp");
            return;
        }

        int id = Integer.parseInt(req.getParameter("id"));
        String status = req.getParameter("status");
        String remarks = req.getParameter("remarks");

        boolean updated = ComplaintDAO.updateStatusAndRemarks(id, status, remarks);

        if (updated) {
            res.sendRedirect("pages/admin_complaints.jsp?success=update");
        } else {
            res.sendRedirect("pages/admin_complaints.jsp?error=update");
        }
    }
}
