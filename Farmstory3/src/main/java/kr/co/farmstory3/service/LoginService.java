package kr.co.farmstory3.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory3.dao.MemberDao;
import kr.co.farmstory3.vo.MemberVo;

public class LoginService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {

		if(req.getMethod().equals("GET")) {
			
			String success = req.getParameter("success");
			req.setAttribute("success", success);
			
			return "/member/login.jsp";
		} else {
			
			String uid = req.getParameter("uid");
			String pass = req.getParameter("pass");
			
			MemberVo vo = MemberDao.getInstance().selectMember(uid, pass);
			
			if(vo != null) {
				//회원이 맞으면 사용자 정보 객체 세션 저장 후 리스트로 리다이렉트
				HttpSession sess = req.getSession();
				sess.setAttribute("sessMember", vo);
				
				return "redirect:/index.do";
			}else {
				//회원이 아니면 다시 로그인페이지
				return "redirect:/member/login.do?success=100";
			}
		}
	}
}
