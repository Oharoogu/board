package com.board.action;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.BoardDao;
 
public class ListAction implements CommandAction {
 
    @Override
 
    public String requestPro(HttpServletRequest request,
            HttpServletResponse response) throws Throwable {
 
            ArrayList<Board> articleList = BoardDao.getInstance().getArticleList();  
 
            request.setAttribute("articleList", articleList);   // 셋팅된 리스트를 뷰에 포워드합니다.
 
        return "list.jsp";
        } 
}