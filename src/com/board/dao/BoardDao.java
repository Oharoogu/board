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
 
    public ArrayList<Board> getArticleList() throws SQLException {
    	return  (ArrayList<Board>)GetDB().queryForList("getArticleList", null);
    }
}