<%@page import="java.sql.*" %>
<%
String name=request.getParameter("NAME");
String pword=request.getParameter("PASSWORD");
%>
<%
 session.setAttribute("NAME", name);
 %>
<%
   try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con=  
	  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
  Statement st=con.createStatement();
int flag=0;
ResultSet rs=
	st.executeQuery("SELECT rollno,password from StudentLogin");
   while(rs.next())
{
String us=rs.getString(1);
String pw=rs.getString(2);
if(us.equals(name) && pw.equals(pword))
{
	flag=1;
	out.print("<body background=login.jpg text=white><br><br><br><br><br><br><br>");
	out.print("<table align=center width=300 height=200>");
	out.print("<form action=Rcomplaint.jsp method=post>");
	out.print("<tr rowspan=3><td><input type=submit value=RegisterComplaint></td></tr></form>");
	out.print("<form action=edit.jsp method=post>");
	out.print("<tr rowspan=3><td><input type=submit value=EditComplaint></td></tr>");
	out.print("</table></form></body>");
}
}
if(flag==0)
	out.print("<body background=login.jpg text=white><center><h1>Invalid User");
con.close();
st.close();
}

catch(SQLException | ClassNotFoundException e)
	{ out.print("<h2>"+e+"</h2>"); }

out.print("</body>");
%>