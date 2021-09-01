package kr.co.farmstory2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.farmstory2.bean.MemberBean;
import kr.co.farmstory2.bean.TermsBean;
import kr.co.farmstory2.db.DBConfig;
import kr.co.farmstory2.db.Sql;



public class MemberDao {
	
	//싱글톤 객체 생성
	private static MemberDao instance = new MemberDao();
	
	public static MemberDao getInstance() {
		return instance;
	}
	
	private MemberDao() {}
	
	public void insertMember() {} 
	
	
	//약관 이걸루 실행하라우!
	public TermsBean selectTerms() {
		return null;
	}
	
	//아이디, 닉네임, 이메일, 폰번호 카운트
	public int selectCountUserInfo(int type) {
		return 0;
	}

	//아이디 중복체크
	public int selectCountUid() {
		return 0;
	}
	
	//닉네임 중복체크
	public int selectCountNick() {
		return 0;
	}

	//이메일 중복체크
	public int selectCountEmail() {
		return 0;
	}

	//폰번호 중복체크
	public int selectCountHp() {
		return 0;
	}

	
	//로그인 - 반환타입이 MemberBean이 됨
	public MemberBean selectMember(String uid, String pass) {
		
		MemberBean mb = null; //이렇게 잡고
		
		
		try{	
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_MEMBER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			ResultSet rs = psmt.executeQuery();
			
			
			if(rs.next()) {
				mb = new MemberBean(); //이런식으로 선언하는게 활용성이 더 높음
				mb.setUid(rs.getString(1));
				mb.setPass(rs.getString(2));
				mb.setName(rs.getString(3));
				mb.setNick(rs.getString(4));
				mb.setEmail(rs.getString(5));
				mb.setHp(rs.getString(6));
				mb.setGrade(rs.getInt(7));
				mb.setZip(rs.getString(8));
				mb.setAddr1(rs.getString(9));
				mb.setAddr2(rs.getString(10));
				mb.setRegip(rs.getString(11));
				mb.setRdate(rs.getString(12));
			}
			

		}catch(Exception e){
			e.printStackTrace();
		}
		return mb;
	} 
	public void selectMembers() {} 
	public void updateMember() {} 
	public void deleteMember() {} 
}
