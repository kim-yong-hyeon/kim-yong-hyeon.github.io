package com.cont;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.DAO.MemberDAO;
import com.DTO.MemberDTO;

public class UpdateService implements Command {

	@Override
	public String execut(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
 
		String email = info.getEmail();
		String pw = request.getParameter("pw");
		String phone = request.getParameter("phone");
		String location = request.getParameter("location");
		String companyName = request.getParameter("companyName");
	
	
		MemberDTO dto = new MemberDTO(email, pw, companyName, phone, location);
		MemberDAO dao = new MemberDAO();
		int cnt =  dao.update(dto);
		
		if(cnt > 0) {
			System.out.println("회원정보 수정 완료!");
			session.setAttribute("info", dto);
		}else {
			System.out.println("회원정보 수정 실패");
		}
		
		return "main.jsp";
	}

}
