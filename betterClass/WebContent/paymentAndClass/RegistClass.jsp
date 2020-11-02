<%@page import="java.sql.Time"%><%@page import="java.sql.Date"%><%@page import="bean.ClassDAO"%><%@page import="bean.ClassVO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%
ClassVO vo = new ClassVO();

String cInfo = request.getParameter("cInfo");
String cType = request.getParameter("cType");
String cAddr = request.getParameter("cAddress");
String cTitle = request.getParameter("cTitle");
String cCurriculum = request.getParameter("cCurriculum");
String cImg = request.getParameter("cImg");
String cLimit = request.getParameter("cLimit");
String cDate = request.getParameter("cDate");
String tCrt = request.getParameter("tCrt");
String[] cDateArr = cDate.split("-"); 
int year = Integer.parseInt(cDateArr[0])-1900;
int month = Integer.parseInt(cDateArr[1])-1;
int day = Integer.parseInt(cDateArr[2]);


String cTime = request.getParameter("cTime");
int cTime2 = Integer.parseInt(cTime);

String cDay = request.getParameter("cDay");
int cLimit2 = Integer.parseInt(cLimit);
String cPrice = request.getParameter("cPrice");
int cPrice2 = Integer.parseInt(cPrice);
String id = (String)session.getAttribute("teacherId");


Time time2 = new Time(cTime2, 0, 0); 
Date date2 = new Date(year,month,day);

vo.setcTitle(cTitle);
vo.setcType(cType);
vo.setcAddress(cAddr);
vo.setcInfo(cInfo);
vo.setcLimit(cLimit2);
vo.setcPrice(cPrice2);
vo.setcCurriculum(cCurriculum);
vo.setcImg(cImg);
vo.settID(id);
vo.setcDate(date2);
vo.setcTime(time2);
vo.setcDay(cDay);
vo.settCrt(tCrt);
ClassDAO dao = new ClassDAO();
boolean result = dao.create(vo);
String check = "다시 확인 바랍니다.";
if (result) {
	check = "완료";
}
%><%=check%>