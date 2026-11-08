<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주행내역등록</title>
</head>
<body>

	<div class="container">
		<h3>주행내역등록</h3>
		<form action="driveProc.jsp" method="post">
			<table width="500"border="1">
				<tr>
					<th width="150">주행일자</th>
					<td><input type="text" name="drvDate">예)20230101</td>
				</tr>
				<tr>
					<th width="150">차량번호</th>
					<td><input type="text" name="carNo">예)10가0001</td>
				</tr>
				<tr>
					<th width="150">출발km</th>
					<td><input type="text" name="drvStart">km</td>
				</tr>
				<tr>
					<th width="150">도착km</th>
					<td><input type="text" name="drvEnd">km</td>
				</tr>
				<tr>
					<th width="150">부서코드</th>
					<td>
						<select name="depStat">
							<option value="">부서</option>
							<option value="10">[10]영업부</option>
							<option value="20">[20]총무부</option>
							<option value="30">[30]구매부</option>
							<option value="40">[40]개발부</option>
						</select>
					</td>
				</tr>
				<tr>
					<th width="150">주유금액</th>
					<td><input type="text" name="drvMoney">원</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="주행내역등록">
						<input type="reset" value="다시쓰기">
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>