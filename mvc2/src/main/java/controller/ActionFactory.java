package controller;

import controller.action.Action;
import controller.action.JoinAction;
import controller.action.JoinFormAction;
import controller.action.LoginAction;
import controller.action.LoginFormAction;

// Factory Methd(생성 디자인 패턴)

// 인스턴스화 하는 팩토리
public class ActionFactory {

	// single tone
	private ActionFactory() {
	}

	private static ActionFactory instance = new ActionFactory();

	public static ActionFactory getInstance() {
		return instance;
	}

	// command pattern (행위)
	public Action getAction(String command) {
		Action action = null;

		if (command.equals("login")) {
			action = new LoginAction();
		} else if (command.equals("loginForm")) {
			action = new LoginFormAction();
		} else if (command.equals("join")) {
			action = new JoinAction();
		} else if (command.equals("joinForm")) {
			action = new JoinFormAction();
		}

		return action;
	}
}
