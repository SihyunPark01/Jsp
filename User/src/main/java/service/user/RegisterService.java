package service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import vo.UserVo;

public class RegisterService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			return "/user/register.jsp";
		}else {
			
			String uid = req.getParameter("uid");
			String name = req.getParameter("name");
			String hp = req.getParameter("hp");
			String age = req.getParameter("age");
			
			UserVo vo = new UserVo();
			vo.setUid(uid);
			vo.setName(name);
			vo.setHp(hp);
			vo.setAge(age);
			
			
			// Database 처리로직 - 여기 선언하면 덩치가 커지니 DAO 만들자
			//Dao 실행
			UserDao.getInstance().insertUser(vo);	
			
			return "redirect:/user/list.do";
		}
			
	}

}
