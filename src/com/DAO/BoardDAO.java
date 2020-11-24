package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.DTO.BoardDTO;

public class BoardDAO {
	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs = null;
	int cnt = 0;
	
	private void close() {
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

	public int upload(BoardDTO dto) {
		getConn();
		String sql = "insert into rent_board values(rent_board_num.nextval,?,?,?,?,sysdate)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, dto.getCompany_id());
			pst.setString(2, dto.getTitle());
			pst.setString(3, dto.getFile_name());
			pst.setString(4, dto.getContent());
			cnt = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	public ArrayList<BoardDTO> viewAll(){
		getConn();
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		String sql = "select * from rent_board order by board_day desc";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()) {
				int board_num = rs.getInt(1);
				int company_id = rs.getInt(2);
				String title = rs.getString(3);
				String file_name = rs.getString(4);
				String content = rs.getString(5);
				String board_day = rs.getString(6);
				
				BoardDTO dto = new BoardDTO(board_num,company_id,title,file_name,content,board_day);
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}
	public BoardDTO viewOne(int board_num) {
		getConn();
		BoardDTO dto =null;
		String sql = "select * from rent_board where board_num = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, board_num);
			rs = pst.executeQuery();
			if(rs.next()) {
				int company_id = rs.getInt(2);
				String title = rs.getString(3);
				String file_name = rs.getString(4);
				String content = rs.getString(5);
				String board_day = rs.getString(6);
				dto = new BoardDTO(board_num,company_id,title,file_name,content,board_day);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}

	public int removeBoard(int board_num) {
		getConn();
		String sql = "delete from rent_board where board_num = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, board_num);
			cnt = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return cnt;
	}

}
