package kr.co.Jboard2.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.Jboard2.dao.ArticleDao;
import kr.co.Jboard2.vo.ArticleVo;

public class WriteService implements CommonService{

	private String path = null;
	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			return "/write.jsp";
		}else {
			
			MultipartRequest mReq = getMultipartRequest(req);
			String title = mReq.getParameter("title");
			String content = mReq.getParameter("content");
			String uid = mReq.getParameter("uid");
			String fname = mReq.getFilesystemName("fname");
			String regip = req.getRemoteAddr();
					
			ArticleVo vo = new ArticleVo();
			vo.setTitle(title);
			vo.setContent(content);
			vo.setFile(fname == null ? 0 : 1);
			vo.setUid(uid);
			vo.setRegip(regip);
			
			int seq = ArticleDao.getInstance().insertArticle(vo); //글번호를 리턴받을것임
				
			if(fname != null) {
				//파일첨부했으면 이름수정하고 INSERT
				String newName = renameFile(fname, uid);
				ArticleDao.getInstance().insertFile(seq, fname, newName);
			}
					
			return "redirect:/list.do";
		}
	
	}//requestProc end...
	
	public MultipartRequest getMultipartRequest(HttpServletRequest req) {
		
		MultipartRequest mReq = null;
		
		try {
			path = req.getServletContext().getRealPath("/file");
			int maxSize = 1024 * 1024 * 10; //최대 파일허용 크기 10MB
			
			mReq = new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
						
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mReq;
	}

	public String renameFile(String fname, String uid) {
			
				//파일명 수정
				int i = fname.lastIndexOf(".");
				String ext = fname.substring(i);
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
				String now = sdf.format(new Date());
				String newName = now+uid+ext;
				
				File oriFile = new File(path+"/"+fname);
				File newFile = new File(path+"/"+newName);
				
				oriFile.renameTo(newFile); //원래 파일명을 새 파일명으로 바꾸는 선언
					
				return newName;
		}
	}
