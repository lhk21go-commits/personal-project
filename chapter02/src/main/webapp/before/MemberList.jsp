<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Memberlist</title>
</head>
<body>
	<h3>가입한 회원 목록</h3>
	<table width="700" border="1">
		<tr height="50" align="center">
			<th>번호</th>
			<th>아이디</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>관심분야</th>
			<th>직업</th>
			<th>연령</th>
			<th>남기는 말</th>
			<th>상세보기</th>
		
		</tr>

<%
	request.setCharacterEncoding("utf-8");

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
	String user = "root";
	String password = "1234";
	int count = 0;
	
	try{
		Class.forName(driver);
		
		con = DriverManager.getConnection(url, user, password);
		
		String sql = "select * from member";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			count++;
%>			
		<tr height="50" align="center">
			<td><%=count %></td>
			<td><%=rs.getString("id") %></td>
			<td><%=rs.getString("email") %></td>
			<td><%=rs.getString("tel") %></td>
			<td><%=rs.getString("hobby") %></td>
			<td><%=rs.getString("job") %></td>
			<td><%=rs.getString("age") %></td>
			<td><%=rs.getString("info") %></td>
			<td><a href="MemberDetail.jsp?id=<%=rs.getString("id") %>">상세보기</a></td>
		</tr>
<%	
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) { try{rs.close();} catch(Exception e){}}
		if(pstmt != null) { try{pstmt.close();} catch(Exception e){}}		
		if(con != null) { try{con.close();} catch(Exception e){}}
	}
%>	
	
	
	</table>
	<a href="MemberJoin.jsp">회원가입 화면으로</a>
	
</body>
</html>