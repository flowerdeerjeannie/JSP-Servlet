<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%
//폼값 받기.
String title=request.getParameter("title");
String content=request.getParameter("content");

//폼값을 dto 객체에 저장하려고
BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);
dto.setId(session.getAttribute("UserId").toString());

//dao객체가 application을 받으면 db랑 자동 연결 된다했음 JDBConnect의 application을 super로 받았기 때문에
//dao객체를 통하여 dto를 db에 저장하고, dao해제함 
BoardDAO dao = new BoardDAO(application);
int iResult=dao.insertWrite(dto);

dao.close();

if(iResult==1) {
	response.sendRedirect("List.jsp");
} else {
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
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