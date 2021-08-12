package kr.co.jboard.bean;

//5단계에서 new객체 생성하면서 bean 클래스를 만들어 주는 것이군.

public class TermsBean {
	
	private String tearms;
	private String privacy;

	// DBConfig dbcon = DBConfig.getInstance(); 이게 싱글톤 객체 불러오기다~! 
	
	
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


	
	
	