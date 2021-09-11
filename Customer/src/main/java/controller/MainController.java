package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.customer.CommonService;

public class MainController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private Map<String, Object> instances = new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
	

	ServletContext ctx = config.getServletContext();
	String path = ctx.getRealPath("/WEB-INF")+"/urlMapping.properties";
	
	Properties prop = new Properties();
	
	try {
		FileInputStream fis = new FileInputStream(path);
		prop.load(fis);
		fis.close();
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	Iterator iter = prop.keySet().iterator();
	
	while(iter.hasNext()) {
		
		String k = iter.next().toString();
		String v = prop.getProperty(k);
		
		try {
			Class obj = Class.forName(v);
			Object instance = obj.newInstance();
			
			instances.put(k, instance);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	requestProc(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	requestProc(req, resp);
	}
	
	protected void requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = req.getContextPath();
		String uri = req.getRequestURI();
		String key = uri.substring(path.length());
		
		CommonService instance = (CommonService) instances.get(key);
		
		String result = instance.requestProc(req, resp);
		
		if(result.startsWith("redirect:")) {
			
			String redirecUrl = result.substring(9);
			resp.sendRedirect(path+redirecUrl);
			
		}else {
			
			RequestDispatcher dispatcher = req.getRequestDispatcher(result);
			dispatcher.forward(req, resp);
		}
	}
}
