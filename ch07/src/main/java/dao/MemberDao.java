package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import vo.MemberVo;
import vo.UserVo;

public class MemberDao {
	
	private static MemberDao instance = new MemberDao();
	public static MemberDao getInstance() {
		return instance;
	}
	
	private MemberDao() {}

	private String host = "jdbc:mysql://54.180.160.240:3306/maro02260226";
	private String user = "maro02260226";
	private String pass = "1234";
	
	
	public void insertMember(MemberVo vo) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");			
			Connection conn = DriverManager.getConnection(host,user,pass);
			String sql = "INSERT INTO `MEMBER` VALUES (?,?,?,?,?,NOW())";
			PreparedStatement psmt = conn.prepareStatement(sql);			
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getHp());
			psmt.setString(4, vo.getPos());			
			psmt.setInt(5, vo.getDep());			
								
			psmt.executeUpdate();
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public MemberVo selectMember(String uid) {
		MemberVo vo = null;
		
		try {
				Class.forName("com.mysql.jdbc.Driver");				
				Connection conn = DriverManager.getConnection(host,user,pass);
				PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `MEMBER` WHERE `uid`=?");
				psmt.setString(1, uid);
				
				ResultSet rs = psmt.executeQuery();
				
				if(rs.next()){
					vo = new MemberVo();
					vo.setUid(rs.getString(1));
					vo.setName(rs.getString(2));
					vo.setHp(rs.getString(3));
					vo.setPos(rs.getString(4));
					vo.setDep(rs.getInt(5));
				}
			
				rs.close();
				psmt.close();
				conn.close();
			
			}catch (Exception e) {
				e.printStackTrace();			
			}
			
			return vo;
	}
	
	public List<MemberVo> selectMembers() {
			
			List<MemberVo> members = new ArrayList<>();
			
			try {
				//1단계 - lib 3개 추가해야겠지?
				Class.forName("com.mysql.jdbc.Driver");			
				//2단계
				Connection conn = DriverManager.getConnection(host,user,pass);
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM `MEMBER`");
				
				
				while(rs.next()) {
					MemberVo vo = new MemberVo();
					vo.setUid(rs.getString(1));
					vo.setName(rs.getString(2));
					vo.setHp(rs.getString(3));
					vo.setPos(rs.getString(4));
					vo.setDep(rs.getInt(5));
					vo.setRdate(rs.getString(6));
					
					members.add(vo);
				}
				
				rs.close();
				stmt.close();
				conn.close();
				
			}catch (Exception e) {
				e.printStackTrace();		
			}
			return members;
			
		}
	public void updateMember(MemberVo vo) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(host,user,pass);
			String sql = "UPDATE `MEMBER` SET `name`=?, `hp`=?, `pos`=?, `dep`=? WHERE `uid`=?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getName());
			psmt.setString(2, vo.getHp());
			psmt.setString(3, vo.getPos());
			psmt.setInt(4, vo.getDep());
			psmt.setString(5, vo.getUid());
			
			psmt.executeUpdate();
			psmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	public void deleteMember(String uid) {
			
			try {
				//1단계 - lib 3개 추가해야겠지?
				Class.forName("com.mysql.jdbc.Driver");			
				//2단계
				Connection conn = DriverManager.getConnection(host,user,pass);
				//3단계
				String sql = "DELETE FROM `MEMBER` WHERE `uid`=?";
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
