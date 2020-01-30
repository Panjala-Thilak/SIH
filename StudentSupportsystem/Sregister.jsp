<%@page import="java.sql.*" %>
<%
String name=request.getParameter("ROLLNO");
String pword=request.getParameter("Password");
%>
<%
   try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con=  
	  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
   PreparedStatement pst=con.prepareStatement("insert into StudentLogin values(?,?)");
			 pst.setString(1,name);
			pst.setString(2,pword);
int flag=
	pst.executeUpdate();
if(flag==1)
	out.print("<body bgcolor=green text=white><center><h1>Registered Succesfully");
con.commit();
con.close();
pst.close();
}

catch(SQLException | ClassNotFoundException e)
	{ out.print("<h2>"+e+"</h2>"); }

out.print("</body>");
%>