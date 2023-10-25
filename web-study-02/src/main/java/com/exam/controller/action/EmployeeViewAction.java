package com.exam.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.dao.EmployeeDAO;
import com.exam.dto.EmployeeVO;
import com.hwijin.dao.BoardDAO;
import com.hwijin.dto.BoardVO;

public class EmployeeViewAction implements EmAction{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/employee/employeeView.jsp";
		String id = request.getParameter("id");
		
		EmployeeDAO eDao = EmployeeDAO.getInstance();
		EmployeeVO eVo = eDao.findById(id);
		request.setAttribute("emp", eVo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
