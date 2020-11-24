package com.cont;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.MemberDAO;
import com.DAO.RentDAO;
import com.DTO.MemberDTO;
import com.DTO.RentDTO;
import com.front.Command;

public class RequestService implements Command{

	@Override
	public String execut(HttpServletRequest request, HttpServletResponse response) {

		String request_company = request.getParameter("request_company");
		String location = request.getParameter("location");
		String first_day = request.getParameter("first_day");
		String last_day = request.getParameter("last_day");
		String carName = request.getParameter("carName");
		String fuel = request.getParameter("fuel");
		String comments = request.getParameter("comments");
		String rent_type = request.getParameter("rent_type");
		
		RentDTO dto = new RentDTO(request_company,location,first_day,last_day,carName,fuel,comments,rent_type);
		RentDAO dao = new RentDAO();
		
		System.out.println(request_company);
		
		
		int cnt = dao.requestCar(dto);
		
		if (cnt > 0) {
			System.out.println("차량요청 성공");
		} else {
			System.out.println("차량요청 실패");
		}
		
		return "main.jsp";
		
	}

}
