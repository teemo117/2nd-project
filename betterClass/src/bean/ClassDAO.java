package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

public class ClassDAO {
	// 기능을 정의할 때는 메서드(함수)를 사용한다.
	Connection con;
	DBConnectionMgr dbcp;
	static int cNumOfRegist = 0;
	
	public ClassDAO() throws Exception {
		dbcp = DBConnectionMgr.getInstance();
	}

	// main 인기강좌 목록
	public List<ClassVO> bestread() throws Exception {
		con = dbcp.getConnection();
		String sql = "select * from class";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("3. sql문 생성 성공");
		// 4. sql문을 mysql로 전송
		// select의 결과는 검색결과가 담긴 테이블이 온다.(항목+내용)
		// 내용이 없을수도 많을수도 있다.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql문 전송 성공");
		// 가방을 넣는 컨테이너 역할을 하게 됨.!
		// <>안에는 컨테이너에 무엇을 넣을지 지정!
		List<ClassVO> list = new ArrayList<ClassVO>();
		while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
			ClassVO bag = new ClassVO();
			// 가방에 넣기
			bag.setcCode(rs.getInt("cCode"));
			bag.setcTitle(rs.getString("cTitle"));
			bag.setcType(rs.getString("cType"));
			
			bag.setcDate(rs.getDate("cDate"));
			bag.setcDay(rs.getString("cDay"));
			bag.setcTime(rs.getTime("cTime"));
			
			bag.setcAddress(rs.getString("cAddress"));
			bag.setcInfo(rs.getString("cInfo"));
			bag.setcCurriculum(rs.getString("cCurriculum"));
			
			bag.setcLimit(rs.getInt("cLimit"));
			bag.setcPrice(rs.getInt("cPrice"));
			bag.setcImg(rs.getString("cImg"));
			
			bag.settID(rs.getString("tID"));
			bag.settCrt(rs.getString("tCrt"));;
			bag.setcNumOfRegist(rs.getInt("cNumOfRegist"));

			
			list.add(bag);
		}
		dbcp.freeConnection(con, ps, rs);
		return list;
	}

	// main 최신강좌 목록
	public List<ClassVO> recentread() throws Exception {
		con = dbcp.getConnection();

		String sql = "select * from class order by cCode desc";
		PreparedStatement ps = con.prepareStatement(sql);

		System.out.println("3. sql문 생성 성공");
		// 4. sql문을 mysql로 전송
		// select의 결과는 검색결과가 담긴 테이블이 온다.(항목+내용)
		// 내용이 없을수도 많을수도 있다.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql문 전송 성공");
		// 가방을 넣는 컨테이너 역할을 하게 됨.!
		// <>안에는 컨테이너에 무엇을 넣을지 지정!
		List<ClassVO> list = new ArrayList<ClassVO>();
		while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
			ClassVO bag = new ClassVO();
			// 가방에 넣기
			bag.setcCode(rs.getInt("cCode"));
			bag.setcTitle(rs.getString("cTitle"));
			bag.setcType(rs.getString("cType"));
			
			bag.setcDate(rs.getDate("cDate"));
			bag.setcDay(rs.getString("cDay"));
			bag.setcTime(rs.getTime("cTime"));
			
			bag.setcAddress(rs.getString("cAddress"));
			bag.setcInfo(rs.getString("cInfo"));
			bag.setcCurriculum(rs.getString("cCurriculum"));
			
			bag.setcLimit(rs.getInt("cLimit"));
			bag.setcPrice(rs.getInt("cPrice"));
			bag.setcImg(rs.getString("cImg"));
			
			bag.settID(rs.getString("tID"));
			bag.settCrt(rs.getString("tCrt"));;
			bag.setcNumOfRegist(rs.getInt("cNumOfRegist"));

			list.add(bag);
		}

		dbcp.freeConnection(con, ps, rs);

		return list;
	}

	//전체 리스트 - 페이징처리
	public List<ClassVO> bestread(int StratNum, int LastNum) throws Exception {
		con = dbcp.getConnection();

		String sql = "select * from class where cCode BETWEEN "+StratNum+" AND "+LastNum;
		PreparedStatement ps = con.prepareStatement(sql);

		System.out.println("3. sql문 생성 성공");
		// 4. sql문을 mysql로 전송
		// select의 결과는 검색결과가 담긴 테이블이 온다.(항목+내용)
		// 내용이 없을수도 많을수도 있다.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql문 전송 성공");
		// 가방을 넣는 컨테이너 역할을 하게 됨.!
		// <>안에는 컨테이너에 무엇을 넣을지 지정!
		List<ClassVO> list = new ArrayList<ClassVO>();
		while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
			ClassVO bag = new ClassVO();
			// 가방에 넣기
			bag.setcCode(rs.getInt("cCode"));
			bag.setcTitle(rs.getString("cTitle"));
			bag.setcType(rs.getString("cType"));
			
			bag.setcDate(rs.getDate("cDate"));
			bag.setcDay(rs.getString("cDay"));
			bag.setcTime(rs.getTime("cTime"));
			
			bag.setcAddress(rs.getString("cAddress"));
			bag.setcInfo(rs.getString("cInfo"));
			bag.setcCurriculum(rs.getString("cCurriculum"));
			
			bag.setcLimit(rs.getInt("cLimit"));
			bag.setcPrice(rs.getInt("cPrice"));
			bag.setcImg(rs.getString("cImg"));
			
			bag.settID(rs.getString("tID"));
			bag.settCrt(rs.getString("tCrt"));;
			bag.setcNumOfRegist(rs.getInt("cNumOfRegist"));

			list.add(bag);
		}
		dbcp.freeConnection(con, ps, rs);
		return list;
	}
	
	
	// 카테고리별 강좌 목록
	public List<ClassVO> typeread(String find) throws Exception {
		con = dbcp.getConnection();

		String sql = "select * from class where cType like '" + find + "%'";
		PreparedStatement ps = con.prepareStatement(sql);

		System.out.println("3. sql문 생성 성공");
		// 4. sql문을 mysql로 전송
		// select의 결과는 검색결과가 담긴 테이블이 온다.(항목+내용)
		// 내용이 없을수도 많을수도 있다.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql문 전송 성공");
		// 가방을 넣는 컨테이너 역할을 하게 됨.!
		// <>안에는 컨테이너에 무엇을 넣을지 지정!
		List<ClassVO> list = new ArrayList<ClassVO>();
		while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
			ClassVO bag = new ClassVO();
			// 가방에 넣기
			bag.setcCode(rs.getInt("cCode"));
			bag.setcTitle(rs.getString("cTitle"));
			bag.setcType(rs.getString("cType"));
			
			bag.setcDate(rs.getDate("cDate"));
			bag.setcDay(rs.getString("cDay"));
			bag.setcTime(rs.getTime("cTime"));
			
			bag.setcAddress(rs.getString("cAddress"));
			bag.setcInfo(rs.getString("cInfo"));
			bag.setcCurriculum(rs.getString("cCurriculum"));
			
			bag.setcLimit(rs.getInt("cLimit"));
			bag.setcPrice(rs.getInt("cPrice"));
			bag.setcImg(rs.getString("cImg"));
			
			bag.settID(rs.getString("tID"));
			bag.settCrt(rs.getString("tCrt"));;
			bag.setcNumOfRegist(rs.getInt("cNumOfRegist"));

			list.add(bag);
		}

		dbcp.freeConnection(con, ps, rs);

		return list;
	}
	
	//타입별 9개씩 가져오기
	public List<ClassVO> typeread(String find, int OffsetNum ) throws Exception {
		con = dbcp.getConnection();

		String sql = "select * from class where cType like '" + find + "%' limit 9 OFFSET " + OffsetNum;
		PreparedStatement ps = con.prepareStatement(sql);

		System.out.println("3. sql문 생성 성공");
		// 4. sql문을 mysql로 전송
		// select의 결과는 검색결과가 담긴 테이블이 온다.(항목+내용)
		// 내용이 없을수도 많을수도 있다.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql문 전송 성공");
		// 가방을 넣는 컨테이너 역할을 하게 됨.!
		// <>안에는 컨테이너에 무엇을 넣을지 지정!
		List<ClassVO> list = new ArrayList<ClassVO>();
		while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
			ClassVO bag = new ClassVO();
			// 가방에 넣기
			bag.setcCode(rs.getInt("cCode"));
			bag.setcTitle(rs.getString("cTitle"));
			bag.setcType(rs.getString("cType"));
			
			bag.setcDate(rs.getDate("cDate"));
			bag.setcDay(rs.getString("cDay"));
			bag.setcTime(rs.getTime("cTime"));
			
			bag.setcAddress(rs.getString("cAddress"));
			bag.setcInfo(rs.getString("cInfo"));
			bag.setcCurriculum(rs.getString("cCurriculum"));
			
			bag.setcLimit(rs.getInt("cLimit"));
			bag.setcPrice(rs.getInt("cPrice"));
			bag.setcImg(rs.getString("cImg"));
			
			bag.settID(rs.getString("tID"));
			bag.settCrt(rs.getString("tCrt"));;
			bag.setcNumOfRegist(rs.getInt("cNumOfRegist"));

			list.add(bag);
		}

		dbcp.freeConnection(con, ps, rs);

		return list;
	}


	// 전체 요일별, 시간별 강좌 목록
	public List<ClassVO> conditionread(String day, String time) throws Exception {
		con = dbcp.getConnection();

		String sql = "select * from class where cDay = ? and  cTime >= '"+ time +":00:00'";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, day);


		System.out.println("3. sql문 생성 성공");
		// 4. sql문을 mysql로 전송
		// select의 결과는 검색결과가 담긴 테이블이 온다.(항목+내용)
		// 내용이 없을수도 많을수도 있다.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql문 전송 성공");
		// 가방을 넣는 컨테이너 역할을 하게 됨.!
		// <>안에는 컨테이너에 무엇을 넣을지 지정!
		List<ClassVO> list = new ArrayList<ClassVO>();
		while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
			ClassVO bag = new ClassVO();
			// 가방에 넣기
			bag.setcCode(rs.getInt("cCode"));
			bag.setcTitle(rs.getString("cTitle"));
			bag.setcType(rs.getString("cType"));
			
			bag.setcDate(rs.getDate("cDate"));
			bag.setcDay(rs.getString("cDay"));
			bag.setcTime(rs.getTime("cTime"));
			
			bag.setcAddress(rs.getString("cAddress"));
			bag.setcInfo(rs.getString("cInfo"));
			bag.setcCurriculum(rs.getString("cCurriculum"));
			
			bag.setcLimit(rs.getInt("cLimit"));
			bag.setcPrice(rs.getInt("cPrice"));
			bag.setcImg(rs.getString("cImg"));
			
			bag.settID(rs.getString("tID"));
			bag.settCrt(rs.getString("tCrt"));;
			bag.setcNumOfRegist(rs.getInt("cNumOfRegist"));

			list.add(bag);
		}

		dbcp.freeConnection(con, ps, rs);

		return list;
	}
	
	// 전체 요일별, 시간별 강좌 9개 
	public List<ClassVO> conditionread(String day, String time, int OffsetNum) throws Exception {
		con = dbcp.getConnection();
		
		String sql = "select * from class where cDay = ? and  cTime >= '"+ time +":00:00' limit 9 OFFSET " + OffsetNum;
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, day);
		
		
		System.out.println("3. sql문 생성 성공");
		// 4. sql문을 mysql로 전송
		// select의 결과는 검색결과가 담긴 테이블이 온다.(항목+내용)
		// 내용이 없을수도 많을수도 있다.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql문 전송 성공");
		// 가방을 넣는 컨테이너 역할을 하게 됨.!
		// <>안에는 컨테이너에 무엇을 넣을지 지정!
		List<ClassVO> list = new ArrayList<ClassVO>();
		while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
			ClassVO bag = new ClassVO();
			// 가방에 넣기
			bag.setcCode(rs.getInt("cCode"));
			bag.setcTitle(rs.getString("cTitle"));
			bag.setcType(rs.getString("cType"));
			
			bag.setcDate(rs.getDate("cDate"));
			bag.setcDay(rs.getString("cDay"));
			bag.setcTime(rs.getTime("cTime"));
			
			bag.setcAddress(rs.getString("cAddress"));
			bag.setcInfo(rs.getString("cInfo"));
			bag.setcCurriculum(rs.getString("cCurriculum"));
			
			bag.setcLimit(rs.getInt("cLimit"));
			bag.setcPrice(rs.getInt("cPrice"));
			bag.setcImg(rs.getString("cImg"));
			
			bag.settID(rs.getString("tID"));
			bag.settCrt(rs.getString("tCrt"));;
			bag.setcNumOfRegist(rs.getInt("cNumOfRegist"));

			list.add(bag);
		}
		
		dbcp.freeConnection(con, ps, rs);
		
		return list;
	}
	
	// 카테고리별 요일, 시간 강좌 목록
	public List<ClassVO> conditionread(String find, String day, String time) throws Exception {
		con = dbcp.getConnection();
		
		String sql = "select * from class where cType like '" + find + "%' and cDay =? and cTime >= '"+ time +":00:00'";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, day);

		System.out.println("3. sql문 생성 성공");
		// 4. sql문을 mysql로 전송
		// select의 결과는 검색결과가 담긴 테이블이 온다.(항목+내용)
		// 내용이 없을수도 많을수도 있다.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql문 전송 성공");
		// 가방을 넣는 컨테이너 역할을 하게 됨.!
		// <>안에는 컨테이너에 무엇을 넣을지 지정!
		List<ClassVO> list = new ArrayList<ClassVO>();
		while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
			ClassVO bag = new ClassVO();
			// 가방에 넣기
			bag.setcCode(rs.getInt("cCode"));
			bag.setcTitle(rs.getString("cTitle"));
			bag.setcType(rs.getString("cType"));
			
			bag.setcDate(rs.getDate("cDate"));
			bag.setcDay(rs.getString("cDay"));
			bag.setcTime(rs.getTime("cTime"));
			
			bag.setcAddress(rs.getString("cAddress"));
			bag.setcInfo(rs.getString("cInfo"));
			bag.setcCurriculum(rs.getString("cCurriculum"));
			
			bag.setcLimit(rs.getInt("cLimit"));
			bag.setcPrice(rs.getInt("cPrice"));
			bag.setcImg(rs.getString("cImg"));
			
			bag.settID(rs.getString("tID"));
			bag.settCrt(rs.getString("tCrt"));;
			bag.setcNumOfRegist(rs.getInt("cNumOfRegist"));

			list.add(bag);
		}
		
		dbcp.freeConnection(con, ps, rs);
		
		return list;
	}
	
	// 카테고리별 요일, 시간 강좌 9개 목록
	public List<ClassVO> conditionread(String find, String day, String time, int OffsetNum) throws Exception {
		con = dbcp.getConnection();
		
		String sql = "select * from class where cType like '" + find + "%' and cDay =? and cTime >= '"+ time +":00:00' limit 9 OFFSET " + OffsetNum;
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, day);
		
		System.out.println("3. sql문 생성 성공");
		// 4. sql문을 mysql로 전송
		// select의 결과는 검색결과가 담긴 테이블이 온다.(항목+내용)
		// 내용이 없을수도 많을수도 있다.
		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql문 전송 성공");
		// 가방을 넣는 컨테이너 역할을 하게 됨.!
		// <>안에는 컨테이너에 무엇을 넣을지 지정!
		List<ClassVO> list = new ArrayList<ClassVO>();
		while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
			ClassVO bag = new ClassVO();
			// 가방에 넣기
			bag.setcCode(rs.getInt("cCode"));
			bag.setcTitle(rs.getString("cTitle"));
			bag.setcType(rs.getString("cType"));
			
			bag.setcDate(rs.getDate("cDate"));
			bag.setcDay(rs.getString("cDay"));
			bag.setcTime(rs.getTime("cTime"));
			
			bag.setcAddress(rs.getString("cAddress"));
			bag.setcInfo(rs.getString("cInfo"));
			bag.setcCurriculum(rs.getString("cCurriculum"));
			
			bag.setcLimit(rs.getInt("cLimit"));
			bag.setcPrice(rs.getInt("cPrice"));
			bag.setcImg(rs.getString("cImg"));
			
			bag.settID(rs.getString("tID"));
			bag.settCrt(rs.getString("tCrt"));;
			bag.setcNumOfRegist(rs.getInt("cNumOfRegist"));

			list.add(bag);
		}
		
		dbcp.freeConnection(con, ps, rs);
		
		return list;
	}

	// 검색 목록
			public List<ClassVO> searchread(String find) throws Exception {
				con = dbcp.getConnection();
				
				String sql = "select * from class where cTitle like '%" + find + "%' or cType like '%" + find + 
						"%' or cDay like '%" + find + "%' or cAddress like '%" + find + "%' or cInfo like '%" + find + "%'";
				PreparedStatement ps = con.prepareStatement(sql);

				System.out.println("3. sql문 생성 성공");
				// 4. sql문을 mysql로 전송
				// select의 결과는 검색결과가 담긴 테이블이 온다.(항목+내용)
				// 내용이 없을수도 많을수도 있다.
				ResultSet rs = ps.executeQuery();
				System.out.println("4. sql문 전송 성공");
				// 가방을 넣는 컨테이너 역할을 하게 됨.!
				// <>안에는 컨테이너에 무엇을 넣을지 지정!
				List<ClassVO> list = new ArrayList<ClassVO>();
				while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
					ClassVO bag = new ClassVO();
					// 가방에 넣기
					bag.setcCode(rs.getInt("cCode"));
					bag.setcTitle(rs.getString("cTitle"));
					bag.setcType(rs.getString("cType"));
					
					bag.setcDate(rs.getDate("cDate"));
					bag.setcDay(rs.getString("cDay"));
					bag.setcTime(rs.getTime("cTime"));
					
					bag.setcAddress(rs.getString("cAddress"));
					bag.setcInfo(rs.getString("cInfo"));
					bag.setcCurriculum(rs.getString("cCurriculum"));
					
					bag.setcLimit(rs.getInt("cLimit"));
					bag.setcPrice(rs.getInt("cPrice"));
					bag.setcImg(rs.getString("cImg"));
					
					bag.settID(rs.getString("tID"));
					bag.settCrt(rs.getString("tCrt"));;
					bag.setcNumOfRegist(rs.getInt("cNumOfRegist"));

					list.add(bag);
				}
				
				dbcp.freeConnection(con, ps, rs);
				
				return list;
			}
	// 검색 목록
		public List<ClassVO> searchread(String find, int OffsetNum) throws Exception {
			con = dbcp.getConnection();
			
			String sql = "select * from class where cTitle like '%" + find + "%' or cType like '%" + find + 
					"%' or cDay like '%" + find + "%' or cAddress like '%" + find + "%' or cInfo like '%" + find + "%' limit 9 OFFSET " + OffsetNum;
			PreparedStatement ps = con.prepareStatement(sql);

			System.out.println("3. sql문 생성 성공");
			// 4. sql문을 mysql로 전송
			// select의 결과는 검색결과가 담긴 테이블이 온다.(항목+내용)
			// 내용이 없을수도 많을수도 있다.
			ResultSet rs = ps.executeQuery();
			System.out.println("4. sql문 전송 성공");
			// 가방을 넣는 컨테이너 역할을 하게 됨.!
			// <>안에는 컨테이너에 무엇을 넣을지 지정!
			List<ClassVO> list = new ArrayList<ClassVO>();
			while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
				ClassVO bag = new ClassVO();
				// 가방에 넣기
				bag.setcCode(rs.getInt("cCode"));
				bag.setcTitle(rs.getString("cTitle"));
				bag.setcType(rs.getString("cType"));
				
				bag.setcDate(rs.getDate("cDate"));
				bag.setcDay(rs.getString("cDay"));
				bag.setcTime(rs.getTime("cTime"));
				
				bag.setcAddress(rs.getString("cAddress"));
				bag.setcInfo(rs.getString("cInfo"));
				bag.setcCurriculum(rs.getString("cCurriculum"));
				
				bag.setcLimit(rs.getInt("cLimit"));
				bag.setcPrice(rs.getInt("cPrice"));
				bag.setcImg(rs.getString("cImg"));
				
				bag.settID(rs.getString("tID"));
				bag.settCrt(rs.getString("tCrt"));;
				bag.setcNumOfRegist(rs.getInt("cNumOfRegist"));

				list.add(bag);
			}
			
			dbcp.freeConnection(con, ps, rs);
			
			return list;
		}
