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
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginEm") != null) {
			url = "emHome.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "employee/emLogin.jsp";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String level = request.getParameter("level");
		
		EmployeeDAO eDao = EmployeeDAO.getInstance();
		int result = eDao.loginCheck(id, pw, level);
		if(result == 2) {
			EmployeeVO eVo = eDao.getEmployee(id);
			HttpSession session = request.getSession();
			session.setAttribute("loginEm", eVo);
			url = "emHome.jsp";
		} else if(result == 1) {
			
		} else if(result == 0) {
			
		} else if(result == -1) {
			
		}
	}

}
