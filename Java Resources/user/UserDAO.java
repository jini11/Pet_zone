package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	 private Connection conn;
	    private PreparedStatement pstmt;
	    private ResultSet rs;
	    private String url = "jdbc:mysql://localhost/db_dog";
	    private String user = "root";
	    private String password = "6497";

	    public UserDAO() {
	        try{
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            conn = DriverManager.getConnection(url, user, password);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    public int login(String userID, String userPassword) {
	        String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
	        try{
	            pstmt = conn.prepareStatement(SQL);
	            pstmt.setString(1, userID);
	            rs = pstmt.executeQuery();
	            if(rs.next()) {
	                if(rs.getString(1).equals(userPassword)) {
	                    return 1; //로그인 성공
	                }
	                else
	                    return 0; //비밀번호 불일치
	            }
	            return -1; // 아이디가 없음
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return -2; //데이터베이스 오류
	    }
}
