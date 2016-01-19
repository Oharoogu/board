<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ page import="java.util.regex.Pattern"%>
	<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="EUC-KR">
<title>본격! 게시판 - 게시글 리스트</title>
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
    
    if(title == "" || title == null) out.println("title이 null입니다.");
    
    if(writer == "" || writer == null) out.println("writer가 null입니다.");
    else if(!Pattern.matches("^[a-zA-Z0-9]+@[a-zA-Z0-9]+$", writer)) out.println("이메일 형식이 아닙니다.");
    
    if(regdate == "" || regdate == null) out.println("regdate가 null입니다.");
    else if(!Pattern.matches("^[0-9]*$", regdate))out.println("숫자형식이 아닙니다.");
    
    if(content == "" || content == null) out.println("title이 null입니다.");
    
    try {
        String driverName = "oracle.jdbc.driver.OracleDriver"; //데이터베이스에 접속하기위한 드라이버를 로드합니다.
        String url = "jdbc:oracle:thin:@localhost:1521:Orcl";            //접속 URL정보와 포트번호(oracle포트), sid(oracle버전)
        Class.forName(driverName);
        Connection con = DriverManager.getConnection(url,"Ohha","1234");    // getCo... : 계정정보 url, id, pw
        out.println("Oracle 데이터베이스 db에 성공적으로 접속했습니다");
        Statement stmt = con.createStatement();            // SQL 쿼리를 날리기위한 Statement 객체 생성
        String sql = "INSERT INTO BOARD "+
           "(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT) "+
           "VALUES (board_seq.nextval, '"+title+"', '"+writer+"' , sysdate, "+1+", '"+content+"')";
       stmt.executeUpdate(sql);
        con.close();
   } catch (Exception e) {
        out.println("Oracle 데이터베이스 db 접속에 문제가 있습니다. <hr>");
        out.println(e.getMessage());
        e.printStackTrace();
   }finally{
       out.print("<script>location.href='list.jsp';</script>");

   }
	%>
</body>
</html>