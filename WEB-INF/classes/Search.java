import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Connection con = null;
		String servername = getServletContext().getInitParameter("sname");
/*		String port = "1521";
		String sid = getServletContext().getInitParameter("sid");
		String url = "jdbc:oracle:thin:@"+servername+":"+port+":"+sid;
		String user = getServletContext().getInitParameter("usr");
		String pwd = getServletContext().getInitParameter("pass");*/
		String driver = "oracle.jdbc.driver.OracleDriver";
		HttpSession session=request.getSession(false);
		if(session!=null)
		{
		String subject=(String)session.getAttribute("subjectSelected");
	Statement st;
		try {
			Class.forName(driver);
			//con = DriverManager.getConnection(url, user, pwd);
			con = DriverManager.getConnection("jdbc:oracle:thin:@desktop-m2rhks1:1521:xe","SYSTEM","admin123");//connecting to database

			out.println("Connected");
				String query = "select answer from "+subject;  //creating query
				st = con.createStatement();
				ResultSet rs = st.executeQuery(query);	//executing query
				int i=0;
				String[] res=new String[10];
				while(rs.next()) {		//storing answer in an array
					res[i++]=rs.getString(1);
				}
				String actions= request.getParameter("array");
				char c=' ';
				String s1="";
				int k=0;
				String[] result = new String[10];
				for(i=0;i<actions.length();i++) {	//storing client's answer in an array
					c=actions.charAt(i);
					if(c!=' ') {
						s1=s1+c;
					}
					else if(c==' ') {
						result[k++]=s1;		//client side answer..
						s1="";
					}
				}
				int score=0;
				for(i=0;i<10;i++) {
					if(res[i].equals(result[i])) {		//Comparing answer for getting the score
						score++;
					}
				}
				String strScore=Integer.toString(score);
				request.setAttribute("scores",strScore);	//storing the score in a hidden field
				//request.setAttribute("nList",list);
				RequestDispatcher view = request.getRequestDispatcher("./Result.jsp");	
				view.forward(request, response);	//forwarding to result page
				con.close();
			}
		catch(Exception e){
			out.println(e);
		}
	}
	else{
		request.getRequestDispatcher("login.html").include(request,response);
	}
	}
}