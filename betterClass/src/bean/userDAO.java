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
public class userDAO {
	// 기능을 정의할 때는 메서드(함수)를 사용한다.
	Connection con;
	DBConnectionMgr dbcp;
	public userDAO() throws Exception {
		dbcp = DBConnectionMgr.getInstance();
	}

	public boolean create(userVO vo) throws Exception {
		// DB프로그램 절차에 맞게 코딩
		// 3. sql문을 만든다
		con = dbcp.getConnection();
		String sql = "insert into user values (?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("3. sql문 생성 성공");

		// 4. sql문을 전송 , type에 따라서 setint ~ 웬만하면 setsting
		ps.setString(1, vo.getuID());
		ps.setString(2, vo.getuPW());
		ps.setString(3, vo.getuName());
		ps.setString(4, vo.getuBirth());
		ps.setString(5, vo.getuGender());
		ps.setString(6, vo.getuTel());
		
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
	public boolean read(String id) throws Exception {
		con = dbcp.getConnection();
		System.out.println(id);
		String sql = "select * from user where uID = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		boolean result = false;
		// 4. sql문을 전송 , type에 따라서 setint ~ 웬만하면 setsting
		ResultSet rs = ps.executeQuery();
		if (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
			System.out.println("검색결과있음");
			result = true; // 검색결과 있음
			String id2 = rs.getString("uID");
			String pw = rs.getString("uPW");
			String name = rs.getString("uName");
			String birth = rs.getString("uBirth");
			String gender = rs.getString("uGender");
			String tel = rs.getString("uTel");
//			System.out.println("검색결과 : " + id2);
//			System.out.println("검색결과 : " + pw2);
//			System.out.println("검색결과 : " + name2);
//			System.out.println("검색결과 : " + tel2);

		} else {
			System.out.println("검색결과없음");
		}
		dbcp.freeConnection(con, ps, rs);
		return result;
		// 0이 넘어가면 검색결과 x
		// 1이 넘어가면 검색결과 o

	}
	
	// id, pw 맞는지 로그인 처리
	public boolean read(userVO vo) throws Exception {
		con = dbcp.getConnection();
		String sql = "select * from user where uID =  ? and uPW = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, vo.getuID());
		ps.setString(2, vo.getuPW());
		
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

	public boolean update(userVO vo) throws Exception {
		// 3. sql문을 만든다.(create)
		con = dbcp.getConnection();
		String sql = "update user set uPW = ?, uName = ?, uBirth=?, uGender=?, uTel = ? where uID = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, vo.getuPW());
		ps.setString(2, vo.getuName());
		ps.setString(3, vo.getuBirth());
		ps.setString(4, vo.getuGender());
		ps.setString(5, vo.getuTel());
		ps.setString(6, vo.getuID());
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

	public boolean delete(String id) throws Exception {
		con = dbcp.getConnection();
		// 3. sql 문작성
		String sql = "delete from user where uID = (?)";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("3. sql문 생성 성공");
		ps.setString(1, id);
		int row = ps.executeUpdate();
		System.out.println("4. sql문 전송 성공");
		ps.close();
		con.close();
		boolean result = false;
		if (row == 1) {
			result = true;
		}
		dbcp.freeConnection(con, ps);
		return result;

	}
	
	//유저 아이디관련 정보 가져오는 메서드
	public userVO getUserInfo(String userId) throws Exception {
		con = dbcp.getConnection();
		String sql = "select uID, uName, uBirth, uGender, uTel from user where uID =  ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, userId);
		System.out.println("3. sql문 생성 성공");
		int result = 0;
		ResultSet rs = ps.executeQuery();
		
		userVO vo = new userVO(); // 가방만들어서
		
		if (rs.next() == true) { // 결과가 있는지 없는지 체크해주는 메서드
			System.out.println("검색결과있음");
			String id = rs.getString("uID");
			String name = rs.getString("uName");
			String birth = rs.getString("uBirth");
			String gender = rs.getString("uGender");
			String tel = rs.getString("uTel");
			vo.setuID(id);
			vo.setuName(name);
			vo.setuBirth(birth);
			vo.setuGender(gender);
			vo.setuTel(tel);
		} else {
			System.out.println("검색결과없음");
		}
		dbcp.freeConnection(con, ps, rs);
		return vo;
	}

}
