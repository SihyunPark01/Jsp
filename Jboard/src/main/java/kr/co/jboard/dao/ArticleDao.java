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

//DAO(Data Access Object) Ŭ����
public class ArticleDao {
	
	//�̱��� ��ü
	private static ArticleDao instance = new ArticleDao();
	
	public static ArticleDao getInstance() {
		return instance;
	}

	private ArticleDao() {}
	
	
	
	public int selectCountTotal() {
		
		int total = 0;
		
		try {
		//1�ܰ�
			Connection conn = DBConfig.getInstance().getConnection();
		//3�ܰ�
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
	
	
	
	public ArticleBean selectArticle(String seq) { //�۾��� Ŭ���ϸ� ó���Ǵ� ������, ()�ȿ��� seq�� �ڷ���Ÿ�� �������ֱ�
		
		
		ArticleBean ab = null; //�̷��� �ϴ°� ����
		FileBean fb = null; //filebean ���� ����
		
		try{ //�� ó������ �����ϴ� ����ϳ� �������? articleDao�� �̵�! (������ view���� �ϴ� �۾�)
			//1,2�ܰ�
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3�ܰ�
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLE);
			psmt.setString(1, seq);
			
			//4�ܰ�
			ResultSet rs = psmt.executeQuery();
			
			//5�ܰ�
			if(rs.next()) { //bean��ü ����� �����;� �ϴµ� �ϳ��ϱ� ���⼭ �ٷ� ����
								
				ab = new ArticleBean(); //�̷��� �������� �ϴ°� ����
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
				
				ab.setFb(fb); //�̰� �� �ϴµ�? ab��ü�� fb��ü�� ����ִ� �۾�
				
			}
			//6�ܰ�
			rs.close();
			psmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return ab;	//return ����ָ� void�� ������ �ڷ���Ÿ������ �ٲ������
		
	}
	
	
	public List<ArticleBean> selectArticles(int start) {
		
		List<ArticleBean> articles = new ArrayList<>(); //�ؿ� ab��ü�� list�� ����
		
		try{
		//1~2�ܰ�
		Connection conn = DBConfig.getInstance().getConnection();

		//3�ܰ�
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES); //���۾��ϱ����� sqlŬ������ ���� �������ְ�
		psmt.setInt(1, start);
		
		//4�ܰ�
		ResultSet rs = psmt.executeQuery();
		
		//5�ܰ�
		while(rs.next()){ //�۰�����ŭ�� ��ü�� ��������..�׷��� �ݺ��� ���°���. �� �۾��ϱ����� ArticleBeanŬ���� ����� ���ͼ��� ����.
			ArticleBean ab = new ArticleBean(); 				//�ؿ� html�±׵� �ٲ���� ��.
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
			ab.setNick(rs.getString(12));	//�г��� ��� ���� article�� member���̺� �����߱� ������ �߰�.
			
			articles.add(ab);
		}
		
		//6�ܰ�
		rs.close();
		psmt.close();
		conn.close();
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return articles;
		
	}
	
	public List<ArticleBean> selectComments(String seq){
		
		List<ArticleBean> comments = new ArrayList<>(); //�ؿ� ab��ü�� list�� ����
		
		try{
		//1~2�ܰ�
		Connection conn = DBConfig.getInstance().getConnection();

		//3�ܰ�
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COMMENTS); //���۾��ϱ����� sqlŬ������ ���� �������ְ�
		psmt.setString(1, seq);
		
		//4�ܰ�
		ResultSet rs = psmt.executeQuery();
		
		//5�ܰ�
		while(rs.next()){ //�۰�����ŭ�� ��ü�� ��������..�׷��� �ݺ��� ���°���. �� �۾��ϱ����� ArticleBeanŬ���� ����� ���ͼ��� ����.
			ArticleBean ab = new ArticleBean(); 				//�ؿ� html�±׵� �ٲ���� ��.
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
			ab.setNick(rs.getString(12));	//�г��� ��� ���� article�� member���̺� �����߱� ������ �߰�.
			
			comments.add(ab);
		}
		
		//6�ܰ�
		rs.close();
		psmt.close();
		conn.close();
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return comments;
	}
	
	public void insertArticle() {}
	
	public void insertComment(ArticleBean ab /*int parent, String content, String uid, String regip �̷��Լ����ϸ� �ʹ� ��ϱ�*/) {
		
		try{
			//1,2�ܰ�
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3�ܰ�
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_COMMENT); //���������鷯����
			psmt.setInt(1, ab.getParent());
			psmt.setString(2, ab.getContent());
			psmt.setString(3, ab.getUid());
			psmt.setString(4, ab.getRegip());
			
			//4�ܰ�
			psmt.executeUpdate();
			
			//5�ܰ�
			//6�ܰ�
			psmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}

		
	}
	
	public void updateArticle() {}
	
	public void updateArticleHit(String seq) { //��ȸ�� ī��Ʈ�ǰԲ�
		try{
			//1,2�ܰ�
			Connection conn = DBConfig.getInstance().getConnection();
			//3�ܰ�
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_HIT); //sql�����Ϸ���
			psmt.setString(1, seq);
			
			//4�ܰ�
			psmt.executeUpdate();
			
			//5�ܰ�
			//6�ܰ�
			
			psmt.close();
			conn.close();		
			
			}catch(Exception e){
				e.printStackTrace();
			}
		
	}
	
	public void updateCommentCount(String parent) { //��ۼ� ī��Ʈ�ǰԲ�
		try{
			//1,2�ܰ�
			Connection conn = DBConfig.getInstance().getConnection();
			//3�ܰ�
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_COMMENT_COUNT); //sql�����Ϸ���
			psmt.setString(1, parent);
			
			//4�ܰ�
			psmt.executeUpdate();
			
			//5�ܰ�
			//6�ܰ�
			
			psmt.close();
			conn.close();		
			
			}catch(Exception e){
				e.printStackTrace();
			}
		
	}
	
	
	public void deleteArticle() {}
	
	
}
