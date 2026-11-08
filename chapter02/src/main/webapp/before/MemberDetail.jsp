<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberDetail</title>
</head>
<body>
	<div class=container>
		<h3>회원 상세 정보</h3>
		<table width="500" border="1">
			<tr height="50" align="center">
				<th width="150">아이디</th>
				<th width="150">Email</th>
				<th width="150">전화번호</th>
				<th width="150">관심분야</th>
				<th width="150">직업</th>
				<th width="150">연령</th>
				<th width="150">남기는 말</th>
			</tr>		
			<tr height="50" align="center">
<%
	request.setCharacterEncoding("utf-8");

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
	String user = "root";
	String password = "1234";
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String id = request.getParameter("id");
	out.print(id);
	
	try{
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		String sql = "select * from member where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
	%>
				<td width="350"><%=id %></td>
				<td width="350"><%=rs.getString("email") %></td>
				<td width="350"><%=rs.getString("tel") %></td>
				<td width="350"><%=rs.getString("hobby") %></td>
				<td width="350"><%=rs.getString("job") %></td>
				<td width="350"><%=rs.getString("age") %></td>
				<td width="350"><%=rs.getString("info") %></td>
			</tr>
		</table>
			
	<%	}else {
		out.println("<p>존재하지 않는 회원입니다.</p>");
	}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null){	try{ rs.close();	} catch(Exception e){}}
		if(pstmt != null){	try{ pstmt.close();	} catch(Exception e){}}
		if(con != null){	try{ con.close();	} catch(Exception e){}}
	}
			
%>		
	
		<p><a href="MemberList.jsp">회원 목록으로</a></p>	
	</div>
	
	
</body>
</html>