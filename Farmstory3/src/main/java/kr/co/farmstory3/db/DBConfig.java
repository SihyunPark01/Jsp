package kr.co.farmstory3.db;

import java.sql.Connection;
import java.sql.DriverManager;

//편리한 유지보수를 위해 하나로 모으는 작업. 각각 new 객체를 선언해서 하기엔 데이터를 너무 많이 잡아먹잖아? static으로 잡아주면 됨.
//싱글톤 객체 - 자주쓰는 클래스는 싱글톤으로 만들어놓는게 편리하대
public class DBConfig {

	// 싱글톤 - 본인 객체를 본인 클래스 내에서 수행하는것 private로 잡아주면 됨.
	private static DBConfig instance = new DBConfig(); //이게 싱글톤 객체래...
	
	private DBConfig() {}  //public을 private로 잡는 순간 외부에서 이 함수 잡아쓰지 못하지... 
	
	public static DBConfig getInstance() {  //클래스 이름으로 실행함
		return instance;
	}
	
	//DB정보 : 얘네는 고정값임 그래서 final선언 이때 변수이름은 통상적으로 대문자로 씀.
	private final String HOST = "jdbc:mysql://54.180.160.240/maro02260226";
	private final String USER = "maro02260226";
	private final String PASS = "1234";
	
	
	//throw선언해서 예외처리하면 됨.
	public Connection getConnection() throws Exception { //반환값이 conn이고 conn의 자료형타입은 Connection이니까 
		
		//1단계
		Class.forName("com.mysql.jdbc.Driver");
		
		//2단계
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		return conn;
		
	}
	
}
