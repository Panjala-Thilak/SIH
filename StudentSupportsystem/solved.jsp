<%@page import="java.sql.*" %>
<%
String id=request.getParameter("SID");
%>
<%
String name=(String)session.getAttribute("NAME");
%>
<%
   try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con=  
	  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
  Statement st=con.createStatement();
	int flag=0;
	int i=
	st.executeUpdate("update complaint set member_id='"+name+"' where complaint_id="+id);
	int j=st.executeUpdate("update complaint set status='Solved' where complaint_id="+id);
	if(i==1&&j==1)
	{
	out.print("<body background=login.jpg text=white><center><h1>Status Updated</h1></body>");
	}
	con.commit();
con.close();
st.close();
}

catch(SQLException | ClassNotFoundException e)
	{ out.print("<h2>"+e+"</h2>"); }

out.print("</body>");
%>