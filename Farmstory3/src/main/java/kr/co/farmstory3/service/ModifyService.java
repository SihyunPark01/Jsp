package kr.co.farmstory3.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory3.dao.ArticleDao;
import kr.co.farmstory3.vo.ArticleVo;

public class ModifyService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {

		String group = req.getParameter("group");
		String cate  = req.getParameter("cate");
		String seq  = req.getParameter("seq");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		if(req.getMethod().equals("GET")) {
			
			req.setAttribute("seq", seq);
			req.setAttribute("group", group);
			req.setAttribute("cate", cate);
						
			ArticleDao.getInstance().selectArticle(seq);
			
			return "/board/modify.jsp?group="+group+"&cate="+cate;
		
		}else {
			
			ArticleDao.getInstance().updateArticle(title, content, seq);

			return "redirect:/board/view.do?seq="+seq+"&group="+group+"&cate="+cate;
		}
		
	}

}
