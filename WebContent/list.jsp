<%@page import="java.util.regex.Pattern"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>
<%@ page import="com.board.beans.Board" %> 
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>����! �Խ��� - �Խñ� ����Ʈ</title>
	<!-- ������ ��ܿ� �ߴ� �����Դϴ�. -->
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
	<%
		try {
			String driverName = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:Orcl";
			ResultSet rs = null;
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(url, "Ohha", "1234");
			out.println("Oracle Database Connection Success.");
			Statement stmt = con.createStatement();
			String sql = "select * from board order by idx desc";
			rs = stmt.executeQuery(sql);
			
			ArrayList<Board> articleList = new ArrayList<Board>();
			
			while (rs.next()) {

				Board article = new Board(); //�����͵��� ������� Board��ü�� �޸𸮸� �Ҵ��ϴ� �ڵ��Դϴ�.

				article.setIdx(rs.getInt("idx")); // Integer.parseInt�� String���� int�������� ����ȯ
				article.setTitle(rs.getString("title"));
				article.setWriter(rs.getString("writer"));
				article.setRegdate(rs.getString("regdate"));
				article.setCount(rs.getInt("count"));
				articleList.add(article); // ���õ� ���� ����Ʈ�� �߰��մϴ�.
			}
			request.setAttribute("articleList", articleList); // ���õ� ����Ʈ�� �信 �������մϴ�.
	
			con.close();
		} catch (Exception e) {
			out.println("Oracle Database Connection Something Problem. <hr>");
			out.println(e.getMessage());
			e.printStackTrace();
		}
	%>
	<body>
		<!-- HTML������ �� ������ ���� �κ��Դϴ�. -->
		<h1>�Խñ� ����Ʈ</h1>
		<!-- ������ �۾��� ǥ���ϴ� �±��Դϴ�. -->
		<table>
			<!-- ǥ ������ �����͸� ǥ���ϴ� �±��Դϴ�. -->
			<tr>
				<!-- table�±� ������ ���� �����Ҷ� ���� �±��Դϴ�. -->
				<th>��ȣ</th>
				<!-- Table Header�� ���ڷ� table�±� ������ -->
				<th>����</th>
				<!-- �����ϰ���� �÷��� ��Ÿ���� ���� �±��Դϴ�. -->
				<th>�ۼ���</th>
				<th>��¥</th>
				<th>��ȸ��</th>
			</tr>
				<c:forEach items="${articleList}" var="article">
			<tr>
				<td>${article.idx}</td><!-- jstl�� ǥ������ ��ũ��Ʈ���� �Ӽ��� ���Ƽ� ��𿡾��� �켱�� -->
				<td><a href='content.jsp?idx=${article.idx}'>${article.title}</a></td>
				<td>${article.writer}</td>
				<td>${article.regdate}</td>
				<td>${article.count}</td>
			</tr>
		</c:forEach>
		</table>
		<a href="write.jsp">�۾���</a>
	</body>
</html>