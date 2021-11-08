package kr.co.Jboard2.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.Jboard2.dao.ArticleDao;
import kr.co.Jboard2.vo.ArticleVo;

public class ViewService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String seq = req.getParameter("seq");
		
		ArticleDao dao = ArticleDao.getInstance();
		ArticleVo vo = dao.selectArticle(seq);
		List<ArticleVo> comments = dao.selectComments(seq);
		
		req.setAttribute("vo", vo);
		req.setAttribute("comments", comments);
		
		
		return "/view.jsp";
		
		}
	}