public boolean create(ClassVO vo) throws Exception {
		// 강의 등록
	con = dbcp.getConnection();
		String sql = "insert into class(cTitle,cType,cAddress,cInfo,cLimit,cPrice,cCurriculum,tID,cImg,tCrt,cDate,cTime,cDay) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("3. sql문 생성 성공");
		
		ps.setString(1, vo.getcTitle());
		ps.setString(2, vo.getcType());
		ps.setString(3, vo.getcAddress());
		ps.setString(4, vo.getcInfo());
		ps.setInt(5, vo.getcLimit());
		ps.setInt(6, vo.getcPrice());
		ps.setString(7, vo.getcCurriculum());
		ps.setString(8, vo.gettID());
		ps.setString(9, vo.getcImg());
		ps.setString(10, vo.gettCrt());
		ps.setDate(11, vo.getcDate());
		ps.setTime(12, vo.getcTime());
		ps.setString(13, vo.getcDay());

		int row = ps.executeUpdate();
		System.out.println("4. sql전송 성공");
		boolean result = false;
		if (row == 1) {
			result = true;
		}
		dbcp.freeConnection(con, ps);
		return result;

	}
	public int getCnumOfRegist(int cCode) throws Exception {
		//현 수강인원 출력하기
		con = dbcp.getConnection();
		String sql = "select cNumOfRegist from class where cCode = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, cCode);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			cNumOfRegist = rs.getInt("cNumOfRegist");
		}
		
		dbcp.freeConnection(con, ps, rs);
		return cNumOfRegist;

	}
	public boolean create2(ClassVO vo) throws Exception {
		// 강의 인원 수정하기
		con = dbcp.getConnection();
		String sql2 = "update class set cNumOfRegist = ? where cCode = ?";
		PreparedStatement ps2 = con.prepareStatement(sql2);
		System.out.println("3. sql문 생성 성공");
		
		ps2.setInt(1, cNumOfRegist + vo.getcNumOfRegist());
		ps2.setInt(2, vo.getcCode());
		
		int row = ps2.executeUpdate();
		System.out.println("4. sql전송 성공");
		boolean result = false;
		if (row == 1) {
			result = true;
		}
		dbcp.freeConnection(con, ps2);
		return result;

	}

	public ArrayList<ClassVO> all(int cCode) throws Exception {
		// 3. sql문을 만든다.
		con = dbcp.getConnection();
		String sql = "select * from class where cCode = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, cCode);

		// 4. sql문은 전송
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		ArrayList<ClassVO> list = new ArrayList<ClassVO>();
		while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
			ClassVO bag = new ClassVO();// 가방만들어서,
			bag.setcTitle(rs.getString("cTitle"));
			bag.setcType(rs.getString("cType"));
			
			/*Date date = new Date(Long.parseLong(rs.getString("cDate")));
			Time time = new Time(Long.parseLong(rs.getString("cTime")));*/
			bag.setcDate(rs.getDate("cDate"));
			bag.setcTime(rs.getTime("cTime"));
			bag.setcDay(rs.getString("cDay"));
			bag.setcLimit(rs.getInt("cLimit"));
			bag.setcInfo(rs.getString("cInfo"));
			bag.setcCurriculum(rs.getString("cCurriculum"));
			bag.setcAddress(rs.getString("cAddress"));
			bag.setcPrice(rs.getInt("cPrice"));
			bag.settCrt(rs.getString("tCrt"));
			bag.setcImg(rs.getString("cImg"));
			
			list.add(bag);
		}
		dbcp.freeConnection(con, ps, rs);
		return list;
	}
	public ArrayList<ClassVO> all2(String tID) throws Exception {
		// 3. sql문을 만든다.
		con = dbcp.getConnection();
		String sql = "select * from class where tID = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, tID);

		// 4. sql문은 전송
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		ArrayList<ClassVO> list = new ArrayList<ClassVO>();
		while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
			ClassVO bag = new ClassVO();// 가방만들어서,
			bag.setcTitle(rs.getString("cTitle"));
			bag.setcType(rs.getString("cType"));
			/*Date date = new Date(Long.parseLong(rs.getString("cDate")));
			Time time = new Time(Long.parseLong(rs.getString("cTime")));*/
			bag.setcDate(rs.getDate("cDate"));
			bag.setcTime(rs.getTime("cTime"));
			bag.setcDay(rs.getString("cDay"));
			bag.setcLimit(rs.getInt("cLimit"));
			bag.setcInfo(rs.getString("cInfo"));
			bag.setcCurriculum(rs.getString("cCurriculum"));
			bag.setcAddress(rs.getString("cAddress"));
			bag.setcPrice(rs.getInt("cPrice"));
			bag.settCrt(rs.getString("tCrt"));
			bag.setcImg(rs.getString("cImg"));
			
			list.add(bag);
		}
		dbcp.freeConnection(con, ps, rs);
		return list;
	}
	public ArrayList<ClassVO> all3(String uID) throws Exception {
		// 3. sql문을 만든다.
		con = dbcp.getConnection();
		String sql = "select * from class where uID = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, uID);
		
		// 4. sql문은 전송
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문 전송 성공.!!");
		ArrayList<ClassVO> list = new ArrayList<ClassVO>();
		while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
			ClassVO bag = new ClassVO();// 가방만들어서,
			bag.setcTitle(rs.getString("cTitle"));
			bag.setcType(rs.getString("cType"));
			
			/*Date date = new Date(Long.parseLong(rs.getString("cDate")));
			Time time = new Time(Long.parseLong(rs.getString("cTime")));*/
			bag.setcDate(rs.getDate("cDate"));
			bag.setcTime(rs.getTime("cTime"));
			bag.setcDay(rs.getString("cDay"));
			bag.setcLimit(rs.getInt("cLimit"));
			bag.setcInfo(rs.getString("cInfo"));
			bag.setcCurriculum(rs.getString("cCurriculum"));
			bag.setcAddress(rs.getString("cAddress"));
			bag.setcPrice(rs.getInt("cPrice"));
			bag.settCrt(rs.getString("tCrt"));
			bag.setcImg(rs.getString("cImg"));
			
			list.add(bag);
		}
		dbcp.freeConnection(con, ps, rs);
		return list;
	}
	
	public ArrayList<ClassVO> read1(String uID) throws Exception {
		con = dbcp.getConnection();
		// 3. sql문을 만든다.(create)
		String sql = "select * from class where cCode in (select cCode from payment where uID = ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, uID);
		
		ResultSet rs = ps.executeQuery();
		System.out.println("3. SQL생성 성공.!!");
		ArrayList<ClassVO> list = new ArrayList<ClassVO>();
		while (rs.next()) { // 결과가 있는지 없는지 체크해주는 메서드
			ClassVO bag = new ClassVO();// 가방만들어서,
			bag.setcTitle(rs.getString("cTitle"));
			bag.setcType(rs.getString("cType"));
			bag.setcDate(rs.getDate("cDate"));
			bag.setcTime(rs.getTime("cTime"));
			bag.setcDay(rs.getString("cDay"));
			bag.setcLimit(rs.getInt("cLimit"));
			bag.setcInfo(rs.getString("cInfo"));
			bag.setcCurriculum(rs.getString("cCurriculum"));
			bag.setcAddress(rs.getString("cAddress"));
			bag.setcPrice(rs.getInt("cPrice"));
			bag.settCrt(rs.getString("tCrt"));
			bag.setcImg(rs.getString("cImg"));
			
			list.add(bag);
		}
		// 4. sql문은 전송
		dbcp.freeConnection(con, ps);
		return list;
	}
}