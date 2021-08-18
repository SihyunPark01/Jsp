package kr.co.jboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.jboard.bean.ArticleBean;
import kr.co.jboard.bean.FileBean;
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
	
	
	
	public ArticleBean selectArticle(String seq) { //글쓴것 클릭하면 처리되는 페이지, ()안에는 seq의 자료형타입 선언해주기
		
		
		ArticleBean ab = null; //이렇게 하는게 좋대
		FileBean fb = null; //filebean 따로 만듬
		
		try{ //이 처리문을 수행하는 모듈하나 만들었지? articleDao로 이동! (원래는 view에서 하던 작업)
			//1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLE);
			psmt.setString(1, seq);
			
			//4단계
			ResultSet rs = psmt.executeQuery();
			
			//5단계
			if(rs.next()) { //bean객체 만들어 가져와야 하는데 하나니까 여기서 바로 생성
								
				ab = new ArticleBean(); //이렇게 변수선언 하는게 좋대
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
				
				fb = new FileBean();
				fb.setFseq(rs.getInt(12));
				fb.setParent(rs.getInt(13));
				fb.setOriName(rs.getString(14));
				fb.setNewName(rs.getString(15));
				fb.setDownload(rs.getInt(16));
				fb.setRdate(rs.getString(17));
				
				ab.setFb(fb); //이거 왜 하는데? ab객체에 fb객체를 집어넣는 작업
				
			}
			//6단계
			rs.close();
			psmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return ab;	//return 잡아주면 void를 변수의 자료형타입으로 바꿔줘야함
		
	}
	
	
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
	
	public List<ArticleBean> selectComments(String seq){
		
		List<ArticleBean> comments = new ArrayList<>(); //밑에 ab객체를 list에 담음
		
		try{
		//1~2단계
		Connection conn = DBConfig.getInstance().getConnection();

		//3단계
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COMMENTS); //이작업하기위해 sql클래스로 가서 선언해주고
		psmt.setString(1, seq);
		
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
			
			comments.add(ab);
		}
		
		//6단계
		rs.close();
		psmt.close();
		conn.close();
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return comments;
	}
	
	public void insertArticle() {}
	
	public void insertComment(ArticleBean ab /*int parent, String content, String uid, String regip 이렇게선언하면 너무 기니까*/) {
		
		try{
			//1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_COMMENT); //쿼리문만들러가자
			psmt.setInt(1, ab.getParent());
			psmt.setString(2, ab.getContent());
			psmt.setString(3, ab.getUid());
			psmt.setString(4, ab.getRegip());
			
			//4단계
			psmt.executeUpdate();
			
			//5단계
			//6단계
			psmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}

		
	}
	
	public void updateArticle() {}
	
	public void updateArticleHit(String seq) { //조회수 카운트되게끔
		try{
			//1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			//3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_HIT); //sql정의하러감
			psmt.setString(1, seq);
			
			//4단계
			psmt.executeUpdate();
			
			//5단계
			//6단계
			
			psmt.close();
			conn.close();		
			
			}catch(Exception e){
				e.printStackTrace();
			}
		
	}
	
	public void updateCommentCount(String parent) { //댓글수 카운트되게끔
		try{
			//1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			//3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_COMMENT_COUNT); //sql정의하러감
			psmt.setString(1, parent);
			
			//4단계
			psmt.executeUpdate();
			
			//5단계
			//6단계
			
			psmt.close();
			conn.close();		
			
			}catch(Exception e){
				e.printStackTrace();
			}
		
	}
	
	
	public void deleteArticle() {}
	
	
}
