package com.DTO;

public class BoardDTO {
	private int board_num;
	private int company_id;
	private String title;
	private String file_name;
	private String content;
	private String board_day;
	
	@Override
	public String toString() {
		return board_num + "," + company_id + "," + title + ","
				+ file_name + "," + content + "," + board_day;
	}

	public BoardDTO() {	}
	
	public BoardDTO(int board_num, int company_id, String title, String file_name, String content, String board_day) {
		this.board_num = board_num;
		this.company_id = company_id;
		this.title = title;
		this.file_name = file_name;
		this.content = content;
		this.board_day = board_day;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getCompany_id() {
		return company_id;
	}
	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBoard_day() {
		return board_day;
	}
	public void setBoard_day(String board_day) {
		this.board_day = board_day;
	}
	
}
