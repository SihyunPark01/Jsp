package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import vo.UserVo;

public class UserDao {
	
	private static UserDao instance = new UserDao();
	public static UserDao getInstance() {
		return instance;
	}
	
	private UserDao() {} //new객체 생성못하게...
	
	private String host = "jdbc:mysql://54.180.160.240:3306/maro02260226";
	private String user = "maro02260226";
	private String pass = "1234";
	
	public void insertUser(UserVo vo) {
		try {
			//1단계 - lib 3개 추가해야겠지?
			Class.forName("com.mysql.jdbc.Driver");			
			//2단계
			Connection conn = DriverManager.getConnection(host,user,pass);
			//3단계
			String sql = "INSERT INTO `user1` VALUES (?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);			
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getHp());
			psmt.setInt(4, vo.getAge());			
			//4단계					
			psmt.executeUpdate();
			//5단계
			//6단계
			psmt.close();
			conn.close();
			
			}catch (Exception e) {
				e.printStackTrace();			
			}
		
	}
	public UserVo selectUser(String uid) {
		UserVo vo = null;
		
		try {
				Class.forName("com.mysql.jdbc.Driver");				
				Connection conn = DriverManager.getConnection(host,user,pass);
				PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `user1` WHERE `uid`=?");
				psmt.setString(1, uid);
				
				ResultSet rs = psmt.executeQuery();
				
				if(rs.next()){
					vo = new UserVo();
					vo.setUid(rs.getString(1));
					vo.setName(rs.getString(2));
					vo.setHp(rs.getString(3));
					vo.setAge(rs.getInt(4));
				}
			
				rs.close();
				psmt.close();
				conn.close();
			
			}catch (Exception e) {
				e.printStackTrace();			
			}
			
			return vo;
	}
	
	
	
	public List<UserVo> selectUsers() {
		
		List<UserVo> users = new ArrayList<>();
		
		try {
			//1단계 - lib 3개 추가해야겠지?
			Class.forName("com.mysql.jdbc.Driver");			
			//2단계
			Connection conn = DriverManager.getConnection(host,user,pass);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM `user1`");
			
			
			while(rs.next()) {
				UserVo vo = new UserVo();
				vo.setUid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setHp(rs.getString(3));
				vo.setAge(rs.getInt(4));
				
				users.add(vo);
			}
			
			rs.close();
			stmt.close();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();		
		}
		return users;
		
	}
	public void updateUser(UserVo vo) {
		try {
			Class.forName("com.mysql.jdbc.Driver");			
			Connection conn = DriverManager.getConnection(host,user,pass);
			
			String sql = "UPDATE `user1` SET `name`=?, `hp`=?, `age`=? WHERE `uid`=?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getName());
			psmt.setString(2, vo.getHp());
			psmt.setInt(3, vo.getAge());
			psmt.setString(4, vo.getUid());
			
			psmt.executeUpdate();
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
}
		
		
	public void deleteUser(String uid) {
		
		try {
			//1단계 - lib 3개 추가해야겠지?
			Class.forName("com.mysql.jdbc.Driver");			
			//2단계
			Connection conn = DriverManager.getConnection(host,user,pass);
			//3단계
			String sql = "DELETE FROM `user1` WHERE `uid`=?";
			PreparedStatement psmt = conn.prepareStatement(sql);			
			psmt.setString(1, uid);
			psmt.executeUpdate();
			psmt.close();
			conn.close();
			
			}catch (Exception e) {
				e.printStackTrace();			
			}
	}
	

}
