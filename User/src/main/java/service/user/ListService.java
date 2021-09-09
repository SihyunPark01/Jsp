package service.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import vo.UserVo;

public class ListService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		List<UserVo> users = UserDao.getInstance().selectUsers();
		
		
		//여기서 중요하대... users는 list에서 출력할 결과 따라서 view에서도 users를 참조해야 함
		//컴포넌트간의 데이터 공유(view에서 해당 list를 참조해서 출력해야 하기 때문에)		
		req.setAttribute("users", users); 
		
		return "/user/list.jsp";
	}

}
