package kr.co.farmstory1.bean;

//5�ܰ迡�� new��ü �����ϸ鼭 bean Ŭ������ ����� �ִ� ���̱�.

public class TermsBean {
	
	private String terms;
	private String privacy;

	// DBConfig dbcon = DBConfig.getInstance(); �̰� �̱��� ��ü �ҷ������~! 
	
	
	public String getTerms() {
		return terms;
	}
	
	public void setTerms(String terms) {
		this.terms = terms;
	}
	
	public String getPrivacy() {
		return privacy;
	}
	
	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}
}


	
	
	