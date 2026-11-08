<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.sql.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
%>
	<div class="containerDel">
		<h3> 개인 회원정보 삭제</h3>
		<form action="MemberDeleteProc.jsp" method="post">
			<input type="hidden" name="id" value="<%=id %>">
			<table width="400" border="1">
				<tr height="50">
					<th width="50" align="center">아이디</th>
					<td width="250"><%=id %></td>
				</tr>
				<tr height="50">
					<th width="50" align="center">패스워드</th>
					<td width="250"><input type="password" name="pw1" placeholder="본인 확인용 비밀번호"></td>
				</tr>
				<tr height="50">
					<td colspan="2" align="center">
						<input type="submit" value="회원 삭제하기">&nbsp;&nbsp;
						<input type="button" value="회원 전체보기" onclick="location.href='main.jsp?page=MemberList'">&nbsp;&nbsp;
					</td>
				</tr>
			
			</table>
		</form>
		
	</div>