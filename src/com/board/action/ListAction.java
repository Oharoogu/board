package com.board.action;

import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.board.beans.Board;
import com.board.controller.CommandAction;

public class ListAction implements CommandAction{

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		try {
			String driverName = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:Orcl";
			ResultSet rs = null;
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(url, "Ohha", "1234");
			System.out.println("Oracle Database Connection Success.");
			Statement stmt = con.createStatement();
			String sql = "select * from board order by idx desc";
			rs = stmt.executeQuery(sql);

			ArrayList<Board> articleList = new ArrayList<Board>();

			while (rs.next()) {

				Board article = new Board(); //데이터들을 담기위해 Board객체에 메모리를 할당하는 코드입니다.

				article.setIdx(rs.getInt("idx")); // Integer.parseInt는 String형을 int형식으로 형변환
				article.setTitle(rs.getString("title"));
				article.setWriter(rs.getString("writer"));
				article.setRegdate(rs.getString("regdate"));
				article.setCount(rs.getInt("count"));
				articleList.add(article); // 셋팅된 빈을 리스트에 추가합니다.
			}
			request.setAttribute("articleList", articleList); // 셋팅된 리스트를 뷰에 포워드합니다.

			con.close();
		} catch (Exception e) {
			System.err.println("Oracle Database Connection Something Problem. <hr>");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return "list.jsp";
	}
}
