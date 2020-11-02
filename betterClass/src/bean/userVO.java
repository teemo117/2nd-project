package bean;

public class userVO {
	//private라고 쓰면, 이 클래스내에서만 변수에 접근해서 쓸 수 있음
	private String uID;
	private String uPW;
	private String uName;
	private String uBirth;
	private String uGender;
	private String uTel;
	//각 변수에 값을 넣는,빼는 메서드를 정의하면됨
	//가방에 넣을때는 set메서드로 정의 : setters
	//가방에서 꺼낼때는 get 메서드로 정의 : getters
	
	
	
	@Override
	public String toString() {
		return "userVO [uID=" + uID + ", uPW=" + uPW + ", uName=" + uName + ", uBirth=" + uBirth + ", uGender="
				+ uGender + ", uTel=" + uTel + "]";
	}
	public String getuID() {
		return uID;
	}
	public void setuID(String uID) {
		this.uID = uID;
	}
	public String getuPW() {
		return uPW;
	}
	public void setuPW(String uPW) {
		this.uPW = uPW;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuBirth() {
		return uBirth;
	}
	public void setuBirth(String uBirth) {
		this.uBirth = uBirth;
	}
	public String getuGender() {
		return uGender;
	}
	public void setuGender(String uGender) {
		this.uGender = uGender;
	}
	public String getuTel() {
		return uTel;
	}
	public void setuTel(String uTel) {
		this.uTel = uTel;
	}
	
	
	
	
	
}
