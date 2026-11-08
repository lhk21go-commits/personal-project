<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피주문</title>
</head>
<body>

	<div class="container"> 
		<h1>커피메뉴</h1>
		<form action="CoffeeProc.jsp" method="get">
			<input type="radio" name="menu" value="아메리카노" id="ame">
			<label for="ame">아메리카노 (3000원)</label><br>
			<input type="radio" name="menu" value="카페라떼" id="latte">
			<label for="latte">카페라떼 (3300원)</label><br>
			<input type="radio" name="menu" value="에스프레소" id="ess">
			<label for="ess">에스프레소 (2500원)</label><br>
			<input type="radio" name="menu" value="얼그레이티" id="earl">
			<label for="earl">얼그레이티 (3500원)</label><br>
			
			<label for="quantity">수량 : </label>
			<input type="number" name="quantity" value="quantity" width="100"><br>
			<label for="money">입금액 : </label>
			<input type="number" name="money" value="money" width="100">
			<input type="submit" value="주문처리">
		
		</form>
		
		
	</div>

</body>
</html>