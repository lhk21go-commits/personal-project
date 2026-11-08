<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.sql.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw1");
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
	String user = "root";
	String password = "1234";
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String msg = "";
	
	if( pw == null || pw.trim().isEmpty()){
		msg = "비밀번호 입력하세요";
	}else {
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "select id from member where id=? and pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				pstmt.close();
				rs.close();
				
				String sql2 = "delete from member where id=?";
				pstmt = con.prepareStatement(sql2);
				pstmt.setString(1, id);
				int result = pstmt.executeUpdate();
				
				if(result > 0){
					msg = "삭제 성공";
				}else {
					msg = "삭제 실패";
				}
			}else {
				msg = "비밀번호를 확인하세요!";
			}
			
		}catch(Exception e){
			e.printStackTrace();
			msg = "DB 오류 ";
		}finally{
			if(rs != null){ try{ rs.close(); } catch(Exception e){}	}
			if(pstmt != null){ try{ pstmt.close(); } catch(Exception e){}	}
			if(con != null){ try{ con.close(); } catch(Exception e){}	}
		}
	}
%>
	<<script type="text/javascript">
		alert("<%=msg %>");
		location.href="main.jsp?page=MemberList";
	</script>
