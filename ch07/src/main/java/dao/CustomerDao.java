package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import vo.CustomerVo;
import vo.MemberVo;

public class CustomerDao {

	private static CustomerDao instance = new CustomerDao();
	public static CustomerDao getInstance() {
		return instance;
	}
	private CustomerDao() {}
	
	private String host = "jdbc:mysql://54.180.160.240:3306/maro02260226";
	private String user = "maro02260226";
	private String pass = "1234";
	
	public void insertCustomer(CustomerVo vo) {
		try {
			Class.forName("com.mysql.jdbc.Driver");			
			Connection conn = DriverManager.getConnection(host,user,pass);
			String sql = "INSERT INTO `Customer` VALUES (?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);			
			psmt.setString(1, vo.getCustid());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getAddress());
			psmt.setString(4, vo.getPhone());			
								
			psmt.executeUpdate();
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public CustomerVo selectMember(String uid) {
		CustomerVo vo = null;
		
		try {
				Class.forName("com.mysql.jdbc.Driver");				
				Connection conn = DriverManager.getConnection(host,user,pass);
				PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `MEMBER` WHERE `uid`=?");
				psmt.setString(1, uid);
				
				ResultSet rs = psmt.executeQuery();
				
				if(rs.next()){
					vo = new CustomerVo();
					vo.setCustid(rs.getString(1));
					vo.setName(rs.getString(2));
					vo.setAddress(rs.getString(3));
					vo.setPhone(rs.getString(4));
				}
			
				rs.close();
				psmt.close();
				conn.close();
			
			}catch (Exception e) {
				e.printStackTrace();			
			}
			
			return vo;
	}
	
	
	public List<CustomerVo> selectCustomers() {
		
		List<CustomerVo> customers = new ArrayList<>();
		try {
			Class.forName("com.sql.jdbc.driver");
			Connection conn = DriverManager.getConnection(host,user,pass);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM `Customer`");
			
			while(rs.next()) {
				CustomerVo vo = new CustomerVo();
				vo.setCustid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setAddress(rs.getString(3));
				vo.setPhone(rs.getString(4));
				
				customers.add(vo);
			}
			rs.close();
			stmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return customers;
	}
	
	
	public void updateCustomer() {}
	public void daleteCustomer() {}
	
}