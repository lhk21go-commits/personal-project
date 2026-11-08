<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주행내역등록 처리</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String drvDate = request.getParameter("drvDate");
	String carNo = request.getParameter("carNo");
	String drvStart = request.getParameter("drvStart");
	String drvEnd = request.getParameter("drvEnd");
	String depStat = request.getParameter("depStat");
	String drvMoney = request.getParameter("drvMoney");
	
	String msg = "";
	
	if(drvDate == null || drvDate.isEmpty()){
		msg = "주행일자가 입력되지 않았습니다!";
	}else if(carNo == null || carNo.isEmpty()){
		msg = "차량번호가 입력되지 않았습니다.!";
	}else if(drvStart == null || drvStart.isEmpty()){
		msg = "출발km가 입력되지 않았습니다!";
	}else if(drvEnd == null || drvEnd.isEmpty()){
		msg = "도착km가 입력되지 않았습니다!";
	}else if(depStat == null || depStat.isEmpty()){
		msg = "부서코드가 입력되지 않았습니다!";
	}else if(drvMoney == null || drvMoney.isEmpty()){
		msg = "주유금액이 입력되지 않았습니다!";
	}

	if(!msg.isEmpty()){
%>
		<script type="text/javascript">
			alert("<%=msg%>");
			history.go(-1);
		</script>
<%		
	}else {
%>		
		<table width="500"border="1">
			<tr>
				<th width="150">주행일자</th>
				<td><%=drvDate %></td>
			</tr>
			<tr>
				<th width="150">차량번호</th>
				<td><%=carNo %></td>
			</tr>
			<tr>
				<th width="150">출발km</th>
				<td><%=drvStart %> km</td>
			</tr>
			<tr>
				<th width="150">도착km</th>
				<td><%=drvEnd %> km</td>
			</tr>
			<tr>
				<th width="150">부서코드</th>
				<td><%=depStat %></td>
			</tr>
			<tr>
				<th width="150">주유금액</th>
				<td><%=drvMoney%> 원</td>
			</tr>
		</table>
		
	<%} %>
	
	
	
</body>
</html>