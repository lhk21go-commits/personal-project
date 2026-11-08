<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lotto</title>
</head>
<body>
	
	<%! 
		int[] winNums = {3,12,19,27,33,41};
		int count = 1;
		public boolean isWinning(int num){
		boolean result = false;
			for(int i=0; i<winNums.length; i++){
				if(num == winNums[i]){
					result = true;
				}
			}
			return result;
		}
	%>
	
	<h1>번호판</h1>
	<table border="1">
		<% for(int i=0; i<5; i++){	
			out.print("<tr>");
			for(int j=0; j<9; j++){ %>
				<td style="background-color: <%=(isWinning(count)) ? "gold" : "" %>;"><%=count %></td>
				<% count++; 
			}
			out.print("</tr>");
		}
		count = 1;%>
	</table>	
	<br>
	당첨 번호: <% for(int i=0; i<winNums.length; i++){ %>
				<%= winNums[i] + " " %>
				<%} %>
	
	
	
	
	
</body>
</html>