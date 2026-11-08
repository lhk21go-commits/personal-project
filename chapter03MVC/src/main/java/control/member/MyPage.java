package control.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.MemberDAO;
import model.member.MemberDTO;


@WebServlet("/MyPage.do")
public class MyPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = new MemberDTO();
		
		HttpSession session = request.getSession(false);
		// 로그인된 아이디 추출
		String loginId = (String)session.getAttribute("id");
		// session != null => 로그인된 상태
		if(session != null) {
			mdto = mdao.getOneMember(loginId);
		}
		//mdto에 담긴 값들은 jsp view단으로 넘길 때는 setAttribute에 담는다.
		request.setAttribute("mdto", mdto);
		// 떠넘기기
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=member/MyPage.jsp");
		rd.forward(request, response);	//select를 제외한 경우 새로고침시 화면 재요청
		
	}

}
