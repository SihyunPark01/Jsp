package kr.co.jboard.db;

public class Sql {
	
	
	//Sql���� ��Ƶα� ���� SqlŬ������ �������, �������̱� ������ static final�� ������. ������ �빮�ڷ� �ٽ� ���������, ���� jsp���Ͽ���
	//sql���� �����ؿ�. ��� ���� jsp���Ͽ��� Sql(Ŭ������).SELECT_TERMS(������)�̷������� �������ֱ�.
	//����� ����
	public static final String SELECT_TERMS = "SELECT * FROM `Jboard_terms`;";

	public static final String INSERT_MEMBER = "INSERT INTO `Jboard_member` SET "
			 +"`uid`=?,"
			 +"`pass`=PASSWORD(?)," //DB�� �ִ� �÷����̶� ���̾�? / ��ȣȭ�۾� (������ ���̺귯�� �ٿ�޾� ��)
			 +"`name`=?,"
			 +"`nick`=?,"
			 +"`email`=?,"
			 +"`hp`=?,"		//grade�� default�� 2�� ����
			 +"`zip`=?,"
			 +"`addr1`=?,"
			 +"`addr2`=?,"
			 +"`regip`=?," 
			 +"`rdate`=NOW();";
	
	
	
	public static final String SELECT_COUNT_UID = "SELECT COUNT(`uid`) FROM `Jboard_member` WHERE `uid`=?;";
	
	public static final String SELECT_COUNT_NICK = "SELECT COUNT(`nick`) FROM `Jboard_member` WHERE `nick`=?;"; //select���� countȰ�� 1�̸� 1������, 0�̸� ����
	
	public static final String SELECT_COUNT_EMAIL = "SELECT COUNT(`email`) FROM `Jboard_member` WHERE `email`=?;";
	
	public static final String SELECT_COUNT_HP = "SELECT COUNT(`hp`) FROM `Jboard_member` WHERE `hp`=?;";
	
	
	
	
	
	
}
