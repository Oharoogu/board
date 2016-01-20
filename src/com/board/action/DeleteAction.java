package com.board.action;


import java.sql.*;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.board.controller.CommandAction;
import com.board.dao.BoardDao;



public class DeleteAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		BoardDao.getInstance().deleteArticle(idx);
		return "delete.jsp";
			
	}
}
