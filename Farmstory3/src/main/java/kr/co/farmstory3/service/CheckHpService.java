package kr.co.farmstory3.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.farmstory3.dao.MemberDao;


public class CheckHpService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String hp = req.getParameter("hp");
		
		int count = MemberDao.getInstance().selectCountUid(hp);
		
		//count값으로 json포맷의 데이터 생성
		JsonObject json = new JsonObject();
		json.addProperty("result", count);
				
		//Json 데이터 문자열 출력
		return "json:"+json.toString(); // 리턴값이 컨트롤러에 result로 넘어가게됨. (이게 data로 넘어가야함. json값으로!) 
	}

}
