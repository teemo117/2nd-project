package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
	// 기능을 정의할 때는 메서드(함수)를 사용한다.
	Connection con;
	DBConnectionMgr dbcp;

	public ReviewDAO() throws Exception {
		dbcp = DBConnectionMgr.getInstance();
		/*
		 * // DB프로그램 절차에 맞게 코딩 // 1. connector 설정
		 * Class.forName("com.mysql.jdbc.Driver");
		 * System.out.println("1. connector 연결"); // 2. db연결 // String url
		 * "연결하는방법://ip:port/db명"; String url =
		 * "jdbc:mysql://localhost:3366/betterclass?useUnicode=true&characterEncoding=utf8";
		 * String user = "root"; String password = "1234"; con =
		 * DriverManager.getConnection(url, user, password);
		 * 
		 * System.out.println("2. db연결성공!");
		 */
	}
	
	
	public List<ReviewVO> reviewread() throws Exception {
		con = dbcp.getConnection();

		String sql = "select * from review";
		PreparedStatement ps = con.prepareStatement(sql);

		System.out.println("3. sql문 생성 성공");
		// 4. sql문을 mysql로 전송
		// select의 결과는 검색결과가 담긴 테이블이 온다.(항목+내용)
		// 내용이 없을수도 많을수도 있다.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql문 전송 성공");
		// 가방을 넣는 컨테이너 역할을 하게 됨.!
		// <>안에는 컨테이너에 무엇을 넣을지 지정!
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
			ReviewVO bag = new ReviewVO();
			// 가방에 넣기
			bag.setrCode(rs.getInt("rCode"));
			bag.setrDate(rs.getDate("rDate"));
			bag.setrContent(rs.getString("rContent"));
			bag.setrImg(rs.getString("rImg"));			
			bag.setrStar(rs.getFloat("rStar"));
			bag.setrStarAverage(rs.getFloat("rStarAverage"));
			bag.setuID(rs.getString("uID"));
			bag.setcCode(rs.getInt("cCode"));
			
			list.add(bag);
		}
		dbcp.freeConnection(con, ps, rs);
		return list;
	}
	
	
	
	
	
	
	
	
}
