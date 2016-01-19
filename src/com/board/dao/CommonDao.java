package com.board.dao;
 
import java.sql.*;
 
public class CommonDao {
    //���������� ���� ���ӿ� ���õ� ���� �������� ����� �����մϴ�.
    private final String driverName="oracle.jdbc.driver.OracleDriver";
    private final String url="jdbc:oracle:thin:@localhost:1521:Orcl";
    private final String db_id="Ohha";
    private final String db_pw="1234";
    //���ӿ� �ʿ��� ������ �����մϴ�.
    private Connection con=null;
    private Statement stmt=null;
 
    //db���������� ������, �����Ŀ� SQL���� ����ϱ����� �ʿ��� statement��ü�� ��ȯ�ϴ�
    //openConnection �޼ҵ带 �����մϴ�.
    public Statement openConnection(){
        try{
            Class.forName(driverName);
            con=DriverManager.getConnection(url,db_id,db_pw);
            stmt=con.createStatement();
        }catch(Exception e){
            System.err.println("Oracle Database Connection Something Problem!!");
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return stmt;
    }
 
    //������ �����ϱ����� closeConnection �޼ҵ带 �����մϴ�.
    public void closeConnection(){
        try {
            if(!con.isClosed())//������ �ʾ�����
                con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}