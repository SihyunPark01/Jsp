package service.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDao;
import vo.CustomerVo;

public class ModifyService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		if(req.getMethod().equals("GET")) {
			String custid = req.getParameter("custid");
			CustomerVo vo = CustomerDao.getInstance().selectCustomer(custid);
			req.setAttribute("customer", vo);
			
			return "/modify.jsp";
			
		}else {
			String custid  = req.getParameter("custid");
			String name = req.getParameter("name");
			String address = req.getParameter("address");
			String phone = req.getParameter("phone");
			
			CustomerVo vo = new CustomerVo();
			vo.setCustid(custid);
			vo.setName(name);
			vo.setAddress(address);
			vo.setPhone(phone);
			
			CustomerDao.getInstance().updateCustomer(vo);
			
			return "redirect:/list.do";
		}
		
	}

}
