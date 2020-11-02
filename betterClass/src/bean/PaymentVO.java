package bean;

public class PaymentVO {
	private String pBankName; //은행
	private String pAccNum; //계좌번호
	private String pAccName; // 예금주
	private int cCode; //강좌코드
	private String uID; //유저아이디
	private int totalPrice;
	
	public int gettotalPrice() {
		return totalPrice;
	}
	public void settotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getpBankName() {
		return pBankName;
	}
	public void setpBankName(String pBankName) {
		this.pBankName = pBankName;
	}
	public String getpAccNum() {
		return pAccNum;
	}
	public void setpAccNum(String pAccNum) {
		this.pAccNum = pAccNum;
	}
	public String getpAccName() {
		return pAccName;
	}
	public void setpAccName(String pAccName) {
		this.pAccName = pAccName;
	}
	public int getcCode() {
		return cCode;
	}
	public void setcCode(int cCode) {
		this.cCode = cCode;
	}
	public String getuID() {
		return uID;
	}
	public void setuID(String uID) {
		this.uID = uID;
	}
	
}
