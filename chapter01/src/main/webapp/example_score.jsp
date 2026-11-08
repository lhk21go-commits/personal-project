<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>성적표</h2>
	
	<%! 
		String[] names = {"김철수","이영희","박민수","최지우","정다은"};
		int[] scores = {92,78,55,85,67};
		
		public String getGrade(int score){
			String grade = (score>=90) ? "A" :
							(score>=80) ? "B" :
							(score>=70) ? "C" :
							(score>=60) ? "D" : "F";
			return grade;
		}
	
	%>
	
	<table border="1">
		<tr>
			<th>번호</th><th>이름</th><th>점수</th><th>등급</th><th>그래프</th>
		</tr>
		<%
			for(int i=0; i<names.length; i++){	%>
			<tr style="background-color:<%= (scores[i]<60) ? "#ffcccc" : "#ffffff" %>;">
				<td><%= i+1 %></td>
				<td><%= names[i] %></td>
				<td><%= scores[i] %></td>
				<td><%= getGrade(scores[i]) %></td>
				<td>
					<div style="width:<%= scores[i]*3 %>px; height:15px; background-color:blue;"></div>
				</td>
			</tr>
				
			<% }	%>
	
	
	</table>
	
</body>
</html>