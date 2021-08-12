package kr.co.jboard.db;

public class Sql {
	
	
	//Sql문을 모아두기 위해 Sql클래스를 만들었고, 고정적이기 때문에 static final을 선언함. 변수는 대문자로 다시 정의해줬고, 각각 jsp파일에서
	//sql문을 복붙해옴. 대신 각각 jsp파일에는 Sql(클래스명).SELECT_TERMS(변수명)이런식으로 변경해주기.
	//사용자 관련
	public static final String SELECT_TERMS = "SELECT * FROM `Jboard_terms`;";

	public static final String INSERT_MEMBER = "INSERT INTO `Jboard_member` SET "
			 +"`uid`=?,"
			 +"`pass`=PASSWORD(?)," //DB에 있는 컬럼명이란 말이야? / 암호화작업 (보통은 라이브러리 다운받아 함)
			 +"`name`=?,"
			 +"`nick`=?,"
			 +"`email`=?,"
			 +"`hp`=?,"		//grade는 default값 2라 뺐음
			 +"`zip`=?,"
			 +"`addr1`=?,"
			 +"`addr2`=?,"
			 +"`regip`=?," 
			 +"`rdate`=NOW();";
	
	
	
	public static final String SELECT_COUNT_UID = "SELECT COUNT(`uid`) FROM `Jboard_member` WHERE `uid`=?;";
	
	public static final String SELECT_COUNT_NICK = "SELECT COUNT(`nick`) FROM `Jboard_member` WHERE `nick`=?;"; //select에서 count활용 1이면 1개있음, 0이면 없음
	
	public static final String SELECT_COUNT_EMAIL = "SELECT COUNT(`email`) FROM `Jboard_member` WHERE `email`=?;";
	
	public static final String SELECT_COUNT_HP = "SELECT COUNT(`hp`) FROM `Jboard_member` WHERE `hp`=?;";
	
	
	
	
	
	
}
