<%@page import="java.sql.*" %>
<%
String id=request.getParameter("ID");
%>
<%
   try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con=  
	  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
  Statement st=con.createStatement();
ResultSet rs=
	st.executeQuery("SELECT complaint_id,complaint,Registereddate,status from complaint where complaint_id="+id);
	out.print("<body background=login.jpg text=white>");
	out.print("<table align=center border=1>");
	out.print("<tr bgcolor=maroon><td>Complaint_id</td><td>Complaint</td><td>Registereddate</td><td>Status</td></tr>");
   while(rs.next())
{
	out.print("<tr>");
	for(int i=1;i<=4;i++)
		{
	out.print("<td>");
	out.print(rs.getString(i));
	out.print("</td>");
		}
		out.print("</tr>");
}
out.print("</table>");
con.close();
st.close();
}

catch(SQLException | ClassNotFoundException e)
	{ 
		out.print("<body background=login.jpg text=white>");
		out.print("<h2><center>Enter a Valid Complaint ID</center></h2>"); }

out.print("</body>");
%>