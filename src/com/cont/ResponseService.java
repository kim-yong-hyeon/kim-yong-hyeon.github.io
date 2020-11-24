package com.cont;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.RentDAO;
import com.DTO.RentDTO;
import com.front.Command;

public class ResponseService implements Command {

	@Override
	public String execut(HttpServletRequest request, HttpServletResponse response) {

		int req_num = Integer.parseInt(request.getParameter("req_num"));
		String response_company = request.getParameter("response_company");

		RentDTO dto = new RentDTO(response_company, req_num);
		RentDAO dao = new RentDAO();

		
		System.out.println(response_company);
		
		int cnt = dao.responseCar(dto);
		
		if (cnt > 0) {
			System.out.println("요청수락 성공");
		} else {
			System.out.println("요청수락 실패");
		}
		return "main.jsp";
		
	}

}
