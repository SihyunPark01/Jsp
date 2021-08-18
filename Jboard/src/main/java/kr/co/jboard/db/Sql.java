package kr.co.jboard.db;

public class Sql {
	
	
	//Sql문을 모아두기 위해 Sql클래스를 만들었고, 고정적이기 때문에 static final을 선언함. 변수는 대문자로 다시 정의해줬고, 각각 jsp파일에서
	//sql문을 복붙해옴. 대신 각각 jsp파일에는 Sql(클래스명).SELECT_TERMS(변수명)이런식으로 변경해주기.
	//사용자 관련
	public static final String SELECT_TERMS = "SELECT * FROM `Jboard_terms`;";
														//			?자리에다 uid와 pass 데이터를 맵핑함 
	public static final String SELECT_MEMBER = "SELECT * FROM `Jboard_member` WHERE `uid`=? AND `pass`=PASSWORD(?);";
	
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
	
	
//	public static final String INSERT_ARTICLE = "INSERT INTO `Jboard_article` SET "
//	//		 +"`seq`=?,"  				
//	//		 +"`parent`?," 		얘네는 모두 default값
//	//		 +"`comment`=?,"
//	//		 +"`cate`=?,"
//			 +"`title`=?,"
//			 +"`content`=?,"		//grade는 default값 2라 뺐음
//	//		 +"`file`=?,"  			//그냥 0으로 둘거라서
//	//		 +"`hit`=?,"			//그냥 0으로 둘거라서
//			 +"`uid`=?,"
//			 +"`regip`=?," 
//			 +"`rdate`=NOW();";
	
	
	
	public static final String SELECT_COUNT_UID   = "SELECT COUNT(`uid`) 	FROM `Jboard_member` WHERE `uid`=?;";
	public static final String SELECT_COUNT_NICK  = "SELECT COUNT(`nick`) 	FROM `Jboard_member` WHERE `nick`=?;"; //select에서 count활용 1이면 1개있음, 0이면 없음
	public static final String SELECT_COUNT_HP 	  = "SELECT COUNT(`hp`) 	FROM `Jboard_member` WHERE `hp`=?;";
	public static final String SELECT_COUNT_EMAIL = "SELECT COUNT(`email`) 	FROM `Jboard_member` WHERE `email`=?;";
	
	
	//게시판 관련
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(`seq`) FROM `Jboard_article` WHERE `parent`=0;";

	
	public static final String SELECT_MAX_SEQ = "SELECT MAX(`seq`) FROM `Jboard_article`;";	
	
	public static final String SELECT_ARTICLE = "SELECT * FROM `Jboard_article` AS a "
												+ "	LEFT JOIN `Jboard_file` AS b ON a.seq = b.parent "
												+ "WHERE `seq`=?;";
	//left join을 잘 이해하자. left에 기본적으로 나와야할놈을 넣고 오른쪽에는 파일테이블(파일은 첨부될수도 있고 없을수도 있으니까)
	//결국엔 쿼리문이 관건. 쿼리문이 중요하네.
	
	
	public static final String SELECT_ARTICLES = "SELECT a.*, b.nick FROM `Jboard_article` AS a "
												+ "JOIN `Jboard_member` AS b "
												+ "ON a.uid = b.uid "
												+ "WHERE `parent`=0 "  //댓글 아닌글만 조회되어야 하므로 조건달아줌.
												+ "ORDER BY `seq` DESC "
												+ "LIMIT ?, 10; ";
												
	public static final String SELECT_COMMENTS = "SELECT a.*, b.nick FROM `Jboard_article` AS a "
												+ "JOIN `Jboard_member` AS b "
												+ "ON a.uid = b.uid "
												+ "WHERE `parent`=? "
												+ "ORDER BY `seq` ASC;";
	
	
	public static final String INSERT_ARTICLE = "INSERT INTO `Jboard_article` SET "
												+ "`title`=?,"
												+ "`content`=?,"
												+ "`file`=?,"
												+ "`uid`=?,"
												+ "`regip`=?,"
												+ "`rdate`=NOW();";

	public static final String INSERT_FILE = "INSERT INTO `Jboard_file` SET "
											+ "`parent`=?,"
											+ "`oriName`=?,"
											+ "`newName`=?,"
											+ "`rdate`=NOW();";
								
	public static final String INSERT_COMMENT = "INSERT INTO `Jboard_article` SET "
											+ "`parent`=?,"
											+ "`content`=?,"
											+ "`uid`=?,"
											+ "`regip`=?,"
											+ "`rdate`=NOW();";
									
	
	
	public static final String UPDATE_ARTICLE_HIT = "UPDATE `Jboard_article` SET `hit` = `hit` + 1 "
													+ "WHERE `seq`=?;";
	
	
	public static final String UPDATE_COMMENT_COUNT = "UPDATE `Jboard_article` SET `comment` = `comment` + 1 "
													+ "WHERE `seq`=?;";
	
}
