package com.cont;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.front.Command;
import com.DAO.MemberDAO;
import com.DTO.MemberDTO;

public class JoinService implements Command{

	public String execut(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("조인서비스 실행");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String companyName = request.getParameter("companyName");
		String phone = request.getParameter("phone");
		String location = request.getParameter("location");

		MemberDTO dto = new MemberDTO(email, pw, name, companyName, phone, location);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.Join(dto);
		if (cnt > 0) {
			System.out.println("회원가입 성공");
		} else {
			System.out.println("회원가입 실패");
		}
		return "main.jsp";
	}

		
	
	
}
