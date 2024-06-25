<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h2>musthave가 작성한 board 목록 출력</h2>
	<%
		JDBConnect jdbc = null;
		try {
			jdbc = new JDBConnect();
			
			String sql = "SELECT num, title, content, id, postdate, visitcount FROM board";
			Statement stmt = jdbc.con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
	%>
	<table>
		<tr>
			<th>번호</th>
	        <th>제목</th>
	        <th>내용</th>
	        <th>작성자</th>
	        <th>작성일</th>
	        <th>조회수</th>
	     </tr>
	     
	<%
			while (rs.next()){
				int num = rs.getInt(1);
				String title = rs.getString("title");
				String content = rs.getString("content");
				String id = rs.getString("id");
				java.sql.Date postdate = rs.getDate("postdate");
				int  visitcount = rs.getInt("visitcount");
	 %>
		<tr>
			<td><%= num %></td>
			<td><%= title %></td>
			<td><%= content %></td>
			<td><%= id %></td>
			<td><%= postdate %></td>
			<td><%= visitcount %></td>
		</tr>
		<%
			}
		%>
	</table>
		<% 
		} catch (Exception e) {
			out.println(e.getMessage());

		} finally {
			
			if (jdbc != null)
		jdbc.close();
			
		}
		%>
</body>
</html>