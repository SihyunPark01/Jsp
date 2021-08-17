package kr.co.jboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.jboard.bean.ArticleBean;
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
	
	
	public void selectArticle() {}
	
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
	public void insertArticle() {}
	public void updateArticle() {}
	public void deleteArticle() {}
	
	
}
