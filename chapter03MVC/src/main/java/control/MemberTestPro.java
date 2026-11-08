package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberTestDTO;

@WebServlet("/Mproc.do")
public class MemberTestPro extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MemberTestDTO mdto = new MemberTestDTO();
		
		mdto.setId(request.getParameter("id"));
		mdto.setPass(request.getParameter("pass"));
		mdto.setEmail(request.getParameter("email"));
		mdto.setTel(request.getParameter("tel"));
		mdto.setAddress(request.getParameter("address"));
		
		request.setAttribute("mt", mdto);
		
		RequestDispatcher rd = request.getRequestDispatcher("MemberTestView.jsp");
		rd.forward(request, response);
	}

}
