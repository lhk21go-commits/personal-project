<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.sql.*" %>
<%@ include file="db_conn.jsp" %>
<link rel="stylesheet" href="main.css">

<%
	request.setCharacterEncoding("utf-8");
	String custno = request.getParameter("custno");
	String custname="",phone="",address="",joindate="",grade="",city=""; 

	try{
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		
		String sql = "select * from member_tbl_02 where custno=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(custno));
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			custname = rs.getString("custname");
			phone = rs.getString("phone");
			address = rs.getString("address");
			joindate = rs.getString("joindate");
			grade = rs.getString("grade");
			city = rs.getString("city");
		}
				
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null){ try{ rs.close(); } catch(Exception e){} }
		if(pstmt != null){ try{ pstmt.close(); } catch(Exception e){} }
		if(con != null){ try{ con.close(); } catch(Exception e){} }
	}

%>

	<%@ include file="header.jsp" %>
	
	<section>
		<h2>홈쇼핑 회원정보 수정</h2>
		<form action="modProc.jsp" method="post" name="jform">
			<table class="form">
				<tr>
					<th>회원번호</th>
					<td>
						<input type="text" name="custno" value="<%=custno %>" readonly>
					</td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td>
						<input type="text" name="custname" value="<%=custname %>" >
					</td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td>
						<input type="text" name="phone" value="<%=phone %>">
					</td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td>
						<input type="text" name="address" value="<%=address %>">
					</td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td>
						<input type="text" name="joindate" value="<%=joindate %>">
					</td>
				</tr>
				<tr>
					<th>고객등급[A:VIP, B:일반, C:직원]</th>
					<td>
						<select name=grade>
							<option value="">선택</option>
							<option value="A" <%="A".equals(grade)?"selected":"" %>>VIP</option>
							<option value="B" <%="B".equals(grade)?"selected":"" %>>일반</option>
							<option value="C" <%="B".equals(grade)?"selected":"" %>>직원</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td>
						<input type="text" name="city" value="<%=city %>">
					</td>
				</tr>
				<tr>
					<td colspan="2"> 
						<input type="button" value="수 정" onclick="checkForm()">
						<input type="button" value="조 회" onclick="location.href='memberForm.jsp'">
					</td>
				</tr>
			</table>	
		</form> 
		<script type="text/javascript">
			function checkForm(){
			let f = document.jform;
			
			if(f.custname.value == ""){
				alert("회원성명을 입력하세요!")
				f.custname.focus();
				return;
			}
			if(f.phone.value == ""){
				alert("회원전화를 입력하세요!")
				f.tel.focus();
				return;
			}
			if(f.address.value == ""){
				alert("회원주소를 입력하세요!")
				f.address.focus();
				return;
			}
			if(f.joindate.value == ""){
				alert("가입일자를 입력하세요!")
				f.joindate.focus();
				return;
			}
			if(f.grade.value == ""){
				alert("고객등급을 선택하세요!")
				f.grade.focus();
				return;
			}
			if(f.city.value == ""){
				alert("도시코드를 입력하세요!")
				f.city.focus();
				return;
			}
			f.submit();
		}
		</script>
	</section>
	
	<%@ include file="footer.jsp" %>	
	