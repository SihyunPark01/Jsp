package kr.co.Jboard2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.Jboard2.service.CommonService;

public class LogoutService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		//세션에서 사용자 정보 객체 제거
		HttpSession sess = req.getSession();
		sess.invalidate();
		
		return "redirect:/user/login.do?success=101";
	}
}