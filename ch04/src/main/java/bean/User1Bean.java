package bean; //DB확인해가면서 해야해



public class User1Bean {
	
	//변수 선언
	private String uid;
	private String name;
	private String hp;
	private int age;

	//각 변수의 게터,세터 선언
	//uid의 getter (get + 컨트롤 스페이스바)
	public String getUid() {
		return uid;
	}
	//uid의 setter 
	public void setUid(String uid) {
		this.uid = uid;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
}
