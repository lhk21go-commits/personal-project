<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.sql.*" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 보기</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String passchk = request.getParameter("passchk");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String[] hobby = request.getParameterValues("hobby");
	String job = request.getParameter("job");
	String age = request.getParameter("age");
	String info = request.getParameter("info");
	
	if(!pass.equals(passchk)){
%>
	<script type="text/javascript">
		alert("비밀번호가 틀립니다.");
		history.go(-1);
	</script>		
<%	} %>

	<div class="infoContainer">
		<table width="400" border="1">
				<tr height="50">
					<td width="150" align="center">아이디</td>
					<td width="350"><%=id %> </td>
				</tr>
				<tr height="50">
					<td width="150" align="center">Email</td>
					<td width="350"><%=email %></td>
				</tr>
				<tr height="50">
					<td width="150" align="center">전화번호</td>
					<td width="350"><%=tel %></td>
				</tr>
				<tr height="50">
					<td width="150" align="center">관심분야</td>
					<td width="350">
					<%	for(int i =0; i<hobby.length; i++){	%>
							<%=hobby[i] + " "  %>
					<% } %>	
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">직업</td>
					<td width="350" align="center"><%=job %></td>
				</tr>
				<tr height="50">
					<td width="150" align="center">연령</td>
					<td width="350" align="center"><%=age %></td>
				</tr>	
				<tr height="50">
					<td width="150" align="center">남기는 말</td>
					<td width="350" align="center"><%=info %>
					</td>
				</tr>
		</table>
	
	</div>

</body>
</html>