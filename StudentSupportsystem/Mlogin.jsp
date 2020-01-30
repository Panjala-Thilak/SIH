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
	ResultSet rs=st.executeQuery("SELECT * from MemberLogin");
	  while(rs.next())
		{
		String us=rs.getString(1);
		String pw=rs.getString(2);
		String cat=rs.getString(3);
		if(us.equals(name) && pw.equals(pword))
		{
			flag=1;
			 PreparedStatement pst=con.prepareStatement("select complaint_id,complaint,registereddate from complaint where categoray=? and status!=?");
			 pst.setString(1,cat);
			pst.setString(2,"Solved");
			ResultSet rs1=pst.executeQuery();
			out.print("<body background=login.jpg text=white><table align=center border=2>");
			out.print("<tr bgcolor=maroon><td>Complaint_id</td><td>Complaint</td><td>Registereddate</td></tr>");
				while(rs1.next())
			{
					out.print("<tr>");
					for(int i=1;i<=3;i++)
						{
							out.print("<td>");
							out.print(rs1.getString(i));
							out.print("</td>");
						}
						out.print("</tr>");
			}
			out.print("</table><br><br><form action=solved.jsp><table align=center><tr><td><h2>Enter Complaint_Id:</td><td><input type=text name=SID></td></tr>");
		out.print("<tr><td></td><td><input type=submit value=Solved></td></tr></table></form>");
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