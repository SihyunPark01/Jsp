package kr.co.farmstory1.db;

public class Sql {
	
	
	//Sql���� ��Ƶα� ���� SqlŬ������ �������, �������̱� ������ static final�� ������. ������ �빮�ڷ� �ٽ� ���������, ���� jsp���Ͽ���
	//sql���� �����ؿ�. ��� ���� jsp���Ͽ��� Sql(Ŭ������).SELECT_TERMS(������)�̷������� �������ֱ�.
	//����� ����
	public static final String SELECT_TERMS = "SELECT * FROM `Jboard_terms`;";
														//			?�ڸ����� uid�� pass �����͸� ������ 
	public static final String SELECT_MEMBER = "SELECT * FROM `Jboard_member` WHERE `uid`=? AND `pass`=PASSWORD(?);";
	
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
	
	
//	public static final String INSERT_ARTICLE = "INSERT INTO `Jboard_article` SET "
//	//		 +"`seq`=?,"  				
//	//		 +"`parent`?," 		��״� ��� default��
//	//		 +"`comment`=?,"
//	//		 +"`cate`=?,"
//			 +"`title`=?,"
//			 +"`content`=?,"		//grade�� default�� 2�� ����
//	//		 +"`file`=?,"  			//�׳� 0���� �ѰŶ�
//	//		 +"`hit`=?,"			//�׳� 0���� �ѰŶ�
//			 +"`uid`=?,"
//			 +"`regip`=?," 
//			 +"`rdate`=NOW();";
	
	
	
	public static final String SELECT_COUNT_UID   = "SELECT COUNT(`uid`) 	FROM `Jboard_member` WHERE `uid`=?;";
	public static final String SELECT_COUNT_NICK  = "SELECT COUNT(`nick`) 	FROM `Jboard_member` WHERE `nick`=?;"; //select���� countȰ�� 1�̸� 1������, 0�̸� ����
	public static final String SELECT_COUNT_HP 	  = "SELECT COUNT(`hp`) 	FROM `Jboard_member` WHERE `hp`=?;";
	public static final String SELECT_COUNT_EMAIL = "SELECT COUNT(`email`) 	FROM `Jboard_member` WHERE `email`=?;";
	
	
	//�Խ��� ����
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(`seq`) FROM `Jboard_article` WHERE `parent`=0 AND `cate`=?";
	
	public static final String SELECT_LATEST = "SELECT `seq`,`title`,`rdate` FROM `Jboard_article` "
												+ "WHERE `cate`=? AND `parent`=0 "
												+ "ORDER BY `seq` "
												+ "DESC LIMIT 5";
	
	public static final String SELECT_MAX_SEQ = "SELECT MAX(`seq`) FROM `Jboard_article`;";	

	public static final String SELECT_FILE = "SELECT * FROM `Jboard_file` WHERE `fseq`=?";	
	
	public static final String SELECT_ARTICLE = "SELECT * FROM `Jboard_article` AS a "
												+ "	LEFT JOIN `Jboard_file` AS b ON a.seq = b.parent "
												+ "WHERE `seq`=?;";
	//left join�� �� ��������. left�� �⺻������ ���;��ҳ��� �ְ� �����ʿ��� �������̺�(������ ÷�εɼ��� �ְ� �������� �����ϱ�)
	//�ᱹ�� �������� ����. �������� �߿��ϳ�.
	
	
	public static final String SELECT_ARTICLES = "SELECT a.*, b.nick FROM `Jboard_article` AS a "
												+ "JOIN `Jboard_member` AS b "
												+ "ON a.uid = b.uid "
												+ "WHERE `parent`=0 AND `cate`=? "  //��� �ƴѱ۸� ��ȸ�Ǿ�� �ϹǷ� ���Ǵ޾���.
												+ "ORDER BY `seq` DESC "
												+ "LIMIT ?, 10; ";
												
	public static final String SELECT_COMMENTS = "SELECT a.*, b.nick FROM `Jboard_article` AS a "
												+ "JOIN `Jboard_member` AS b "
												+ "ON a.uid = b.uid "
												+ "WHERE `parent`=? "
												+ "ORDER BY `seq` ASC;";
	
	
	public static final String INSERT_ARTICLE = "INSERT INTO `Jboard_article` SET "
												+ "`cate`=?,"
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
									
	public static final String UPDATE_ARTICLE = "UPDATE `Jboard_article` SET "
											+ "`title`=?,"
											+ "`content`=? "
											+ "WHERE `seq`=?";
									
	public static final String UPDATE_ARTICLE_HIT = "UPDATE `Jboard_article` SET `hit` = `hit` + 1 "
													+ "WHERE `seq`=?;";
	
	
	public static final String UPDATE_COMMENT_COUNT_PLUS = "UPDATE `Jboard_article` SET `comment` = `comment` + 1 "
													+ "WHERE `seq`=?;";
	
	public static final String UPDATE_COMMENT_COUNT_MINUS = "UPDATE `Jboard_article` SET `comment` = `comment` - 1 "
													+ "WHERE `seq`=?;";
	
	public static final String UPDATE_COMMENT = "UPDATE `Jboard_article` SET `content`=? WHERE `seq`=?";

	public static final String UPDATE_FILE_DOWNLOAD = "UPDATE `Jboard_file` SET `download`= `download`+1 WHERE `seq`=?";
	
	public static final String DELETE_ARTICLE = "DELETE FROM `Jboard_article` WHERE `seq`=?";
	
	public static final String DELETE_COMMENT = "DELETE FROM `Jboard_article` WHERE `seq`=?";
	
	
}