package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.dto.ClothesDTO;
import util.DBManager;

public class ClothesDAO {
	private ClothesDAO() {
	}

	private static ClothesDAO instance = new ClothesDAO();

	public static ClothesDAO getInstance() {
		return instance;
	}

	ArrayList<ClothesDTO> products = null;
	

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ArrayList<ClothesDTO> getList() {

		try {
			products = new ArrayList<ClothesDTO>();
			
			conn = DBManager.getConnection();
			String sql = "select * from clothes";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int code = rs.getInt(1);
				char size = rs.getString(2).charAt(0);
				String name = rs.getString(3);
				String url = rs.getString(4);
				int price = rs.getInt(5);
				int cnt = rs.getInt(6);
				int tem = rs.getInt(7);

				products.add(new ClothesDTO(code, size, name, url, price, cnt, tem));
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("getList err");
			System.out.println(e);
		}

		return products;
	}
	
	// 옷 검색
	public ClothesDTO findPro(String c) {
		int code = Integer.parseInt(c);
		try {
			products = getList();
			
			for(ClothesDTO index : products) {
				if(index.getCode()==code) {
					return index;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("findPro err");
			System.out.println(e);
		}
		return null;
	}
}
