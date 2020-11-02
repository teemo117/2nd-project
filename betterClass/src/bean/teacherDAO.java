package bean;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//CRUD 중심으로 기능을 정의
//데이터와 관련된 작업(Data Access object : DAO)
public class teacherDAO {
	   // 기능을 정의할 때는 메서드(함수)를 사용한다.
	   Connection con;
	   DBConnectionMgr dbcp;

	   public teacherDAO() throws Exception {
	      dbcp = DBConnectionMgr.getInstance();
	   }

	   public boolean create(teacherVO vo) throws Exception {
	      con = dbcp.getConnection();
	      String sql = "insert into teacher values (?,?,?,?,?,?,?,?,?)";
	      PreparedStatement ps = con.prepareStatement(sql);
	      System.out.println("3. sql문 생성 성공");

	      // 4. sql문을 전송 , type에 따라서 setint ~ 웬만하면 setsting
	      ps.setString(1, vo.gettID());
	      ps.setString(2, vo.gettPW());
	      ps.setString(3, vo.gettName());
	      ps.setString(4, vo.gettBirth());
	      ps.setString(5, vo.gettGender());
	      ps.setString(6, vo.gettTel());
	      ps.setString(7, vo.gettAccNum());
	      ps.setString(8, vo.gettBankName());
	      ps.setString(9, vo.gettAccName());
	      
	      int row = ps.executeUpdate();
	      System.out.println("4. sql전송 성공");
	      
	      boolean result = false;
	      if (row == 1) {
	         result = true;
	      }
	      dbcp.freeConnection(con, ps);
	      return result;
	   }

	   // id 중복 체크
	   public boolean read(String tID) throws Exception {
	      con = dbcp.getConnection();
	      System.out.println(tID);
	      String sql = "select * from teacher where tID = ?";
	      PreparedStatement ps = con.prepareStatement(sql);
	      ps.setString(1, tID);
	      boolean result = false;
	      // 4. sql문을 전송 , type에 따라서 setint ~ 웬만하면 setsting
	      ResultSet rs = ps.executeQuery();
	      if (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
	         System.out.println("검색결과있음");
	         result = true; // 검색결과 있음
	         String id2 = rs.getString("id");
	         String pw = rs.getString("pw");
	         String name = rs.getString("name");
	         String birth = rs.getString("birth");
	         String gender = rs.getString("gender");
	         String tel = rs.getString("tel");
	      } else {
	         System.out.println("검색결과없음");
	      }
	      dbcp.freeConnection(con, ps, rs);
	      return result;
	   }
	   
	   // id, pw 맞는지 로그인 처리
	   public boolean read(String tID, String tPW) throws Exception {
	      con = dbcp.getConnection();
	      String sql = "select * from teacher where tID =  ? and tPW = ?";
	      PreparedStatement ps = con.prepareStatement(sql);
	      ps.setString(1, tID);
	      ps.setString(2, tPW);

	      System.out.println("3. sql문 생성 성공");
	      // 4. sql문을 전송 , type에 따라서 setint ~ 웬만하면 setsting
	      ResultSet rs = ps.executeQuery();
	      System.out.println("4. sql전송 성공");
	      boolean result = false;

	      if (rs.next() == true) { // 결과가 있는지 없는지 체크해주는 메서드
	         System.out.println("로그인ok");
	         result = true; // 검색결과 있음
	      } else {
	         System.out.println("로그인not");
	      }
	      dbcp.freeConnection(con, ps, rs);
	      return result;
	      // false면 로그인not
	      // true면 로그인ok
	   }
	   
