package kr.co.Jboard2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.Jboard2.db.DBConfig;
import kr.co.Jboard2.db.Sql;
import kr.co.Jboard2.vo.ArticleVo;

public class ArticleDao {

	//싱글톤 객체 생성
	private static ArticleDao instance = new ArticleDao();
	public static ArticleDao getInstance() {
		return instance;
	}
	private ArticleDao() {}
	
	public int insertArticle(ArticleVo vo) {
		
		try {
			Connection conn =DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			psmt.setInt(3, vo.getFile());
			psmt.setString(4, vo.getUid());
			psmt.setString(5, vo.getRegip());
			
			//executeUpdate의 리턴값이 뭘까???
			int result = psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
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
	public void selectCountTotal() {}
	
	public int selectMaxSeq() {
		int seq = 0;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(Sql.SELECT_MAX_SEQ);
			if(rs.next()){
				seq = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return seq;
	}
	
	public void selectArticle() {}
	
	
	public List<ArticleVo> selectArticles(int start) {
		
		List<ArticleVo> articles = new ArrayList<>();
				
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
			psmt.setInt(1, start);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {//리스트가 필요하므로 위에 List<ArticleVo>선언.
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
	
	
	public void selectComment() {}
	public void selectComments() {}
	public void updateArticle() {}
	public void updateArticleHit() {}
	public void updateCommentCount() {}
	public void updateComment() {}
	public void deleteArticle() {}
	public void deleteComment() {}
	
}
