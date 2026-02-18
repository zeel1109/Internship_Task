package FEB_17.FEB_17_WEB.src;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;

public class FeedbackServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
    "INSERT INTO feedback(name,dept,course,q1,q2,overall) VALUES(?,?,?,?,?,?)"
);
            ps.setString(1, req.getParameter("name"));
            ps.setString(2, req.getParameter("dept"));
            ps.setString(3, req.getParameter("course"));
            ps.setInt(4, Integer.parseInt(req.getParameter("q1")));
            ps.setInt(5, Integer.parseInt(req.getParameter("q2")));
            ps.setInt(6, Integer.parseInt(req.getParameter("overall")));

            ps.executeUpdate();
            con.close();

            res.sendRedirect("feedback.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
