package kr.co.farmstory3.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.farmstory3.db.DBConfig;
import kr.co.farmstory3.db.Sql;
import kr.co.farmstory3.vo.ArticleVo;
import kr.co.farmstory3.vo.FileVo;


public class ArticleDao {
	
	
	//싱글톤 객체 생성
	private static ArticleDao instance = new ArticleDao();
	
	public static ArticleDao getInstance() {
		return instance;
	}
	
	private ArticleDao() {}
	
	public int insertArticle(ArticleVo vo) {
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
			psmt.setString(1, vo.getCate());		
			psmt.setString(2, vo.getTitle());		
			psmt.setString(3, vo.getContent());		
			psmt.setInt(4, vo.getFile());		
			psmt.setString(5, vo.getUid());		
			psmt.setString(6, vo.getRegip());	
			
			int result = psmt.executeUpdate();
			
			psmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
			return selectMaxSeq();
	}		
	
	
	public void insertFile(int seq, String oriName, String newName) {
		try{
			
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_FILE);
			psmt.setInt(1, seq);
			psmt.setString(2, oriName); //oriName은 fname임
			psmt.setString(3, newName);
			psmt.executeUpdate(); //insert는 이거 쓰더라
			
			psmt.close();
			conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	
	
	public void insertComment() {}
	
	
	public int selectCountTotal() {
		
		int total = 0;
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs =stmt.executeQuery(Sql.SELECT_COUNT_TOTAL);
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			rs.close();
			stmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	
	public int selectMaxSeq() {
		int seq = 0;
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(Sql.SELECT_MAX_SEQ);
		
			if(rs.next()) {
				seq = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return seq;
	}
	
	public FileVo selectFile(String fseq) {
			
			FileVo fvo = null;
			
			try {
				Connection conn = DBConfig.getInstance().getConnection();
				PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_FILE);
				psmt.setString(1, fseq);
				
				ResultSet rs = psmt.executeQuery();
				
				if(rs.next()) {
					fvo = new FileVo();
					fvo.setFseq(rs.getInt(1));
					fvo.setParent(rs.getInt(2));
					fvo.setOriName(rs.getString(3));
					fvo.setNewName(rs.getString(4));
					fvo.setDownload(rs.getInt(5));
					fvo.setRdate(rs.getString(6));
				}
				rs.close();
				psmt.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			return fvo;
			
		}
	public ArticleVo selectArticle(String seq) {
		
		ArticleVo vo = null;
		FileVo fvo = null;
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLE);
			psmt.setString(1, seq);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new ArticleVo();
				vo.setSeq(rs.getInt(1));
				vo.setParent(rs.getInt(2));
				vo.setComment(rs.getInt(3));
				vo.setCate(rs.getString(4));
				vo.setTitle(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setFile(rs.getInt(7));
				vo.setHit(rs.getInt(8));
				vo.setUid(rs.getString(9));
				vo.setRegip(rs.getString(10));
				vo.setRdate(rs.getString(11));
				
				//파일정보
				fvo = new FileVo();
				fvo.setFseq(rs.getInt(12));
				fvo.setParent(rs.getInt(13));
				fvo.setOriName(rs.getString(14));
				fvo.setNewName(rs.getString(15));
				fvo.setDownload(rs.getInt(16));
				fvo.setRdate(rs.getString(17));
				
				vo.setFb(fvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
			return vo;
	}
	
	public List<ArticleVo> selectArticles(String cate, int start) {
		
		List<ArticleVo> articles = new ArrayList<>();
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
			psmt.setString(1, cate);
			psmt.setInt(2, start);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleVo vo = new ArticleVo();
				vo.setSeq(rs.getInt(1));
				vo.setParent(rs.getInt(2));
				vo.setComment(rs.getInt(3));
				vo.setCate(rs.getString(4));
				vo.setTitle(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setFile(rs.getInt(7));
				vo.setHit(rs.getInt(8));
				vo.setUid(rs.getString(9));
				vo.setRegip(rs.getString(10));
				vo.setRdate(rs.getString(11).substring(2, 10));
				vo.setNick(rs.getString(12));	
				
				articles.add(vo);
			}
			rs.close();
			psmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
			return articles;
	}
	
	public List<ArticleVo> selectComments (String seq) {
		
		List<ArticleVo> comments = new ArrayList<>();
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COMMENTS);
			psmt.setString(1, seq);
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				ArticleVo vo = new ArticleVo();
				vo.setSeq(rs.getInt(1));
				vo.setParent(rs.getInt(2));
				vo.setComment(rs.getInt(3));
				vo.setCate(rs.getString(4));
				vo.setTitle(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setFile(rs.getInt(7));
				vo.setHit(rs.getInt(8));
				vo.setUid(rs.getString(9));
				vo.setRegip(rs.getString(10));
				vo.setRdate(rs.getString(11));
				vo.setNick(rs.getString(12));
				
				comments.add(vo);
			}
			rs.close();
			psmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			return comments;
	}

	public void updateArticle(String title, String content, String seq) {
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, seq);
			
			psmt.executeUpdate();
			psmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void updateArticleHit() {}
	public void updateCommentCount() {}
	public void updateComment() {}
	public void updateFileDownload() {}
	
	
	public void deleteArticle(String seq) {
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.DELETE_ARTICLE);
			psmt.setString(1, seq);
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteComment() {}

}
