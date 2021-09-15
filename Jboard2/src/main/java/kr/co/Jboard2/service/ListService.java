package kr.co.Jboard2.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.Jboard2.dao.ArticleDao;
import kr.co.Jboard2.vo.ArticleVo;
import kr.co.Jboard2.vo.MemberVo;

public class ListService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession sess = req.getSession();
		MemberVo sessMember = (MemberVo) sess.getAttribute("sessMember");
		
		if(sessMember == null) {//로그인을 거치지 않았을 때
			return "redirect:/user/login.do?success=102";
		}else {

			int start = 0;
			List<ArticleVo> articles = ArticleDao.getInstance().selectArticles(start);
			req.setAttribute("articles", articles);//list.jsp이 뷰페이지는 articles를 참조해서 출력해야하므로 이 작업이 필요.
			
				
			return "/list.jsp"; //list.jsp이 뷰페이지는 articles를 참조해서 출력해야하므로
		}
	}
}