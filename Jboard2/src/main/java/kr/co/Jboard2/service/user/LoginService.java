package kr.co.Jboard2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.Jboard2.dao.MemberDao;
import kr.co.Jboard2.service.CommonService;
import kr.co.Jboard2.vo.MemberVo;

public class LoginService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			
			String success = req.getParameter("success");
			req.setAttribute("success", success);
						
			return "/user/login.jsp";
		}else {
			
			String uid = req.getParameter("uid");
			String pass = req.getParameter("pass");
			
			MemberVo vo = MemberDao.getInstance().selectMember(uid, pass);
			
			if(vo != null) {
				//회원이 맞으면 사용자 정보 객체 세션 저장 후 리스트 리다이렉트
				HttpSession sess = req.getSession();
				sess.setAttribute("sessMember", vo);
				
				return "redirect:/list.do";
			}else {
				//회원이 아니면 다시 로그인 페이지 리다이렉트
				return "redirect:/user/login.do?success=100";
			}
		}
	}
}