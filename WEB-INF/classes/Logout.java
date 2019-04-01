    import java.io.IOException;  
    import java.io.PrintWriter;  
      
    import javax.servlet.ServletException;  
    import javax.servlet.http.HttpServlet;  
    import javax.servlet.http.HttpServletRequest;  
    import javax.servlet.http.HttpServletResponse;  
    import javax.servlet.http.HttpSession;  
    public class Logout extends HttpServlet {  
            protected void doGet(HttpServletRequest request, HttpServletResponse response)  
                                    throws ServletException, IOException {  
                response.setContentType("text/html");  
                PrintWriter out=response.getWriter(); 
                out.print("<script>alert(\"You are successfully logged out!\")</script>"); 
                request.getRequestDispatcher("./login.html").include(request, response); //forwarding back to login page 
                HttpSession session=request.getSession();
                session.invalidate();  //removing the session
                out.close();  
        }  
    }  