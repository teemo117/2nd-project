package bean;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;

//CRUD 중심으로 기능을 정의
//데이터와 관련된 작업(Data Access object : DAO)
public class PaymentDAO {
	// 기능을 정의할 때는 메서드(함수)를 사용한다.
	Connection con;
	DBConnectionMgr dbcp;
	
	public PaymentDAO() throws Exception {
		dbcp = DBConnectionMgr.getInstance();
	}
	public boolean create(PaymentVO vo) throws Exception {
		con = dbcp.getConnection();
		String sql = "insert into payment(pBankName,pAccNum,pAccName,cTotalPrice,uID,cCode) values (?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("3. sql문 생성 성공");
		
		ps.setString(1, vo.getpBankName());
		ps.setString(2, vo.getpAccNum());
		ps.setString(3, vo.getpAccName());
		ps.setInt(4, vo.gettotalPrice());
		ps.setString(5, vo.getuID());
		ps.setInt(6, vo.getcCode());
		
		int row = ps.executeUpdate();
		System.out.println("4. sql전송 성공");
		boolean result = false;
		if (row == 1) {
			result = true;
		}
		dbcp.freeConnection(con, ps);
		return result;

	}
	public int read1(String uID) throws Exception {
		int cCode=0;
		con = dbcp.getConnection();
		String sql = "select * from class where cCode in (select cCode from payment where uID = ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("3. sql문 생성 성공");
		
		ps.setString(1, uID);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			cCode = rs.getInt("cCode");
		}
		dbcp.freeConnection(con, ps);
		return cCode;

	}
	/*
	 * public ArrayList<ClassVO> all(String cTitle) throws Exception { // 3. sql문을
	 * 만든다. con = dbcp.getConnection(); String sql =
	 * "select * from class where cTitle = ?"; PreparedStatement ps =
	 * con.prepareStatement(sql); ps.setString(1, cTitle);
	 * 
	 * // 4. sql문은 전송 ResultSet rs = ps.executeQuery();
	 * System.out.println("4. SQL문 전송 성공.!!"); ArrayList<ClassVO> list = new
	 * ArrayList<ClassVO>(); while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드 ClassVO
	 * bag = new ClassVO();// 가방만들어서, Date date = new
	 * Date(Long.parseLong(rs.getString("cData"))); Time time = new
	 * Time(Long.parseLong(rs.getString("cTime"))); bag.setcDate(date);
	 * bag.setcTime(time); bag.setcTitle(rs.getString("cTitle"));
	 * bag.setcType(rs.getString("cType")); bag.setcDay(rs.getString("cDay"));
	 * bag.setcLimit(rs.getInt("cLimit")); bag.setcInfo(rs.getString("cInfo"));
	 * bag.setcCurriculum(rs.getString("cCurriculum"));
	 * bag.setcAddress(rs.getString("cAddress"));
	 * bag.setcPrice(rs.getInt("cPrice")); bag.settCrt(rs.getString("tCrt"));
	 * 
	 * list.add(bag); } dbcp.freeConnection(con, ps, rs); return list; }
	 */
}