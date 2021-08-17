package kr.co.jboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.jboard.bean.ArticleBean;
import kr.co.jboard.db.DBConfig;
import kr.co.jboard.db.Sql;

//DAO(Data Access Object) 클래스
public class ArticleDao {
	
	//싱글톤 객체
	private static ArticleDao instance = new ArticleDao();
	
	public static ArticleDao getInstance() {
		return instance;
	}

	
	private ArticleDao() {}
	
	public int selectCountTotal() {
		
		int total = 0;
		
		try {
		//1단계
			Connection conn = DBConfig.getInstance().getConnection();
		//3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_TOTAL);
			
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()) {
			total = rs.getInt(1);
		}
						
		rs.close();
		psmt.close();
		conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
	
		}
		return total;
	}
	
	
	public void selectArticle() {}
	
	public List<ArticleBean> selectArticles(int start) {
		
		List<ArticleBean> articles = new ArrayList<>(); //밑에 ab객체를 list에 담음
		
		try{
		//1~2단계
		Connection conn = DBConfig.getInstance().getConnection();

		//3단계
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES); //이작업하기위해 sql클래스로 가서 선언해주고
		psmt.setInt(1, start);
		//4단계
		ResultSet rs = psmt.executeQuery();
		
		//5단계
		while(rs.next()){ //글개수만큼의 빈객체를 만들어야함..그래서 반복문 쓰는것임. 이 작업하기위해 ArticleBean클래스 만들고 게터세터 선언.
			ArticleBean ab = new ArticleBean(); 				//밑에 html태그도 바꿔줘야 함.
			ab.setSeq(rs.getInt(1));
			ab.setParent(rs.getInt(2));
			ab.setComment(rs.getInt(3));
			ab.setCate(rs.getString(4));
			ab.setTitle(rs.getString(5));
			ab.setContent(rs.getString(6));
			ab.setFile(rs.getInt(7));
			ab.setHit(rs.getInt(8));
			ab.setUid(rs.getString(9));
			ab.setRegip(rs.getString(10));
			ab.setRdate(rs.getString(11));
			ab.setNick(rs.getString(12));	//닉네임 얻기 위해 article과 member테이블 조인했기 떄문에 추가.
			
			articles.add(ab);
		}
		
		//6단계
		rs.close();
		psmt.close();
		conn.close();
		
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return articles;
		
	}
	public void insertArticle() {}
	public void updateArticle() {}
	public void deleteArticle() {}
	
	
}
