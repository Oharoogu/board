package com.board.dao;
 
import java.sql.SQLException;
import java.util.ArrayList;
import com.board.beans.Board;
 
public class BoardDao extends CommonDao {
    public static BoardDao getInstance() {
        BoardDao _instance = new BoardDao();
        _instance.SetDB();       
        return _instance;
    }
 
    public ArrayList<Board> getArticleList(int page) throws SQLException {
    	return  (ArrayList<Board>)GetDB().queryForList("getArticleList", null, page , 10);
    }
    
    public void insertArticle(Board article) throws SQLException {
    	GetDB().insert("insertArticle", article);
    }

	public void deleteArticle(int idx) throws SQLException{
		GetDB().delete("deleteArticle", idx);
	}
}