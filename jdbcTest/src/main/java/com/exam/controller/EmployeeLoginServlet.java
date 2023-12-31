package com.exam.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.dao.EmployeeDAO;
import com.exam.dto.EmployeeVO;

/**
 * Servlet implementation class EmployeeLoginServlet
 */
@WebServlet("/emLogin.do")
public class EmployeeLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "employee/emLogin.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "employee/emProcessing.jsp";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String level = request.getParameter("level");
		
		EmployeeDAO eDao = EmployeeDAO.getInstance();
		int result = eDao.loginCheck(id, pw, level);
		if(result == 2) {
			EmployeeVO eVo = eDao.getEmployee(id);
			HttpSession session = request.getSession();
			request.setAttribute("msg", "로그인에 성공하셨습니다.");
			session.setAttribute("loginEm", eVo);
		} else if(result == 1) {
			request.setAttribute("msg", "사원레벨이 일치하지 않습니다.");
		} else if(result == 0) {
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
		} else if(result == -1) {
			request.setAttribute("msg", "아이디가 존재하지 않습니다.");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
