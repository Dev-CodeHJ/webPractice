package com.exam.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.dao.EmployeeDAO;
import com.exam.dto.EmployeeVO;

public class EmployeeWriteAction implements EmAction{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmployeeVO eVo = new EmployeeVO();
		eVo.setId(request.getParameter("id"));
		eVo.setPw(request.getParameter("pw"));
		eVo.setName(request.getParameter("name"));
		eVo.setLevel(request.getParameter("level"));
		eVo.setGender(request.getParameter("gender"));
		eVo.setPhone(request.getParameter("phone"));

		EmployeeDAO eDao = EmployeeDAO.getInstance();
		eDao.insertEmployee(eVo);
		
		new EmployeeListAction().execute(request, response);
	}
}
