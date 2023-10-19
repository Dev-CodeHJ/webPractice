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
 * Servlet implementation class EmployeeMypageServlet
 */
@WebServlet("/emMypage.do")
public class EmployeeMypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeMypageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("employee/emMypageForm.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		EmployeeVO eVo = new EmployeeVO();
		eVo.setId(request.getParameter("id"));
		eVo.setPw(request.getParameter("pw"));
		eVo.setName(request.getParameter("name"));
		eVo.setLevel(request.getParameter("level"));
		eVo.setGender(request.getParameter("gender"));
		eVo.setPhone(request.getParameter("phone"));
		
		EmployeeDAO eDao = EmployeeDAO.getInstance();
		int result = eDao.updateEmployee(eVo);
		HttpSession session = request.getSession();
		session.setAttribute("loginEm", eVo);
		if(result == 1) {
			request.setAttribute("msg", "사원 정보가 수정되었습니다.");
			request.setAttribute("result", 1);
		} else {
			request.setAttribute("msg", "사원 정보 수정에 실패하셨습니다.");
			request.setAttribute("result", -1);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("employee/emMypageSuccess.jsp");
		dispatcher.forward(request, response);
	}

}
