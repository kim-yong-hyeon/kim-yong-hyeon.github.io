package com.cont;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.DAO.BoardDAO;
import com.DAO.MemberDAO;
import com.DTO.BoardDTO;
import com.DTO.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class UploadBoardService implements Command {

	@Override
	public String execut(HttpServletRequest request, HttpServletResponse response) {
		//파일을 어디에다가 저장할 것인지 경로를 설정
		//webcontent ->img 폴더
		String saveDir = request.getServletContext().getRealPath("img");
		System.out.println(saveDir);
		//이미지의 최대한도(용량크기) 설정 -> 5MB
		int maxSize = 5*1024*1024;
		// 이미지 파일명 한글에 대한 인코딩
		String encoding = "EUC-KR";
		
		//이미지를 저장하고  client의 요청한 데이터를 저장하고 있는
		//MultipartRequest 객체 생성
		//중복되는 이름이 존재시 (1) 중복 제거 DefaultFileRenamePolicy
		try {
			MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
			HttpSession Session = request.getSession();
			MemberDTO info = (MemberDTO) Session.getAttribute("info");
			MemberDAO memDAO = new MemberDAO();
			info = memDAO.login(info);
			int company_id = info.getCompany_id();
			String title = multi.getParameter("title");
			String file_name = multi.getFilesystemName("file_name");
			if(file_name != null) {
				file_name = URLEncoder.encode(file_name, "EUC-KR");
			}
			String content = multi.getParameter("content");
			
			BoardDAO dao = new BoardDAO();
			BoardDTO dto = new BoardDTO();
			dto.setCompany_id(company_id);
			dto.setTitle(title);
			dto.setFile_name(file_name);
			dto.setContent(content);
			
			int cnt = dao.upload(dto);
			if(cnt>0) {
				System.out.println("게시판 업로드 성공");
			}else {
				System.out.println("게시판 업로드 실패");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "board.jsp";
	}

}
