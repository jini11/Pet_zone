package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String url = "jdbc:mysql://localhost/db_dog";
	private String user = "root";
	private String password = "6497";

	public UserDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				} else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}

	public int signup(User user) {
		String SQL = "INSERT INTO user VALUES (?, ?, ?, ?);";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public ArrayList<User> mypage_set(String userID, String userPassword) {
		ArrayList<User> list = new ArrayList<User>();
		String SQL = "SELECT userName, userEmail FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				User user = new User();
				user.setUserName(rs.getString(1));
				user.setUserEmail(rs.getString(2));
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int check_pw(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 비밀번호 동일한 것 확인
				} else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}

	public int update_pw(String userID, String usernewPassword) {
		String SQL = "UPDATE USER " + "SET userPassword = ?" + "WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, usernewPassword);
			pstmt.setString(2, userID);
			pstmt.executeUpdate();
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {

			}
		}
		return -1; // 데이터베이스 오류
	}

	/* e-mail 업데이트 */
	public int update_email(String userID, String userEmail) {
		String SQL = "UPDATE user " + "SET userEmail = ?" + "WHERE userID = ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userEmail);
			pstmt.setString(2, userID);
			pstmt.executeUpdate();
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {

			}
		}
		return -1; // 데이터베이스 오류
	}

	public String getUserPassword(String userID) {
		String SQL = "SELECT userPassword FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next())
				return rs.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String getUserEmail(String userID, String userEmail) {
		String SQL = "SELECT userEmail FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userEmail))
					return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // 데이터베이스 오류
	}

	public String findID(String name, String email) {
		String userID = null;

		try {
			String SQL = "select userID from user where userName=? and userEmail=?";

			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userID = rs.getString("userID");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return userID;
	}

	/* 비밀번호''로 표시 */
	public String setStarUserPassword(String userPassword) {
		String star_sentence = null;
		int pw_length = userPassword.length();
		star_sentence = "*";
		for (int i = 1; i < pw_length; i++) {
			star_sentence += "*";
		}
		return star_sentence;
	}

	public int deleteUser(String userID) {
		String deleteString = "DELETE FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(deleteString);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			return 0;
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception: " + e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {

			}
		}
		return -1;
	}

    public String fourcutPw(String password) {
            String fourPw = password.substring(0,4);
            for(int i = 4;i<password.length();i++)
                fourPw += '*';
            return fourPw;
        }
}
