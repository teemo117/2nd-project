package bean;

import java.sql.Date;

public class ReviewVO {
	int rCode; //리뷰코드
	Date rDate; //리뷰날짜
	String rContent; //리뷰내용
	String rImg; //리뷰이미지
	float rStar; //리뷰별점
	float rStarAverage; //리뷰별점평균
	String uID; //유저아이디
	int cCode; //강의코드
	
	public int getrCode() {
		return rCode;
	}
	public void setrCode(int rCode) {
		this.rCode = rCode;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getrImg() {
		return rImg;
	}
	public void setrImg(String rImg) {
		this.rImg = rImg;
	}
	public float getrStar() {
		return rStar;
	}
	public void setrStar(float rStar) {
		this.rStar = rStar;
	}
	public float getrStarAverage() {
		return rStarAverage;
	}
	public void setrStarAverage(float rStarAverage) {
		this.rStarAverage = rStarAverage;
	}
	public String getuID() {
		return uID;
	}
	public void setuID(String uID) {
		this.uID = uID;
	}
	public int getcCode() {
		return cCode;
	}
	public void setcCode(int cCode) {
		this.cCode = cCode;
	}
	
}
