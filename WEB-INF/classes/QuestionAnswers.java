import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class QuestionAnswers extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Connection con = null;
/*		String servername = getServletContext().getInitParameter("sname");
		String port = "1521";
		String sid = getServletContext().getInitParameter("sid");
		String url = "jdbc:oracle:thin:@"+servername+":"+port+":"+sid;
		String user = getServletContext().getInitParameter("usr");
		String pwd = getServletContext().getInitParameter("pass");*/
		String driver = "oracle.jdbc.driver.OracleDriver";
		Statement st;
		try {
				Class.forName(driver);
				//con = DriverManager.getConnection(url, user, pwd);
				con = DriverManager.getConnection("jdbc:oracle:thin:@desktop-m2rhks1:1521:xe","SYSTEM","admin123");	//connecting to database
				out.println("Connected");
				String subject=request.getParameter("submitSubject");	//getting the database table name of subject selected
				HttpSession session=request.getSession(false);  
				if(session!=null)
				{
				session.setAttribute("subjectSelected",subject);	//storing the database table name of the subject selected in session for future use 
				String query = "select QUESTION , OPTION1 , OPTION2 , OPTION3 , OPTION4 from "+subject;		//creating query
				st = con.createStatement();
				ResultSet rs = st.executeQuery(query);	//executing query
				int i=0;
				String[] ques=new String[10];
				String[] option1=new String[10];
				String[] option2=new String[10];
				String[] option3=new String[10];
				String[] option4=new String[10];
				while(rs.next()) {				//extracting values
					ques[i]=rs.getString(1);
					option1[i]=rs.getString(2);
					option2[i]=rs.getString(3);
					option3[i]=rs.getString(4);
					option4[i]=rs.getString(5);
					i++;
				}
				String sQues="";
				String sOption1="";
				String sOption2="";
				String sOption3="";
				String sOption4="";
				for(i=0;i<10;i++) {			//storing the extracted values in string
					sQues=sQues+(Integer.toString(i+1))+".)"+ques[i]+ "@";
					sOption1=sOption1+"A.)"+option1[i]+"@";
					sOption2=sOption2+"B.)"+option2[i]+"@";
					sOption3=sOption3+"C.)"+option3[i]+"@";
					sOption4=sOption4+"D.)"+option4[i]+"@";
				}
				//out.println(sQues);
				//out.println(sQues+"<br>"+sOption1);
/*				sQues=sQues.replaceAll("\"","");
				sQues=sQues.replaceAll("'","");
				sOption1=sOption1.replaceAll("\"","");
				sOption1=sOption1.replaceAll("'","");
				sOption2=sOption2.replaceAll("\"","");
				sOption2=sOption2.replaceAll("'","");
				sOption3=sOption3.replaceAll("\"","");
				sOption3=sOption3.replaceAll("'","");
				sOption4=sOption4.replaceAll("\"","");
				sOption4=sOption4.replaceAll("'","");*/
				request.setAttribute("question",sQues);		//loading data in hidden field
				request.setAttribute("loadOption1",sOption1);
				request.setAttribute("loadOption2",sOption2);
				request.setAttribute("loadOption3",sOption3);
				request.setAttribute("loadOption4",sOption4);
				//out.println(sQues+"\n");
				//out.println("Reached\n");
				//request.setAttribute("nList",list);
				RequestDispatcher view = request.getRequestDispatcher("./Questions.jsp");
				view.forward(request, response);	//forwarding to Exam page
			}
			else{
				request.getRequestDispatcher("login.html").include(request,response);
			}
				con.close();
			}
		catch(Exception e){
			out.println(e);
		}
	}
}