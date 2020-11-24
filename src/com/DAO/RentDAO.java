package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.DTO.MemberDTO;
import com.DTO.RentDTO;

public class RentDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	int cnt = 0;

	private void getConn() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String dbid = "hr";
		String dbpw = "hr";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void close() { // 닫기
		try {
			if (pst != null) {
				pst.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}

	// car_info DB에 자동차 추가
	public int requestCar(RentDTO dto) {
		getConn();
		String sql = "insert into rent_car(req_num, request_company, location, first_day, last_day, carName,fuel, rent_type, comments, rent_status)"
				+ "values (req_num_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
		try {

			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getRequest_company());
			pst.setString(2, dto.getLocation());
			pst.setString(3, dto.getFirst_day());
			pst.setString(4, dto.getLast_day());
			pst.setString(5, dto.getCarName());
			pst.setString(6, dto.getFuel());
			pst.setString(7, dto.getComments());
			pst.setString(8, dto.getRent_type());
			cnt = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	// car_info DB에 자동차 추가
	public int responseCar(RentDTO dto) {
		getConn();
		String sql = "update rent_car set response_company = ?, rent_status = 1 where req_num = ?";

		try {

			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getResponse_company());
			pst.setInt(2, dto.getReq_num());
			cnt = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public ArrayList<RentDTO> rentall() {
		ArrayList<RentDTO> list = new ArrayList<RentDTO>();

		getConn();

		String sql = "select * from rent_car where response_company is null";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			while (rs.next()) {
				int req_num = rs.getInt(1);
				String request_company = rs.getString(2);
				String response_company = rs.getString(3);
				String location = rs.getString(4);
				String first_day = rs.getString(5);
				String last_day = rs.getString(6);
				String carName = rs.getString(7);
				String fuel = rs.getString(8);
				String comments = rs.getString(9);
				String rent_type = rs.getString(10);
				int rent_status = rs.getInt(11);

				RentDTO dto = new RentDTO(req_num, request_company, response_company, location, first_day, last_day,
						carName, fuel, comments, rent_type, rent_status);
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public ArrayList<RentDTO> rent_me(MemberDTO info) {
		ArrayList<RentDTO> list = new ArrayList<RentDTO>();

		getConn();

		String sql = "select * from rent_car where request_company = ? and rent_status = 1";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, info.getCompanyName());
			rs = pst.executeQuery();

			while (rs.next()) {
				int req_num = rs.getInt(1);
				String request_company = rs.getString(2);
				String response_company = rs.getString(3);
				String location = rs.getString(4);
				String first_day = rs.getString(5);
				String last_day = rs.getString(6);
				String carName = rs.getString(7);
				String fuel = rs.getString(8);
				String comments = rs.getString(9);
				String rent_type = rs.getString(10);
				int rent_status = rs.getInt(11);

				RentDTO dto = new RentDTO(req_num, request_company, response_company, location, first_day, last_day,
						carName, fuel, comments, rent_type, rent_status);
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public ArrayList<RentDTO> rent_you(MemberDTO info) {
		ArrayList<RentDTO> list = new ArrayList<RentDTO>();

		getConn();

		String sql = "select * from rent_car where response_company = ? and rent_status = 1 ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, info.getCompanyName());
			rs = pst.executeQuery();

			while (rs.next()) {
				int req_num = rs.getInt(1);
				String request_company = rs.getString(2);
				String response_company = rs.getString(3);
				String location = rs.getString(4);
				String first_day = rs.getString(5);
				String last_day = rs.getString(6);
				String carName = rs.getString(7);
				String fuel = rs.getString(8);
				String comments = rs.getString(9);
				String rent_type = rs.getString(10);
				int rent_status = rs.getInt(11);

				RentDTO dto = new RentDTO(req_num, request_company, response_company, location, first_day, last_day,
						carName, fuel, comments, rent_type, rent_status);
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	
	public int deleteRent(RentDTO dto) {
		getConn();
		String sql = "delete from rent_car where req_num = ?";

		try {

			pst = conn.prepareStatement(sql);
			pst.setInt(1, dto.getReq_num());
			cnt = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
