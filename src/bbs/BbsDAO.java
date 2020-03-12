package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// JDBC를 이용한 mysql연결방법
// Java를 통해 DB에 

public class BbsDAO { // DAO란? 데이터베이스 접근 객체
	
	private Connection conn;
	private ResultSet rs;
	
	// BbsDAO생성자
	
	public BbsDAO() {
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
				
	public String getDate() {
		String SQL = "SELECT NOW()";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //실행 준비단계 
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return " ";
	}
	
	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //실행 준비단계 
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt (1)+1;
			}
			return 1; //첫 번째 게시물인 경우
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) {
		
		String SQL = "INSERT INTO BBS VALUES(?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //실행 준비단계 
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);

			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
}
