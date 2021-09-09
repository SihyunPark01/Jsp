package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVo;

public class ModifyService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			String uid = req.getParameter("uid");
			MemberVo vo = MemberDao.getInstance().selectMember(uid);
			req.setAttribute("member", vo);
			
			return "/member/modify.jsp";
		}else {
			
			String uid = req.getParameter("uid");
			String name = req.getParameter("name");
			String hp = req.getParameter("hp");
			String pos = req.getParameter("pos");
			String dep = req.getParameter("dep");
			
			
			MemberVo vo = new MemberVo();
			vo.setUid(uid);
			vo.setName(name);
			vo.setHp(hp);
			vo.setPos(pos);
			vo.setDep(dep);
			
			MemberDao.getInstance().updateMember(vo);
			
			return "redirect:/member/list.do";
		}
	}
}
