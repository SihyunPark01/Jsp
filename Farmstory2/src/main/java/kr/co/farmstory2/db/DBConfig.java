package kr.co.farmstory2.db;

import java.sql.Connection;
import java.sql.DriverManager;

// ���� ���������� ���� �ϳ��� ������ �۾�. ���� new ��ü�� �����ؼ� �ϱ⿣ �����͸� �ʹ� ���� ��Ƹ��ݾ�? static���� ����ָ� ��.
// �̱��� ��ü - ���־��� Ŭ������ �̱������� �������°� ���ϴ�
public class DBConfig {

	// �̱��� - ���� ��ü�� ���� Ŭ���� ������ �����ϴ°� private�� ����ָ� ��.
	private static DBConfig instance = new DBConfig(); //�̰� �̱��� ��ü��...
	
	private DBConfig() {} //public�� private�� ��� ���� �ܺο��� �� �Լ� ��ƾ��� ������... 
	
	public static DBConfig getInstance() { //Ŭ���� �̸����� ������
		return instance;
	}
	
	//DB���� : ��״� �������� �׷��� final���� �̶� �����̸��� ��������� �빮�ڷ� ��.
	private final String HOST = "jdbc:mysql://54.180.160.240:3306/maro02260226";
	private final String USER = "maro02260226";
	private final String PASS = "1234";
	
	
	//throw�����ؼ� ����ó���ϸ� ��.
	public Connection getConnection() throws Exception { //��ȯ���� conn�̰� conn�� �ڷ���Ÿ���� Connection�̴ϱ� 
		
		//1�ܰ�
		Class.forName("com.mysql.jdbc.Driver");
		
		//2�ܰ�
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		return conn;
		
	}
	
}
