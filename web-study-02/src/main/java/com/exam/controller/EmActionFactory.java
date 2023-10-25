package com.exam.controller;

import com.exam.controller.action.EmAction;
import com.exam.controller.action.EmployeeCheckPwAction;
import com.exam.controller.action.EmployeeCheckPwFormAction;
import com.exam.controller.action.EmployeeDeleteAction;
import com.exam.controller.action.EmployeeListAction;
import com.exam.controller.action.EmployeeUpdateAction;
import com.exam.controller.action.EmployeeUpdateFormAction;
import com.exam.controller.action.EmployeeViewAction;
import com.exam.controller.action.EmployeeWriteAction;
import com.exam.controller.action.EmployeeWriteFormAction;

public class EmActionFactory {
	private static EmActionFactory instance = new EmActionFactory();
	private EmActionFactory() { super(); }
	public static EmActionFactory getInstance() {
		return instance;
	}
	
	public EmAction getEmAction(String command) {
		EmAction action = null;
		System.out.println("EmActionFactory :" + command);
		
		if(command.equals("employee_list")) {
			action = new EmployeeListAction();
		} else if(command.equals("employee_write_form")) {
			action = new EmployeeWriteFormAction();
		} else if(command.equals("employee_write")) {
			action = new EmployeeWriteAction();
		} else if(command.equals("employee_view")) {
			action = new EmployeeViewAction();
		} else if(command.equals("employee_check_pw_form")) {
			action = new EmployeeCheckPwFormAction();
		} else if(command.equals("employee_check_pw")) {
			action = new EmployeeCheckPwAction();
		} else if(command.equals("employee_update_form")) {
			action = new EmployeeUpdateFormAction();
		} else if(command.equals("employee_update")) {
			action = new EmployeeUpdateAction();
		} else if(command.equals("employee_delete")) {
			action = new EmployeeDeleteAction();
		}
		return action;
	}
}
