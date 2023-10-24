package com.hwijin.controller;

import com.hwijin.controller.action.Action;
import com.hwijin.controller.action.BoardCheckPwAction;
import com.hwijin.controller.action.BoardCheckPwFormAction;
import com.hwijin.controller.action.BoardListAction;
import com.hwijin.controller.action.BoardViewAction;
import com.hwijin.controller.action.BoardWriteAction;
import com.hwijin.controller.action.BoardWriteFormAction;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();
	private ActionFactory() {
		super();
	}
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		System.out.println("ActionFactory :" + command);
		if(command.equals("board_list")) {
			action = new BoardListAction();
		} else if(command.equals("board_write_form")) {
			action = new BoardWriteFormAction();
		} else if(command.equals("board_write")) {
			action = new BoardWriteAction();
		} else if(command.equals("board_view")) {
			action = new BoardViewAction();
		} else if(command.equals("board_check_pw_form")) {
			action = new BoardCheckPwFormAction();
		} else if(command.equals("board_check_pw")) {
			action = new BoardCheckPwAction();
		}
		return action;
	}
}
