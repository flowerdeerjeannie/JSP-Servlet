<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--빈리스트 만들고 객체 추가 후, session에다가 속성을 저장하는데 속성 이름이 lists. 타입이 아니고 속성을 식별하기 위한 문자열ㅇㅣ자 key!!!
    lists는 실제 저장 값 --%>
<%
	ArrayList<String> lists= new ArrayList<String>();
	lists.add("리스트");
	lists.add("컬렉션");
	session.setAttribute("lists",lists);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 영역</title>
</head>
<body>
	<h2>페이지 이동 후 session 영역의 속성 읽기</h2>
	<a href="SessionLocation.jsp">SessionLocation.jsp 바로가기</a>
</body>
</html>