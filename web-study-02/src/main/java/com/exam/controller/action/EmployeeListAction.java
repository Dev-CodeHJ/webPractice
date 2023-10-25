package com.exam.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.dao.EmployeeDAO;
import com.exam.dto.EmployeeVO;
import com.hwijin.dto.BoardVO;

public class EmployeeListAction implements EmAction{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/employee/employeeList.jsp";
		
		EmployeeDAO eDao = EmployeeDAO.getInstance();
		List<EmployeeVO> empList = eDao.findAll();
		request.setAttribute("empList", empList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
