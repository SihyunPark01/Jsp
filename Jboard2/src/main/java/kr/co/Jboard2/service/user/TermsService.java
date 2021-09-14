package kr.co.Jboard2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.Jboard2.dao.MemberDao;
import kr.co.Jboard2.service.CommonService;
import kr.co.Jboard2.vo.TermsVo;

public class TermsService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		
		//Dao불러오기
		TermsVo vo =MemberDao.getInstance().selectTerms();
		req.setAttribute("vo", vo); //이게 뭘 의미하는건데?? req객체를 terms.jsp에서도 공유하기때문에 "vo"객체를 사용하자
		
		return "/user/terms.jsp";
	}

}
