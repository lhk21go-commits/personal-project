<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.sql.*" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>회원 정보 보기</h2>
	
	<!-- HTTP 요청 입력정보 처리 -->
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String passchk = request.getParameter("passchk");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String[] hobby = request.getParameterValues("hobby");
	String hobbies = "";
	if(hobby != null) {
		for(int i=0; i<hobby.length; i++){
			hobbies += hobby[i] + " ";
		}
	}

	String job = request.getParameter("job");
	String age = request.getParameter("age");
	String info = request.getParameter("info");

	String msg = "";
	
	if(id == null || id.isEmpty()){
		msg = "아이디를 입력하세요!";
	}else if(pass == null || pass.isEmpty()){
		msg = "비밀번호를 입력하세요!";
	}else if(passchk == null || passchk.isEmpty()){
		msg = "비밀번호 확인을 입력하세요!";
	}else if(!pass.equals(passchk)){
		msg = "비밀번호가 틀립니다!";
	}else if(email == null || email.isEmpty()){
		msg = "이메일을 입력하세요!";
	}else if(tel == null || tel.isEmpty()){
		msg = "전화번호를 입력하세요!";
	}else if(hobbies == null || hobbies.isEmpty()){
		msg = "관심분야를 선택하세요!";
	}else if(job == null || job.isEmpty()){
		msg = "직업을 선택하세요!";
	}else if(age == null || age.isEmpty()){
		msg = "연령을 선택하세요!";
	}
	
	if(!msg.isEmpty()){	%>
		<script type="text/javascript">
			alert("<%=msg %>");
			history.go(-1);
		</script>
		
		<!-- DB접속 및 업데이트 -->
<% }else {
	
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "1234";
	
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean isSuccess = false;
		
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(3, email);
			pstmt.setString(4, tel);
			pstmt.setString(5, hobbies);
			pstmt.setString(6, job);
			pstmt.setString(7, age);
			pstmt.setString(8, info);
			
			
			int result = pstmt.executeUpdate();
			
			if(result > 0){
				isSuccess = true;
			}
		}catch(Exception e){
			e.printStackTrace();
			out.println("DB fail");
		}finally{
			if(pstmt != null){ try { pstmt.close();	}catch(Exception e){}
			if(con != null) try { con.close(); }catch(Exception e){	} }
		}
	
	/* DB 저장 정보 표시 */	
		if(isSuccess){	
	%>
			<div class="infoContainer">
				<table width="500" border="1">
					<tr height="50">
						<td width="150" align="center">아이디</td>
						<td width="350"><%=id %></td>
					</tr>
					<tr height="50">
						<td width="150" align="center">email</td>
						<td width="350"><%=email %></td>
					</tr>
					<tr height="50">
						<td width="150" align="center">전화번호</td>
						<td width="350"><%=tel %></td>
					</tr>
					<tr height="50">
						<td width="150" align="center">관심분야</td>
						<td width="350"><%=hobbies %></td>
					</tr>
					<tr height="50">
						<td width="150" align="center">직업</td>
						<td width="350"><%=job %></td>
					</tr>
					<tr height="50">
						<td width="150" align="center">연령</td>
						<td width="350"><%=age %></td>
					</tr>
					<tr height="50">
						<td width="150" align="center">남기는 말</td>
						<td width="350"><%=info %></td>
					</tr>
				</table>
			</div>		
	
	 <%	}else { %>
		 <script type="text/javascript">
		 	alert("DB 저장 실패")
		 	history.go(-1);
		 </script>
	<% } 	 
	 
	 }
 %>

</body>
</html>