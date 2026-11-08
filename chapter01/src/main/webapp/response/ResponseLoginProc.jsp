<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인처리</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");

	String dbid = "aaaa";
	String dbpw = "1111";
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(dbid.equals(id) && dbpw.equals(pw)){
		response.sendRedirect("ResponseMain.jsp?id="+id);
	}else {
%>
		<script type="text/javascript">
			alert("아이디와 비번을 확인하세요");
			history.go(-1);
		</script>
		
<%	} %>

</body>
</html>