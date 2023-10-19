package com.exam.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
 * Servlet implementation class EmployeeRegisterServlet
 */
@WebServlet("/emRegister.do")
public class EmployeeRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("employee/emRegisterForm.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		EmployeeDAO eDao = EmployeeDAO.getInstance();
		
		EmployeeVO eVo = new EmployeeVO();
		eVo.setId(request.getParameter("id"));
		eVo.setPw(request.getParameter("pw"));
		eVo.setName(request.getParameter("name"));
		eVo.setLevel(request.getParameter("level"));
		eVo.setGender(request.getParameter("gender"));
		eVo.setPhone(request.getParameter("phone"));
		
		int result = eDao.registerEmployee(eVo);
		if(result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("registerEm", eVo);
			request.setAttribute("msg", "사원 등록에 성공했습니다.");
			request.setAttribute("result", 1);
		} else if(result == 0){
			request.setAttribute("msg", "이미 존재하는 사원id입니다.");
			request.setAttribute("result", 0);
		} else if(result == -1) {
			request.setAttribute("msg", "사원 등록에 실패하셨습니다.");
			request.setAttribute("result", -1);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("employee/emRegisterSuccess.jsp");
		dispatcher.forward(request, response);
	}

}
