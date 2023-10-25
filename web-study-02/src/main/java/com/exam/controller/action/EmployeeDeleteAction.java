package com.exam.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.dao.EmployeeDAO;

public class EmployeeDeleteAction implements EmAction{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		EmployeeDAO eDao = EmployeeDAO.getInstance();
		eDao.deleteEmployee(id);
		
		new EmployeeListAction().execute(request, response);
	}
}
