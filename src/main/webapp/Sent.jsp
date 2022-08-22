<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="style.css">
	<style>
		body{
	    		 background-color: #0000ff;
	    	}
		.sentcontainer 
		{
		    background-color: #C0C0C0;
		    border-radius: 10px;
		    box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
		    position: relative;
		    overflow: hidden;
		    width: 400px;
		    min-width: 80%;
		    min-height: 475px;
		    height: 50vh;
		}
		table, th, td 
		{
  			border: 1px solid;
			border-collapse: collapse;
			width:100%;
		}
		th
		{
			text-align: center;
		}
	</style>
</head>
<body>
	<%session = request.getSession();%>
	<%
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		response.setHeader("pragma","no-cache");
		response.setHeader("Expires","0");
		if(session.getAttribute("str")== null && session.getAttribute("valid")!="admin")
		{
			RequestDispatcher rd= request.getRequestDispatcher("signin.jsp");
			rd.forward(request, response);
		}
	%>
	<%String str = (String)session.getAttribute("str");%>
	<title>Sent Mail-<%out.println(str);%></title>
	<a href="MailHomePage.jsp"><button>Back</button></a><br>
	<form action="Logout">
			<button>Logout</button><br>
	</form>
	<div class="sentcontainer">
		<table>
			<tr>
				<th>Message</th>
				<th>MailId</th>
			</tr>
			<%
			ArrayList<String>sentmail = (ArrayList<String>)request.getAttribute("sentmail");
			ArrayList<String>sentmes = (ArrayList<String>)request.getAttribute("sentmsg");
			for(int itr = 0 ; itr < sentmail.size() ; itr += 1)
			{
				%>
					<tr>
						<td><%out.println(sentmes.get(itr));%></td>
						<td><%out.println(sentmail.get(itr));%></td>
					</tr>
				<%
			}
		%>
		</table>
	</div>
</body>
</html>