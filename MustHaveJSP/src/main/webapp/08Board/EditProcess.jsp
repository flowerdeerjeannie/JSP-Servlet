<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<% 
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

BoardDTO dto = new BoardDTO();
dto.setNum(num);
dto.setTitle(title); //폼값을 받아서 DTO에 저장함. 
dto.setContent(content);

//DB에 반영하는 과정
BoardDAO dao = new BoardDAO(application);
int affected = dao.updateEdit(dto);
dao.close();

if(affected ==1 ) { //성공 시 상세보기 페이지, 실패 시 이전 페이지로 이동.
	response.sendRedirect("View.jsp?num= " + dto.getNum());
}
else {
	JSFunction.alertBack("수정하기에 실패하였습니다",out);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>