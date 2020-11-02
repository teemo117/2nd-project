<%@page import="bean.PaymentVO"%><%@page import="bean.ClassVO"%><%@page import="bean.ClassDAO"%><%@page import="bean.PaymentDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%
PaymentVO vo = new PaymentVO();
PaymentDAO dao = new PaymentDAO();
ClassDAO cDao = new ClassDAO();
ClassVO cVo = new ClassVO();
//paymentVO
String uID = request.getParameter("uID");
String pBankName = request.getParameter("pBankName");
String pAccNum = request.getParameter("pAccNum");
String pAccName = request.getParameter("pAccName");
String totalPrice = request.getParameter("totalPrice");
int totalPrice2 = Integer.parseInt(totalPrice);
String cCode = request.getParameter("cCode");
int cCode2 = Integer.parseInt(cCode);
//classVO
String numOfRegist = request.getParameter("numOfRegist"); // class 로 넘기기
int numOfRegist2 = Integer.parseInt(numOfRegist);
//paymentVO 셋팅
vo.setcCode(cCode2);
vo.setuID(uID);
vo.setpBankName(pBankName);
vo.setpAccNum(pAccNum);
vo.setpAccName(pAccName);
vo.settotalPrice(totalPrice2);
//classVO셋팅
cVo.setcCode(cCode2);
cVo.setcNumOfRegist(numOfRegist2);
//결과값
boolean result = dao.create(vo);
boolean result2 = cDao.create2(cVo);
String check = "not";
if (result == true && result2 == true) {
	check = "true";
}
%><%=check%>