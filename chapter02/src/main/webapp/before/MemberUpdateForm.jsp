<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.sql.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
	String user = "root";
	String password = "1234";
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String email = "";
	String tel = "";
	boolean idChk = false;
	
	try{
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		String sql = "select id, email, tel from member where id=?";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			idChk = true;
			email = rs.getString("email");
			tel = rs.getString("tel");
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null){ try{ rs.close(); } catch(Exception e){}}
		if(pstmt != null){ try{ pstmt.close(); } catch(Exception e){}}
		if(con != null){ try{ con.close(); } catch(Exception e){}}
	}
%>
	<h3> 개인 회원정보 수정</h3>
	<form action="MemberUpdateProc.jsp" method="post">
		<input type="hidden" name="id" value="<%=id %>">
		<table width="400" border="1">
			<tr height="50">
				<th width="50" align="center">아이디</th>
				<td width="250"><%=id %></td>
			</tr>
			<tr height="50">
				<th width="50" align="center">이메일</th>
				<td width="250"><input type="email" name="email" value="<%=email %>"></td>
			</tr>
			<tr height="50">
				<th width="50" align="center">전화</th>
				<td width="250"><input type="tel" name="tel" value="<%=tel %>"></td>
			</tr>
			<tr height="50">
				<th width="50" align="center">패스워드</th>
				<td width="250"><input type="password" name="pw1" placeholder="본인 확인용 비밀번호"></td>
			</tr>
			<tr height="50">
				<td colspan="2" align="center">
					<input type="submit" value="회원 수정하기">&nbsp;&nbsp;
					<input type="button" value="회원 전체보기" onclick="location.href='main.jsp?page=MemberList'">&nbsp;&nbsp;
				</td>
			</tr>
		
		</table>
	
	
	
	
	</form>