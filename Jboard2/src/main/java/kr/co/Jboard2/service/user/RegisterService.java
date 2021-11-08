package kr.co.Jboard2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.Jboard2.dao.MemberDao;
import kr.co.Jboard2.service.CommonService;
import kr.co.Jboard2.vo.MemberVo;

public class RegisterService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			return "/user/register.jsp";//GET전송방식이므로 POST전송방식 심기위해 분기처리해줘야함
		}else {
			String uid = req.getParameter("uid");
			String pass2 = req.getParameter("pass2");
			String name = req.getParameter("name");
			String nick = req.getParameter("nick");
			String email = req.getParameter("email");
			String hp = req.getParameter("hp");
			String zip = req.getParameter("zip");
			String addr1 = req.getParameter("addr1");
			String addr2 = req.getParameter("addr2");
			String regip = req.getRemoteAddr();
			
			
			MemberVo vo = new MemberVo();
			vo.setUid(uid);
			vo.setPass(pass2);
			vo.setName(name);
			vo.setNick(nick);
			vo.setEmail(email);
			vo.setHp(hp);
			vo.setZip(zip);
			vo.setAddr1(addr1);
			vo.setAddr2(addr2);
			vo.setRegip(regip);
			
			
			//Dao불러오기
			MemberDao.getInstance().insertMember(vo);
					
			return "redirect:/user/login.do";
		}
			
	}

}
