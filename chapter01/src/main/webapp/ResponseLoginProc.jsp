<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 페이지</title>
</head>
<body>
	<h2>로그인 처리 페이지</h2>
	
<%
	request.setCharacterEncoding("utf-8");

	String dbid = "aaaa";
	String dbpw = "1111";

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(dbid.equals(id) && dbpw.equals(pw)){
		response.sendRedirect("https://www.naver.com");
	}else {
%>
		<script type="text/javascript">
			alert("아이디와 비밀번호가 일치하지 않습니다!")
			history.go(-1);
		</script>		
<% } %>

</body>
</html>