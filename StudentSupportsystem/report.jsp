<%@page import="java.sql.*" %>
<%
String id=request.getParameter("ID");
%>
<%
   try{
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  Connection con=  
		  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
			 PreparedStatement pst=con.prepareStatement("select rollno,name,department,college,phonenumber from studentlogin where rollno=?");
			 pst.setString(1,id);
			ResultSet rs1=pst.executeQuery();
		ResultSetMetaData rsmd=rs1.getMetaData();
			int nc=rsmd.getColumnCount();
			out.print("<body background=login.jpg text=white><table align=center border=2>");
				while(rs1.next())
			{
				
					for(int i=1;i<=nc;i++)
						{
							out.print("<tr>");
							out.print("<td bgcolor=maroon>");
							out.print(rsmd.getColumnName(i));
							out.print("</td>");
							out.print("<td>");
							out.print(rs1.getString(i));
							out.print("</td>");
							out.print("</tr>");
						}
			}
			PreparedStatement pst1=con.prepareStatement("select P_type,complaint_id,complaint,member_id,status from complaint where student_id=?");
			 pst1.setString(1,id);
			ResultSet rs2=pst1.executeQuery();
		ResultSetMetaData rsmd1=rs2.getMetaData();
			int nc1=rsmd1.getColumnCount();
			out.print("<body background=login.jpg text=white><table align=center border=2>");
			int k=1;
				while(rs2.next())
			{
						out.print("<tr colspan=2><td> Complaint"+k);
						k++;
						out.print("</td></tr>");
					for(int i=1;i<=nc1;i++)
						{
							out.print("<tr>");
							out.print("<td bgcolor=maroon>");
							out.print(rsmd1.getColumnName(i));
							out.print("</td>");
							out.print("<td>");
							out.print(rs2.getString(i));
							out.print("</td>");
							out.print("</tr>");
						}
			}

			out.print("</table>");
	
	con.close();
	pst.close();
	pst1.close();
}

catch(SQLException | ClassNotFoundException e)
	{ out.print("<h2>"+e+"</h2>"); }

out.print("</body>");
%>