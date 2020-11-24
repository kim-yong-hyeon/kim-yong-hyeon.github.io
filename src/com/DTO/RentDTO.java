package com.DTO;

public class RentDTO {
	private int req_num; // ��ȣ��
	private String request_company; // ���
	private String response_company; // ���
	private String first_day; // ���
	private String last_day; // �� �̹���
	private String carName; // �����̸�
	private String fuel; // ��������
	private String comments; // �� �̹���
	private String rent_type; // ��Ʈ����
	private String location; // ��Ʈ����
	private int rent_status; // ��Ʈ��Ȳ

	public RentDTO() {

	}

	public RentDTO(String response_company, int req_num) {
		super();
		this.response_company = response_company;
		this.req_num = req_num;
	}

	public RentDTO(int req_num) {
		super();
		this.req_num = req_num;
	}

	public RentDTO(String request_company, String location, String first_day, String last_day, String carName,
			String fuel, String rent_type, String comments) {
		super();
		this.request_company = request_company;
		this.first_day = first_day;
		this.last_day = last_day;
		this.carName = carName;
		this.fuel = fuel;
		this.comments = comments;
		this.rent_type = rent_type;
		this.location = location;
	}

	public RentDTO(int req_num, String request_company, String response_company, String location, String first_day,
			String last_day, String carName, String fuel, String comments, String rent_type, int rent_status) {
		super();
		this.req_num = req_num;
		this.request_company = request_company;
		this.response_company = response_company;
		this.location = location;
		this.first_day = first_day;
		this.last_day = last_day;
		this.carName = carName;
		this.fuel = fuel;
		this.comments = comments;
		this.rent_type = rent_type;
		this.rent_status = rent_status;
	}

	public int getReq_num() {
		return req_num;
	}

	public void setReq_num(int req_num) {
		this.req_num = req_num;
	}

	public String getRequest_company() {
		return request_company;
	}

	public void setRequest_company(String request_company) {
		this.request_company = request_company;
	}

	public String getResponse_company() {
		return response_company;
	}

	public void setResponse_company(String response_company) {
		this.response_company = response_company;
	}

	public String getFirst_day() {
		return first_day;
	}

	public void setFirst_day(String first_day) {
		this.first_day = first_day;
	}

	public String getLast_day() {
		return last_day;
	}

	public void setLast_day(String last_day) {
		this.last_day = last_day;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getFuel() {
		return fuel;
	}

	public void setFuel(String fuel) {
		this.fuel = fuel;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getRent_type() {
		return rent_type;
	}

	public void setRent_type(String rent_type) {
		this.rent_type = rent_type;
	}

	public int getRent_status() {
		return rent_status;
	}

	public void setRent_status(int rent_status) {
		this.rent_status = rent_status;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

}
