package com.cont;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.RentDAO;
import com.DTO.RentDTO;
import com.front.Command;

public class DeleteRentService implements Command {

	@Override
	public String execut(HttpServletRequest request, HttpServletResponse response) {
		int req_num = Integer.parseInt(request.getParameter("req_num"));
		

		RentDTO dto = new RentDTO(req_num);
		RentDAO dao = new RentDAO();
		
		System.out.println(req_num);
		
		int cnt = dao.deleteRent(dto);
		
		if (cnt > 0) {
			System.out.println("차량반납 성공");
		} else {
			System.out.println("차량반납 실패");
		}
		return "mypage.jsp";
		
	}

}
