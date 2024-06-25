<%@ page import="common.Person"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 영역</title>
</head>
<body>
	<h2>포워드로 전달된 페이지</h2>
	<h4>RequestMain 파일의 리퀘스트 영역 속성 읽기</h4>
	<%
	Person pPerson = (Person)(request.getAttribute("requestPerson"));
	%>
	<ul>
		<li> String 객체 : <%=request.getAttribute("requestString") %></li>
		<li> Person 객체 : <%=pPerson.getName() %>, <%=pPerson.getAge() %></li>
	</ul>
	<h4> 매개변수로 전달된 값 출력하기</h4>
	<%--한글이 포함되어 있기 때문에 인코딩방식 utf-8 해주고, 쿼리스트링으로 전달받은 매개변수 값을 출력하는 과정.. 
	파라미터를 받아서 출력하도록 되었기 때문에 메인페이지와 연결되는것 --%>
	<%
		request.setCharacterEncoding("UTF-8");
		out.println(request.getParameter("paramHan"));
		out.println(request.getParameter("paramEng"));
	%>
</body>
</html>