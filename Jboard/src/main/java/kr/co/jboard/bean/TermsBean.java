package kr.co.jboard.bean;

//5�ܰ迡�� new��ü �����ϸ鼭 bean Ŭ������ ����� �ִ� ���̱�.

public class TermsBean {
	
	private String tearms;
	private String privacy;

	// DBConfig dbcon = DBConfig.getInstance(); �̰� �̱��� ��ü �ҷ������~! 
	
	
	public String getTearms() {
		return tearms;
	}
	
	public void setTearms(String tearms) {
		this.tearms = tearms;
	}
	
	public String getPrivacy() {
		return privacy;
	}
	
	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}
}


	
	
	