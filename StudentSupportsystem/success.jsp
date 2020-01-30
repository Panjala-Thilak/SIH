<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%
String cat=request.getParameter("LEVEL");
String problem=request.getParameter("PROBLEM");
String complaint=request.getParameter("COMPLAINT");
%>
<%
String name=(String)session.getAttribute("NAME");
%>
<%
   try{
	  java.util.Date ud=new java.util.Date();
	  long time=ud.getTime();
	  java.sql.Date sd=new java.sql.Date(time);
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con=  
	  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
  PreparedStatement pst=con.prepareStatement("insert into complaint values(sqe1.nextval,?,?,?,?,?,?,?)");
  pst.setString(1,name); 
  pst.setString(2,cat);
pst.setString(3,problem);
  pst.setString(4,complaint);
  pst.setString(5,"----");
  pst.setString(6,"Not Solved");
  pst.setDate(7,sd);
 int i=pst.executeUpdate();
 if(i==1)
	{
	 out.print("<body background=login.jpg text=white><form action=id.jsp>");
	 out.print("<center><h1>Complaint Registered Successfully</h1>");
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