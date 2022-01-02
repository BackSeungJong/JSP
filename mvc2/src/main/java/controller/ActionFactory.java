package controller;

import controller.action.Action;
import controller.action.DetailFormAction;
import controller.action.JoinAction;
import controller.action.JoinFormAction;
import controller.action.LoginAction;
import controller.action.LoginFormAction;
import controller.action.LogoutAction;
import controller.action.MypageFormAction;
import controller.cartaction.CartAction;
import controller.cartaction.CartFormAction;
import controller.update.UpdateAddressAction;
import controller.update.UpdateEmailAction;
import controller.update.UpdatePNAction;
import controller.update.UpdatePwAction;

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
		} else if (command.equals("logoutAction")) {
			action = new LogoutAction();
		} else if (command.equals("join")) {
			action = new JoinAction();
		} else if (command.equals("joinForm")) {
			action = new JoinFormAction();
		} else if (command.equals("mypageForm")) {
			action = new MypageFormAction();
		}

		// mypage update service
		else if (command.equals("updatePw")) {
			action = new UpdatePwAction();
		} else if (command.equals("updatePN")) {
			action = new UpdatePNAction();
		} else if (command.equals("updateEmail")) {
			action = new UpdateEmailAction();
		} else if (command.equals("updateAddress")) {
			action = new UpdateAddressAction();
		}

		// 상세보기
		else if (command.equals("detailForm")) {
			action = new DetailFormAction();
		}
		
		// 장바구니
		else if (command.equals("cart")) {
			action = new CartAction();
		} else if (command.equals("cartForm")) {
			action = new CartFormAction();
		} 
		
		return action;
	}
}
