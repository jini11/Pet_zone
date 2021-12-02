package pz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PzDAO {
	private Connection conn;
	private ResultSet rs;
	private String url = "jdbc:mysql://localhost/db_dog";
	private String user = "root";
	private String password = "6497";

	public PzDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getNext() {
		String SQL = "SELECT pz_id FROM pet_zone ORDER BY pz_id";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return Integer.parseInt(rs.getString(1).substring(1, rs.getString(1).length()));
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<Pz> getList(int pageNumber, String type, String area1, String area2) {
		String SQL = "";
		int key = 0;
		if (area1.equals("") && area2.equals("")) {
			if(type == "all")
				SQL = "SELECT * FROM pet_zone ORDER BY pz_id LIMIT ?, 20";
			else if(type == "food")
				SQL = "SELECT * FROM pet_zone WHERE type_id IN ('D001','D002') ORDER BY pz_id LIMIT ?, 20";
			else if(type == "accommodation")
				SQL = "SELECT * FROM pet_zone WHERE type_id IN ('D003','D004') ORDER BY pz_id LIMIT ?, 20";
			else if(type == "outdoors")
				SQL = "SELECT * FROM pet_zone WHERE type_id IN ('D005','D006','D007') ORDER BY pz_id LIMIT ?, 20";
			key = 1;
		} else {
			key = 0;
			if (type == "all")
				SQL = "SELECT * FROM pet_zone WHERE pz_address LIKE ? ORDER BY pz_id LIMIT ?, 20";
			else if (type == "food")
				SQL = "SELECT * FROM pet_zone WHERE type_id IN ('D001','D002') AND pz_address LIKE ? ORDER BY pz_id LIMIT ?, 20";
			else if (type == "accommodation")
				SQL = "SELECT * FROM pet_zone WHERE type_id IN ('D003','D004') AND pz_address LIKE ? ORDER BY pz_id LIMIT ?, 20";
			else if (type == "outdoors")
				SQL = "SELECT * FROM pet_zone WHERE type_id IN ('D005','D006','D007') AND pz_address LIKE ? ORDER BY pz_id LIMIT ?, 20";
		}
		ArrayList<Pz> list = new ArrayList<Pz>();
		if (key == 1) {
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext() + (pageNumber - 1) * 20 - 1);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Pz pz = new Pz();
					pz.setPz_id(rs.getString(1));
					pz.setPz_name(rs.getString(2));
					pz.setType_id(rs.getString(3));
					pz.setPz_address(rs.getString(4));
					pz.setPz_phone(rs.getString(5));
					pz.setWd_time(rs.getString(6));
					pz.setWe_time(rs.getString(7));
					pz.setClosed(rs.getString(8));
					list.add(pz);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
 
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, area1 + " " + area2 + "%");
				pstmt.setInt(2, getNext() + (pageNumber - 1) * 20 - 1);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Pz pz = new Pz();
					pz.setPz_id(rs.getString(1));
					pz.setPz_name(rs.getString(2));
					pz.setType_id(rs.getString(3));
					pz.setPz_address(rs.getString(4));
					pz.setPz_phone(rs.getString(5));
					pz.setWd_time(rs.getString(6));
					pz.setWe_time(rs.getString(7));
					pz.setClosed(rs.getString(8));
					list.add(pz);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM pet_zone ORDER BY pz_id LIMIT ?, 20";
		ArrayList<Pz> list = new ArrayList<Pz>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() + (pageNumber - 1) * 20 - 1);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public void bookmark(String str) {
		System.out.println(str);
	}
	
	public ArrayList<Pz> getPzList(String pz_id) {
		String SQL = "SELECT * FROM pet_zone WHERE pz_id = ? ORDER BY pz_id";
		ArrayList<Pz> list = new ArrayList<>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, pz_id);
			//pstmt.setInt(1, getNext() + (pageNumber - 1) * 20 - 1);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Pz pz = new Pz();
				pz.setPz_id(rs.getString(1));
				pz.setPz_name(rs.getString(2));
				pz.setType_id(rs.getString(3));
				pz.setPz_address(rs.getString(4));
				pz.setPz_phone(rs.getString(5));
				pz.setWd_time(rs.getString(6));
				pz.setWe_time(rs.getString(7));
				pz.setClosed(rs.getString(8));
				list.add(pz);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
