<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.jboard.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard.db.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!-- DB J_article에 내용 insert하기 -->
<%
	request.setCharacterEncoding("utf-8");

	//Multipart 전송 데이터 수신(파일 업로드와 동시에 처리)
	String path = request.getServletContext().getRealPath("/file");
	int maxSize = 1024 * 1024 * 10; //최대 파일 허용량 10MB
	
	//파일 업로드는 이 한줄로 끝남 (cos라이브러리를 썼기때문에) cos lib에 추가하는것!
	MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
 	
	
	String uid = mRequest.getParameter("uid");
	String title = mRequest.getParameter("title");
	String content = mRequest.getParameter("content");
	String fname = mRequest.getFilesystemName("fname"); //fname은 첨부하는 파일의 이름텍스트임! 그래서 getParameter대신 저거써야함.
	String regip = request.getRemoteAddr();
	
	int seq = 0;
	
	try{
		//1~2단계
		Connection conn = DBConfig.getInstance().getConnection();
		
		// 3단계
		Statement stmt = conn.createStatement();
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
		psmt.setString(1, title);
		psmt.setString(2, content);
		psmt.setInt(3, fname == null ? 0 : 1);
		psmt.setString(4, uid);
		psmt.setString(5, regip);
		
		
		//4단계
		psmt.executeUpdate();//insert하자마자 생성되는 글번호를 
		ResultSet rs = stmt.executeQuery(Sql.SELECT_MAX_SEQ); //바로 그 글번호만 가져오기.이거 바로 이어서 거는게 중요함!!!  트랜잭션 거는게 있음. 		
		
		//5단계
		if(rs.next()){
			seq = rs.getInt(1);		//seq는 글번호	, 맨 위에 변수 선언
		}
		
		//6단계
		rs.close();
		stmt.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 파일첨부 했을 떄 처리작업 (파일명 수정)
	if(fname != null){ //파일 첨부를 하면
		
		//파일명 수정
		int i = fname.lastIndexOf(".");
		String ext = fname.substring(i);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newName = now+uid+ext;
		
		File oriFile = new File(path+"/"+fname);
		File newFile = new File(path+"/"+newName);
		
		oriFile.renameTo(newFile); //원래 파일명을 새 파일명으로 바꾸는 선언
					
		
		
		//파일 테이블에 INSERT
		try{
		//1,2단계
		Connection conn = DBConfig.getInstance().getConnection();
		
		//3단계 
			
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_FILE);
		psmt.setInt(1, seq);
		psmt.setString(2, fname); //oriName은 fname임
		psmt.setString(3, newName);
		
		//4단계
		psmt.executeUpdate(); //insert는 이거 쓰더라
		
		//5단계 
		
		//6단계 
		psmt.close();
		conn.close();
		
		
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
		
	//리다이렉트
	response.sendRedirect("/Jboard/list.jsp");
		
	
%>
