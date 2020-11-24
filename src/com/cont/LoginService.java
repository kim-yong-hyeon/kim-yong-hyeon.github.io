package com.cont;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.MemberDAO;
import com.DTO.MemberDTO;
import com.front.Command;


public class LoginService implements Command{

	public String execut(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		System.out.println("로그인 email : "+email);
		String pw = request.getParameter("pw");
		System.out.println("로그인 pw : "+pw);
		
		MemberDTO dto = new MemberDTO();
		dto.setEmail(email);
		dto.setPw(pw);
		
		MemberDAO dao = new MemberDAO();
		MemberDTO info =  dao.login(dto);
		
		if(info !=null) {
			System.out.println("로그인 성공");
			HttpSession Session = request.getSession();
			Session.setAttribute("info", info);
			
			
		}else {
			System.out.println("로그인 실패");
		}
		
		return "main.jsp";
	}

}
