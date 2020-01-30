<%
String id=request.getParameter("ID");
%>
<%
 session.setAttribute("ID", id);
 %>
<%
	out.print("<body background=login.jpg text=white>");
	out.print("<h1 align=center>Edit Your Response</h1>");
	out.print("<table align=center>");
	out.print("<form action=successedit.jsp method=post>");
	out.print("<tr><td><h2>Select The Level</td><td>");
	out.print("<select name=LEVEL><option>Department</option><option>Institute/College</option>");
	out.print("<option>University</option></select></td></tr>");
	out.print("<tr><td><h2>Select the Problem Category</td><td>");
	out.print("<select name=PROBLEM><option>Admission</option><option>Finance</option>");
	out.print("<option>Examination</option><option>Lecture TimeTable/Learning</option><option>Paper Re-Eavaluation</option><option>Other</option></select></td></tr>");
	out.print("<tr><td><h2>Register Your Complaint Here</td></tr>");
	out.print("<tr><td><textarea rows=10 cols=40 name=COMPLAINT></textarea><td></tr><tr><td><input type=submit value=register></td></tr></table>");
	out.print("</form></body>");
	%>