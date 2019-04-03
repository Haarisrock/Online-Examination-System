import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class Retry extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session=request.getSession(false);
        if(session!=null)
        {
            request.getRequestDispatcher("SubjectSelect.jsp").include(request, response);
        }
        else {
            request.getRequestDispatcher("login.html").include(request,response);
        }
    }
}