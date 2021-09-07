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

import model.CommonService;

public class MainController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Map<String, Object> instances = new HashMap<>();
		
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		// 최초 요청 시 실행되는 컨트롤러 초기화 메서드
		System.out.println("MainController init 실행!!!");
		
		
		// 액션주소 프로퍼티 파일 경로 구하기
		ServletContext ctx = config.getServletContext();
		String path = ctx.getRealPath("/WEB-INF") + "/urlMapping.properties";
		
		
		// 프로퍼티 파일 입력스트림 연결 후 프로퍼티 객체 생성
		Properties prop = new Properties(); //자료구조(컬렉션)임, key와 value값 모두 String인 컬렉션
		//Map<String, String> map = new HashMap<>(); 얘랑 똑같은 것
		
		try {//Stream은 데이터 이동통로. 
			FileInputStream fis = new FileInputStream(path);
			prop.load(fis);
			fis.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
			
		// 프로퍼티 객체로 서비스 객체 생성
		Iterator iter = prop.keySet().iterator(); //자바 자료구조 더 공부하자... prop의 key값들을 Set집합으로 만듬. 순서없으므로 반복자개념활용
		
		while(iter.hasNext()){ //key값 3개밖에 없으니 3번반복하겠지?
			
			String k = iter.next().toString(); //반복적으로 key값을 끄집어냄.
			String v = prop.getProperty(k); //key값을 가지고 value값을 가지고옴.
					
			try {
	
				//HelloService instance1 = new HelloService(); 정적 객체
				
				Class obj = Class.forName(v);
				Object instance = obj.newInstance(); //new객체를 동적으로 생성함. object타입으로 선언함.
		
				instances.put(k, instance);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}//init end...
	
	
	//doGet과 doPost는 공통로직을 가지므로 requestProc메서드 만들어서 호출하는 방식으로!
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	
	}
	
	//왜 이걸 선언했는지 생각해
	protected void requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 요청주소에서 key 구하기 - hello.do, welcome.do, greeting.do를 구하는 작업. 그게 key니까.
		String path = req.getContextPath();
		String uri = req.getRequestURI();
		String key = uri.substring(path.length());

		
		// Map에서 Service 객체 꺼내기
		
		//***Object instance = instances.get(key); //instance는 object타입. 구체화시키기위해선 다운캐스팅 해줘야함.
		CommonService instance = (CommonService) instances.get(key); //최종 
		//HelloService service = (HelloService) instance; //다운캐스팅 해줘야해 instance객체를 helloservice로 다운캐스팅
		//이렇게 일일히 다 선언해줄 수 없으니 model에 CommonService라는 인터페이스 만들어주자
		//***CommonService service = (CommonService) instance;
 		
		
		// Service 객체 실행 후 View정보 리턴 받기
		String view = instance.requestProc(req, resp); //requestProc어디 있는 클래스인지 찾아봐 그럼 리턴값 String view(hello.jsp ...)임을 알 수 있음
		
		// 해당 View로 forward 하기
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}
	
	
}
