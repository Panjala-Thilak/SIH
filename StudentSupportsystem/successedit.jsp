<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%
String cat=request.getParameter("LEVEL");
String problem=request.getParameter("PROBLEM");
String complaint=request.getParameter("COMPLAINT");
%>
<%
String id=(String)session.getAttribute("ID");
%>
<%
   try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con=  
	  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
  PreparedStatement pst=con.prepareStatement("update complaint set categoray=?,p_type=?,complaint=? where complaint_id=?");
  pst.setString(1,cat);
  pst.setString(2,problem);
	pst.setString(3,complaint);
	pst.setString(4,id);
 int i=pst.executeUpdate();
 if(i>0)
	{
	 out.print("<body background=login.jpg text=white><form action=id.jsp>");
	 out.print("<center><h1>Complaint Edited Successfully</h1>");
	out.print("<input type=submit value=ComplaintId></form></center></body>");
	}

con.commit();
con.close();
pst.close();
}

catch(SQLException | ClassNotFoundException e)
	{ out.print("<h2>"+e+"</h2>"); }

out.print("</body>");
%>