	   // id, pw 맞는지 로그인 처리
	   public boolean read(teacherVO vo) throws Exception {
	      con = dbcp.getConnection();
	      String sql = "select * from teacher where tID =  ? and tPW = ?";
	      PreparedStatement ps = con.prepareStatement(sql);
	      ps.setString(1, vo.gettID());
	      ps.setString(2, vo.gettPW());
	      
	      System.out.println("3. sql문 생성 성공");
	      // 4. sql문을 전송 , type에 따라서 setint ~ 웬만하면 setsting
	      ResultSet rs = ps.executeQuery();
	      System.out.println("4. sql전송 성공");
	      boolean result = false;
	      
	      if (rs.next() == true) { // 결과가 있는지 없는지 체크해주는 메서드
	         System.out.println("로그인ok");
	         result = true; // 검색결과 있음
	      } else {
	         System.out.println("로그인not");
	      }
	      dbcp.freeConnection(con, ps, rs);
	      return result;
	      // false면 로그인not
	      // true면 로그인ok
	   }

	   public boolean update(teacherVO vo) throws Exception {
	      con = dbcp.getConnection();
	      // 3. sql문을 만든다.(create)
	      String sql = "update teacher set tPW = ?, tName = ?, tBirth=?, tGender=?, tTel = ?, tAccNum =?, tBankName=?, tAccName=? where tID = ?";
	      PreparedStatement ps = con.prepareStatement(sql);
	      ps.setString(1, vo.gettPW());
	      ps.setString(2, vo.gettName());
	      ps.setString(3, vo.gettBirth());
	      ps.setString(4, vo.gettGender());
	      ps.setString(5, vo.gettTel());
	      ps.setString(6, vo.gettAccNum());
	      ps.setString(7, vo.gettBankName());
	      ps.setString(8, vo.gettAccName());
	      ps.setString(9, vo.gettID());
	      System.out.println("3. SQL생성 성공.!!");

	      // 4. sql문은 전송
	      int row = ps.executeUpdate();
	      System.out.println("4. SQL문 전송 성공.!!");
	      boolean result = false;
	      if (row == 1) {
	         result = true;
	      }
	      dbcp.freeConnection(con, ps);
	      return result;
	   }

	   public boolean delete(String tID) throws Exception {
	      con = dbcp.getConnection();
	      // 3. sql 문작성
	      String sql = "delete from teacher where tID = (?)";
	      PreparedStatement ps = con.prepareStatement(sql);
	      System.out.println("3. sql문 생성 성공");
	      ps.setString(1, tID);
	      int row = ps.executeUpdate();
	      System.out.println("4. sql문 전송 성공");
	      boolean result = false;
	      if (row == 1) {
	         result = true;
	      }
	      dbcp.freeConnection(con, ps);
	      return result;

	   }
	   
	   public teacherVO getTeacherInfo(String teacherId) throws Exception {
	      con = dbcp.getConnection();
	      String sql = "select tID, tName, tBirth, tGender, tTel, tAccNum, tBankName, tAccName from teacher where tID =  ?";
	      PreparedStatement ps = con.prepareStatement(sql);
	      ps.setString(1, teacherId);
	      System.out.println("3. sql문 생성 성공");
	      int result = 0;
	      ResultSet rs = ps.executeQuery();
	      
	      teacherVO vo = new teacherVO(); // 가방만들어서
	      
	      if (rs.next() == true) { // 결과가 있는지 없는지 체크해주는 메서드
	         System.out.println("검색결과있음");
	         String tID = rs.getString("tID");
	         String tName = rs.getString("tName");
	         String tBirth = rs.getString("tBirth");
	         String tGender = rs.getString("tGender");
	         String tTel = rs.getString("tTel");
	         String tAccNum = rs.getString("tAccNum");
	         String tBankName = rs.getString("tBankName");
	         String tAccName = rs.getString("tAccName");
	         vo.settID(tID);
	         vo.settName(tName);
	         vo.settBirth(tBirth);
	         vo.settGender(tGender);
	         vo.settTel(tTel);
	         vo.settAccNum(tAccNum);
	         vo.settBankName(tBankName);
	         vo.settAccName(tAccName);
	      } else {
	         System.out.println("검색결과없음");
	      }
	      dbcp.freeConnection(con, ps, rs);
	      return vo;
	   }

	}
