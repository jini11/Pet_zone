package fv;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pz.Pz;

public class FvDAO {
	private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private String url = "jdbc:mysql://localhost:3306/db_dog";
    private String user = "root";
    private String password = "6497";
    private int index = 1;
    
    public FvDAO() {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
        } catch (Exception e) { 
            e.printStackTrace();
        }
    }
    
    public int checkFavorites(String userID, String pz_id) {
        String SQL = "SELECT pz_id FROM favorites WHERE userID = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                if(rs.getString(1).equals(pz_id)) {
                    return 1;
                }
            }
            return 0;//userid 없음
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; //데이터베이스 오류
    }
    
    public int getindex() {
    	String SQL = "SELECT fv_id FROM favorites ORDER BY fv_id DESC";
    	try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
    }
    
    public int addFavorites(String userID, String pz_id) {
        String SQL = "INSERT INTO favorites VALUES (?, ?, ?)";
        try {
            Fv fv = new Fv();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getindex() + 1);
            pstmt.setString(2, userID);
            pstmt.setString(3, pz_id);
            return pstmt.executeUpdate();
        }catch(Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    public ArrayList<Fv> getList(String userID) {
		String SQL = "SELECT pz_id FROM favorites WHERE userID = ?";
		
		ArrayList<Fv> list = new ArrayList<Fv>();
		try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, userID);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Fv fv = new Fv();
					fv.setPz_id(rs.getString(1));
					
					list.add(fv);
				}
			} catch (Exception e) {
				e.printStackTrace();
		}
		return list;
	}
    
    public int deleteFavorites(String userID, String pz_id) {
        String SQL = "DELETE FROM favorites WHERE userID = ? and pz_id=?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            pstmt.setString(2, pz_id);
            pstmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; //데이터베이스 오류

    }
    
}
