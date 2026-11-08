<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.sql.*" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피주문 처리</title>
</head>
<body>
<%
	DecimalFormat de = new DecimalFormat("#,##0");
	

	request.setCharacterEncoding("utf-8");

	String menu = request.getParameter("menu");
	String quantity = request.getParameter("quantity");
	String money = request.getParameter("money");
	
	int intQuantity = Integer.parseInt(quantity);
	int intMoney = Integer.parseInt(money);

	int price = 0;
	
	
	if(menu.trim() == null){	%>
		<script type="text/javascript">
			alert("없는 메뉴입니다. 다시 선택하세요");
			history.go(-1);
		</script>
<%	}else if(menu.trim().equals("카페라떼")){
		price = 3300;
	}else if(menu.trim().equals("에스프레소")){
		price = 2500;
	}else if(menu.trim().equals("얼그레이티")){
		price = 3500;
	}else if(menu.trim().equals("아메리카노")){
		price = 3000;
	}
	
	int total = price*intQuantity;
%>

	<h1>주문계산 결과</h1>
		<ul>
			<li>커피종류 : <%=menu %></li>
			<li>1개 가격 : <%=de.format(price)%></li>
			<li>수량 : <%=intQuantity%></li>
			<li>총 금액 : <%=de.format(total)%></li>
			<li>입금액 : <%=de.format(intMoney)%></li>
			<li>거스름돈 : <%=de.format(intMoney-total)%></li>
		
		</ul>

</body>
</html>