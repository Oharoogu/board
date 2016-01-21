package com.board.action;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.controller.CommandAction;
import com.board.dao.BoardDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.board.beans.Board;
import java.sql.*;

public class InsertAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");
		
		MultipartRequest multi = null;	
		int sizeLimit = 10 * 1024 * 1024 ; // 10메가입니다.
		String savePath = request.getRealPath("/upload");    // 파일이 업로드될 실제 tomcat 폴더의 WebContent 기준
		
		try{
		multi=new MultipartRequest(request, savePath, sizeLimit, "euc-kr", new DefaultFileRenamePolicy()); 
		 }catch (Exception e) {
			e.printStackTrace();
		 } 

		String filename = multi.getFilesystemName("filename");
		
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		int count = 0;
		String content = multi.getParameter("content");
		String regip = request.getRemoteAddr();

		if(title == "" || title == null) System.out.println("title이 null입니다.");

		if(writer == "" || writer == null) System.out.println("writer가 null입니다.");
		else if(!Pattern.matches("^[a-zA-Z0-9]+@[a-zA-Z0-9]+$", writer)) System.out.println("이메일 형식이 아닙니다.");

		if(content == "" || content == null) System.out.println("title이 null입니다.");
		
		Board article = new Board();
		
		article.setTitle(title);
		article.setWriter(writer);
		article.setCount(count);
		article.setContent(content);
		article.setRegip(regip);
		article.setFilename(filename);
		BoardDao.getInstance().insertArticle(article);
		
		return "insert.jsp";
	}
}