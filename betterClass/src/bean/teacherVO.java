package bean;

public class teacherVO {
	   //private라고 쓰면, 이 클래스내에서만 변수에 접근해서 쓸 수 있음
	   private String tID;
	   private String tPW;
	   private String tName;
	   private String tBirth;
	   private String tGender;
	   private String tTel;
	   private String tAccNum;
	   private String tBankName;
	   private String tAccName;
	   
	   public String gettID() {
	      return tID;
	   }
	   public void settID(String tID) {
	      this.tID = tID;
	   }
	   public String gettPW() {
	      return tPW;
	   }
	   public void settPW(String tPW) {
	      this.tPW = tPW;
	   }
	   public String gettName() {
	      return tName;
	   }
	   public void settName(String tName) {
	      this.tName = tName;
	   }
	   public String gettBirth() {
	      return tBirth;
	   }
	   public void settBirth(String tBirth) {
	      this.tBirth = tBirth;
	   }
	   public String gettGender() {
	      return tGender;
	   }
	   public void settGender(String tGender) {
	      this.tGender = tGender;
	   }
	   public String gettTel() {
	      return tTel;
	   }
	   public void settTel(String tTel) {
	      this.tTel = tTel;
	   }
	   public String gettAccNum() {
	      return tAccNum;
	   }
	   public void settAccNum(String tAccNum) {
	      this.tAccNum = tAccNum;
	   }
	   public String gettBankName() {
	      return tBankName;
	   }
	   public void settBankName(String tBankName) {
	      this.tBankName = tBankName;
	   }
	   public String gettAccName() {
	      return tAccName;
	   }
	   public void settAccName(String tAccName) {
	      this.tAccName = tAccName;
	   }
	}
