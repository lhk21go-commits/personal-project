<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량주행관리 프로그램</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>

<%
	String pageName = request.getParameter("page");
	String contentPage = "home.jsp";
	
	if("carList".equals(pageName)){
		contentPage = "carList.jsp";
	}

%>

	<div id="wrap">
		<%@ include file="header.jsp" %>
		<%@ include file="nav.jsp" %>
		
		<section>
			<jsp:include page="<%=contentPage %>" />
		
		</section>
		
		<%@ include file="footer.jsp" %>
	
	
	</div>	
</body>
</html>