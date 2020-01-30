<%@page import="java.sql.*" %>
<%
String name=(String)session.getAttribute("NAME");
%>
<%
   try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con=  
	  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
  PreparedStatement pst=con.prepareStatement("select complaint_id,registereddate from complaint where student_id=?");
  pst.setString(1,name); 
 ResultSet rs=pst.executeQuery();
 out.print("<body background=login.jpg text=white><table align=center border=2>");
	 out.print("<tr><td><b>Complaint_id</td><td><b>Registered Date</td></tr>");
 while(rs.next())
	{
	 	out.print("<tr>");
	 for(int i=1;i<=2;i++)
		{
		 out.print("<td>");
	out.print(rs.getString(i));
	out.print("</td>");
		}
		out.print("</tr></body>");
	}
con.close();
pst.close();
}

catch(SQLException | ClassNotFoundException e)
	{ out.print("<h2>"+e+"</h2>"); }

out.print("</body>");
%>