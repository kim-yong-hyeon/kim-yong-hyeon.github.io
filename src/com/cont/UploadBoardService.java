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
		//������ ��𿡴ٰ� ������ ������ ��θ� ����
		//webcontent ->img ����
		String saveDir = request.getServletContext().getRealPath("img");
		System.out.println(saveDir);
		//�̹����� �ִ��ѵ�(�뷮ũ��) ���� -> 5MB
		int maxSize = 5*1024*1024;
		// �̹��� ���ϸ� �ѱۿ� ���� ���ڵ�
		String encoding = "EUC-KR";
		
		//�̹����� �����ϰ�  client�� ��û�� �����͸� �����ϰ� �ִ�
		//MultipartRequest ��ü ����
		//�ߺ��Ǵ� �̸��� ����� (1) �ߺ� ���� DefaultFileRenamePolicy
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
				System.out.println("�Խ��� ���ε� ����");
			}else {
				System.out.println("�Խ��� ���ε� ����");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "board.jsp";
	}

}
