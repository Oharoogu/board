<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ page import="java.util.regex.Pattern"%>
	<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="EUC-KR">
<title>����! �Խ��� - �Խñ� ����Ʈ</title>
<style type="text/css">
		table, td, th {
			border: 1px solid green;
		}
		th {
			background-color: green;
			color: white;
		}
</style>
</head>
<script>

	</script>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
    String title = request.getParameter("title");
    String writer = request.getParameter("writer");
    String regdate = request.getParameter("regdate");
    String content = request.getParameter("content");
    
    if(title == "" || title == null) out.println("title�� null�Դϴ�.");
    
    if(writer == "" || writer == null) out.println("writer�� null�Դϴ�.");
    else if(!Pattern.matches("^[a-zA-Z0-9]+@[a-zA-Z0-9]+$", writer)) out.println("�̸��� ������ �ƴմϴ�.");
    
    if(regdate == "" || regdate == null) out.println("regdate�� null�Դϴ�.");
    else if(!Pattern.matches("^[0-9]*$", regdate))out.println("���������� �ƴմϴ�.");
    
    if(content == "" || content == null) out.println("title�� null�Դϴ�.");
    
    try {
        String driverName = "oracle.jdbc.driver.OracleDriver"; //�����ͺ��̽��� �����ϱ����� ����̹��� �ε��մϴ�.
        String url = "jdbc:oracle:thin:@localhost:1521:Orcl";            //���� URL������ ��Ʈ��ȣ(oracle��Ʈ), sid(oracle����)
        Class.forName(driverName);
        Connection con = DriverManager.getConnection(url,"Ohha","1234");    // getCo... : �������� url, id, pw
        out.println("Oracle �����ͺ��̽� db�� ���������� �����߽��ϴ�");
        Statement stmt = con.createStatement();            // SQL ������ ���������� Statement ��ü ����
        String sql = "INSERT INTO BOARD "+
           "(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT) "+
           "VALUES (board_seq.nextval, '"+title+"', '"+writer+"' , sysdate, "+1+", '"+content+"')";
       stmt.executeUpdate(sql);
        con.close();
   } catch (Exception e) {
        out.println("Oracle �����ͺ��̽� db ���ӿ� ������ �ֽ��ϴ�. <hr>");
        out.println(e.getMessage());
        e.printStackTrace();
   }finally{
       out.print("<script>location.href='list.jsp';</script>");

   }
	%>
</body>
</html>