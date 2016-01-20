package com.board.action;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.controller.CommandAction;
import com.board.dao.BoardDao;
import com.board.beans.Board;
import java.sql.*;

public class InsertAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String regip = request.getRemoteAddr();

		if(title == "" || title == null) System.out.println("title이 null입니다.");

		if(writer == "" || writer == null) System.out.println("writer가 null입니다.");
		else if(!Pattern.matches("^[a-zA-Z0-9]+@[a-zA-Z0-9]+$", writer)) System.out.println("이메일 형식이 아닙니다.");

		if(content == "" || content == null) System.out.println("title이 null입니다.");
		
		Board article = new Board();
		
		article.setTitle(title);
		article.setWriter(writer);
		article.setContent(content);
		article.setRegip(regip);
		BoardDao.getInstance().insertArticle(article);
		
		return "insert.jsp";
	}
}