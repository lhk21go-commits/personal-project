<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.*" import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestForward</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	
	<h2>당신의 아이디는 <%=id %>이고, 패스워드는 <%=pw %> 이다.	</h2>
	
</body>
</html>