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
	ResultSet rs=st.executeQuery("SELECT * from headLogin");
	  while(rs.next())
		{
		String us=rs.getString(1);
		String pw=rs.getString(2);
		if(us.equals(name) && pw.equals(pword))
		{
			flag=1;
			 PreparedStatement pst=con.prepareStatement("select * from complaint");
			ResultSet rs1=pst.executeQuery();
			
		ResultSetMetaData rsmd=rs1.getMetaData();

			int nc=rsmd.getColumnCount();
			out.print("<body background=login.jpg text=white><table align=center border=2>");
			out.print("<tr bgcolor=maroon>");
			for(int i=1;i<=nc;i++)
			{
					out.print("<td>");
					out.print(rsmd.getColumnName(i));
					out.print("</td>");
			}
			out.print("</tr>");
				while(rs1.next())
			{
					out.print("<tr>");
					for(int i=1;i<=nc;i++)
						{
							out.print("<td>");
							out.print(rs1.getString(i));
							out.print("</td>");
						}
						out.print("</tr>");
			}
			out.print("</table>");
		}
		out.print("<table align=center><form action=report.jsp>");
		out.print("<tr><td><h2>Enter Student Id</h2></td>");
			out.print("<td><input type=text name=ID></td></tr>");
		out.print("<tr><td></td><td><input type=submit value=GetReport></td></tr></form></table>");

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