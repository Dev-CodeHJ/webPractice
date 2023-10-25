package com.exam.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.dao.EmployeeDAO;
import com.exam.dto.EmployeeVO;
import com.hwijin.controller.action.BoardListAction;
import com.hwijin.dao.BoardDAO;
import com.hwijin.dto.BoardVO;

public class EmployeeUpdateAction implements EmAction{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmployeeVO eVo = new EmployeeVO();

		
		eVo.setId((request.getParameter("id")));
		eVo.setPw(request.getParameter("pw"));
		eVo.setName(request.getParameter("name"));
		eVo.setLevel(request.getParameter("level"));
		eVo.setGender(request.getParameter("gender"));
		eVo.setPhone(request.getParameter("phone"));
		
		EmployeeDAO eDao = EmployeeDAO.getInstance();
		eDao.updateEmployee(eVo);
		
		new EmployeeListAction().execute(request, response);
	}
}
