<%@page import="kr.co.farmstory2.bean.FileBean"%>
<%@page import="kr.co.farmstory2.dao.ArticleDao"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	//전송 파라미터 수신 - 파일정보select할때 fseq값구하기 위해 view에서 parameter받아와야함
	request.setCharacterEncoding("utf-8");
 	String fseq = request.getParameter("fseq");

	// 파일 정보 Select (new name을 알아내기 위해)
	ArticleDao dao = ArticleDao.getInstance();
	FileBean fb = dao.selectFile(fseq); //fseq구하기 위해 view에서 parameter로 받아와야 함. /fseq는 int니까 string으로 바꿔주는 작업
	
	// 파일 다운로드 카운트 Update
	dao.updateFileDownload(fseq);
	
	// response 헤더 수정 - 이건 코딩 대신 검색해서 해야하는 작업
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(fb.getOriName(), "utf-8"));
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private");	
	
	// response 객체 파일 스트림 작업 - oriName으로 다운로드 받을 수 있도록
	String path = request.getServletContext().getRealPath("/file");
	File file = new File(path+"/"+fb.getNewName());
	
	//stream - 데이터 이동 통로 (캡쳐설명) , 다쓰고나면 연결해제 해야함
	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	
	while(true){
		
		int data = bis.read();
		
		//더이상 읽을 데이터가 없을 경우
		if(data == -1){
			break; 
		}
		
		bos.write(data);
	}
	bos.close();
	bis.close();

%>
