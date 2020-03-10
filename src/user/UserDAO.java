package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// JDBC를 이용한 mysql연결방법
// Java를 통해 DB에 

public class UserDAO { // DAO란? 데이터베이스 접근 객체
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// UserDAO생성자
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "12345678";
			Class.forName("com.mysql.jdbc.Driver"); // mysql에 접속할수있도록 도와주는 매개체 : Driver loading
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);  //Basic Form -> getConnection(URL,userID,userPassword)
																		// return Connection
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	// Login function 구현;
	
	public int login(String user_ID,String user_Password) {
		String SQL = "SELECT userPassword From USER WHERE userID = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL); //쿼리 수행을 위한 preparestatement객체 pstmt생성;
			pstmt.setString(1, user_ID);  // pstmt객체에 데이터 삽입;
			rs = pstmt.executeQuery();  // 쿼리실행 및 rs객체에 수행된 쿼리의 결과(select문을 통해 나온 결과) 저장;
			
			if(rs.next()) { //rs.next() .next()에서 next row가 있으면 return true; 없으면 return false; 
				
				if(rs.getString(1).equals(user_Password))
					return 1; // 로그인 성공!
				else
					return 0; // 비밀번호가 틀림
			}
			return -1; // 일치하는 아이디가 존재 X			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	// Join function 구현
	
	public int join(User user) {
		
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,user.getUserID());
			pstmt.setString(2,user.getUserPassword());			
			pstmt.setString(3,user.getUserName());
			pstmt.setString(4,user.getUserGender());
			pstmt.setString(5,user.getUserEmail());
			return pstmt.executeUpdate();
			
			// 이때 return되는 값은 Database의 한 행 당 1씩 return;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
				
		return -1;	//Database 오류 : 이미 존재하는 아이디가 있는 경우(Primary key로 ID를 적용했기 때문에)	
	}
		
}
