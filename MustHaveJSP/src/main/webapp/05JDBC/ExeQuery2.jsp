<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
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
		String dir = request.getParameter("id");
	
		if (dir==null || dir.isEmpty()){
			dir="musthave"; //defaultvalue 해주는게안전함 널이고 갑없으면 그냥 musthave로 기본설정!!
		}
	
		JDBConnect jdbc = null;
		PreparedStatement stmt= null;
		ResultSet rs = null;
		
		try {
			jdbc = new JDBConnect();
			
			String sql = "SELECT num, title, content, id, postdate, visitcount FROM board WHERE id=?";
			//sql문 실컷적어놓고 prepare는 쿼리문에 ?로 파라미터를 해줘야한다는거 깜빡함 ㅠ 변화할 파라미터부분을 ?로설정해주고 밑에서 받아주기 
			stmt = jdbc.con.prepareStatement(sql);
			stmt.setString(1, dir);
			
			rs=stmt.executeQuery();
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
	     
	    <% while (rs.next()) { %>

		<tr>
			<td><%= rs.getInt("num") %></td>
			<td><%= rs.getString("title") %></td>
			<td><%= rs.getString("content") %></td>
			<td><%=  rs.getString("id")%></td>
			<td><%= rs.getDate("postdate") %></td>
			<td><%= rs.getInt("visitcount") %></td>
		</tr>
		<%
			}
		%>
	</table>
		<% 
		   } catch (SQLException e) {
		        out.println("SQL Exception: " + e.getMessage());
		    } catch (Exception e) {
		        out.println("Exception: " + e.getMessage());
		    } finally {
		        // Close JDBC resources in finally block
		        try {
		            if (rs != null) rs.close();
		            if (stmt != null) stmt.close();
		            if (jdbc != null) jdbc.close();
		        } catch (SQLException e) {
		            out.println("Error closing JDBC resources: " + e.getMessage());
		        }
		    }
		%>
</body>
</html>