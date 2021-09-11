package vo;

public class CustomerVo {
	
	private int custid;
	private String name;
	private String address;
	private String phone;
	
	public int getCustid() {
		return custid;
	}
	
	public void setCustid(int custid) {
		this.custid = custid;
	}
	
	public void setCustid(String custid) {
		this.custid = Integer.parseInt(custid);
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	

}
