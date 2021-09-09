package service.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVo;

public class ListService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {

		List<MemberVo> members = MemberDao.getInstance().selectMembers();
		
		req.setAttribute("members", members);
		
		return "/member/list.jsp";
	}

}
