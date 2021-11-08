package kr.co.farmstory3.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory3.dao.ArticleDao;
import kr.co.farmstory3.vo.ArticleVo;
import kr.co.farmstory3.vo.MemberVo;


public class ListService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {

		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String includeFile = "./_aside"+group+".jsp";
		
		req.setAttribute("includeFile", includeFile);
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		
		HttpSession sess = req.getSession();
		MemberVo sessMember = (MemberVo) sess.getAttribute("sessMember");
		
		if(sessMember == null) {//로그인을 거치지 않았을 때
			
			return "redirect:/member/login.do?success=102";
			
		}else {

			String pg = req.getParameter("pg");
	
			// 페이지 처리 ---> 밑에 모듈화 시켜보자! 
			
			int currentPage = getCurrentPageNum(pg); //pg 페이지를 숫자로 변환, 로그인해서 list페이지로 들어올때 pg를 보내니까 오류가 날 수 있음.
			int total = ArticleDao.getInstance().selectCountTotal();
			int lastPageNum = getLastPageNum(total);
			int start = getLimitStart(currentPage);
			int pageStartNum = getPageStartNum(total, start);
			int[] groups = getPageGroup(currentPage, lastPageNum);
			
			
			List<ArticleVo> articles = ArticleDao.getInstance().selectArticles(cate, start);
			
			req.setAttribute("articles", articles);//list.jsp이 뷰페이지는 articles를 참조해서 출력해야하므로 이 작업이 필요.
			req.setAttribute("lastPageNum", lastPageNum);
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("pageStartNum", pageStartNum);
			req.setAttribute("groups", groups);
			
			return "/board/list.jsp?group="+group+"&cate="+cate; //list.jsp이 뷰페이지는 articles를 참조해서 출력해야하므로
		}
		
	}//requestProc end...
	
	public int getCurrentPageNum(String pg) {
		if(pg == null) {
			pg = "1";
		}
		return Integer.parseInt(pg);
	}
	
	public int getLastPageNum(int total) {
		
		int lastPageNum = 0;
		
		if(total % 10 == 0){
			lastPageNum = total / 10;
		}else{
			lastPageNum = total / 10 + 1;
		}
		return lastPageNum;	
	}
	
	
	public int getLimitStart(int currentPage) {
		return (currentPage - 1) * 10;
	}
	
	
	public int getPageStartNum(int total, int start) {
		return (total - start)+1; //글번호가 기본적으로 0부터 시작하니까 (total-start)+1;로 리턴값 잡아주면 됨. 
	}
	
	public int[] getPageGroup(int currentPage, int lastPageNum) {
		int groupCurrent = (int)Math.ceil(currentPage / 10.0); //현재페이지의 그룹번호, 올림처리해버려야
		int groupStart = (groupCurrent - 1) * 10 + 1;
		int groupEnd = groupCurrent * 10;
		
		if(groupEnd > lastPageNum){
			groupEnd = lastPageNum;		
		}
		
		int[] groups = {groupStart, groupEnd};
		
		//return groupStart, groupEnd; 자바는 리턴값 두개가 안되지? 두개를 하나로 만들자 배열을 이용해서.
		return groups;
	}
}
