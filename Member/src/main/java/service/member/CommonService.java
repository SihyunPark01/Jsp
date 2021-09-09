package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommonService { //인터페이스임

	public String requestProc(HttpServletRequest req, HttpServletResponse resp);

}