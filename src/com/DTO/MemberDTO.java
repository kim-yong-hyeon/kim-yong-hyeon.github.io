package com.DTO;

public class MemberDTO {
	private int company_id;
	private String email;
	private String pw;
	private String name;
	private String companyName; // 업체명
	private String phone;
	private String companyImg; //
	private String location; // 차 주소

	public MemberDTO() {
	}
	public MemberDTO(String companyName) {
		super();
		this.companyName = companyName;
	}
	
	public MemberDTO(int company_id, String email, String pw, String name, String companyName, String phone,
			String companyImg, String location) {
		super();
		this.company_id = company_id;
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.companyName = companyName;
		this.phone = phone;
		this.companyImg = companyImg;
		this.location = location;
	}

	public MemberDTO(String email, String pw, String name) {
		super();
		this.email = email;
		this.pw = pw;
		this.name = name;
	}

	public MemberDTO(String email, String pw, String name, String companyName, String phone, String location) {
		super();
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.companyName = companyName;
		this.phone = phone;
		this.location = location;
	}

	public MemberDTO(String email, String pw, String companyName, String phone, String location) {
		super();
		this.email = email;
		this.pw = pw;
		this.companyName = companyName;
		this.phone = phone;
		this.location = location;
	}

	@Override
	public String toString() {
		return "MemberDTO [company_id=" + company_id + ", pw=" + pw + ", name=" + name + ", companyName=" + companyName
				+ ", phone=" + phone + ", email=" + email + ", companyImg=" + companyImg + ", locateion=" + location
				+ "]";
	}

	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCompanyImg() {
		return companyImg;
	}

	public void setCompanyImg(String companyImg) {
		this.companyImg = companyImg;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

}
