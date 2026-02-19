package Demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewServlet
 */
@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 PrintWriter out = response.getWriter();

	        out.println("<h2>All Student Feedback</h2>");
	        out.println("<table border='1'>");
	        out.println("<tr><th>ID</th><th>Name</th><th>Dept</th><th>Course</th><th>Q1</th><th>Q2</th><th>Overall</th></tr>");

	        try {
	            Connection con = DBConnection.getConnection();
	            PreparedStatement ps = con.prepareStatement("SELECT * FROM feedback");
	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {
	                out.println("<tr>");
	                out.println("<td>" + rs.getInt("id") + "</td>");
	                out.println("<td>" + rs.getString("name") + "</td>");
	                out.println("<td>" + rs.getString("dept") + "</td>");
	                out.println("<td>" + rs.getString("course") + "</td>");
	                out.println("<td>" + rs.getInt("q1") + "</td>");
	                out.println("<td>" + rs.getInt("q2") + "</td>");
	                out.println("<td>" + rs.getInt("overall") + "</td>");
	                out.println("</tr>");
	            }

	            out.println("</table>");
	            out.println("<br><a href='index.html'>Back to Form</a>");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
