<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="main.css">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String pageName = request.getParameter("page");
	String contentPage = "main.jsp";
	
	if("MemberJoin".equals(pageName)){
		contentPage = "MemberJoin.jsp";
	}else if("Login".equals(pageName)){
		contentPage = "Login.jsp";
	}else if("MemberList".equals(pageName)){
		contentPage = "MemberList.jsp";
	}else if("MemberDetail".equals(pageName)){
		contentPage = "MemberDetail.jsp";
	}else if("MemberUpdateForm".equals(pageName)){
		contentPage = "MemberUpdateForm.jsp";
	}else if("MemberDeleteForm".equals(pageName)){
		contentPage = "MemberDeleteForm.jsp";
	}else if("Login".equals(pageName)){
		contentPage = "Login.jsp";
	}
	
%>
	<%@ include file="header.jsp" %>
	<section>
	<%
		if(contentPage != "main.jsp"){	%>
			<jsp:include page="<%=contentPage %>"></jsp:include>
	<%	}else {	%>
		<p>여기는 메인화면입니다.</p>
	<% } %>
	
	</section>
	<%@ include file="footer.jsp" %>




%>	
</body>
</html>