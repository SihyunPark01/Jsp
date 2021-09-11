package service.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDao;
import vo.CustomerVo;

public class RegisterService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			return "/register.jsp";
		}else {
			
			String name = req.getParameter("name");
			String address = req.getParameter("address");
			String phone = req.getParameter("phone");
			
			CustomerVo vo = new CustomerVo();
			vo.setName(name);
			vo.setAddress(address);
			vo.setPhone(phone);
			
			
			//Dao 실행
			CustomerDao.getInstance().insertCustomer(vo);
		
			return "redirect:/list.do";
		}
	}

}