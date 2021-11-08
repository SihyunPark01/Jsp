package kr.co.farmstory3.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory3.dao.ArticleDao;

public class DeleteService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String seq = req.getParameter("seq");
		String group = req.getParameter("group");
		String cate  = req.getParameter("cate");
				
		ArticleDao.getInstance().deleteArticle(seq);
		
		return "redirect:/board/list.do?group="+group+"&cate="+cate;
	}

}
