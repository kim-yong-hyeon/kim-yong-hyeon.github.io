package com.cont;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.front.Command;
import com.DAO.BoardDAO;

public class RemoveBoard implements Command {

	@Override
	public String execut(HttpServletRequest request, HttpServletResponse response) {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		BoardDAO dao = new BoardDAO();
		int cnt = dao.removeBoard(board_num);
		if(cnt > 0) {
			System.out.println("게시글 삭제 성공");
		}else {
			System.out.println("게시글 삭제 실패");
		}
		
		return "board.jsp";
	}

	

}
