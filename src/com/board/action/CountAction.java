package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.BoardDao;

public class CountAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int idx =Integer.parseInt( request.getParameter("idx"));
		Board article = BoardDao.getInstance().getArticle(idx); 
		String regip = request.getRemoteAddr();
		
		//if(!regip.equals(article.getRegip())){          // 게시글의 ip와 동일하지 않으면
            int count = article.getCount();                 // 게시글의 count를 받아서
            article.setCount(++count);                      // +1 해주고 게시글빈에 셋팅합니다.
            BoardDao.getInstance().setArticleCount(article);    // 이후 이 빈을 파라미터로 업데이트합니다.
        //}
 
    request.setAttribute("url", "content.do?idx="+idx);
		
		return "redirect2.jsp";
	}
}
