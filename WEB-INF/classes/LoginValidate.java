    import java.io.IOException;  
    import java.io.PrintWriter;  
      
    import javax.servlet.ServletException;  
    import javax.servlet.http.HttpServlet;  
    import javax.servlet.http.HttpServletRequest;  
    import javax.servlet.http.HttpServletResponse;  
    import javax.servlet.http.HttpSession;  
    public class LoginValidate extends HttpServlet {  
        protected void doPost(HttpServletRequest request, HttpServletResponse response)  
                        throws ServletException, IOException {  
            response.setContentType("text/html");  
            PrintWriter out=response.getWriter();  
            //request.getRequestDispatcher("link.html").include(request, response);  
              
            String name=request.getParameter("name");  
            String password=request.getParameter("password");  
              
            if(password.equals("admin123")){   
                HttpSession session=request.getSession();  //creating session
                session.setAttribute("name",name);  //storing username in session
                session.setAttribute("password",password);  //storing password in session
                request.getRequestDispatcher("SubjectSelect.jsp").include(request, response);  
            }  
            else{  
                out.print("<script>alert(\"Wrong Password!!!!!\")</script>");
                request.getRequestDispatcher("login.html").include(request, response);   
            }  
            out.close();  
        }  
    }  