<%@ page import="common.Person"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>page 영역</title>
</head>
<body>
	<h2>이동 후 page 영역의 속성값 읽기</h2>
   <% 
   Object pInteger = pageContext.getAttribute("pageInteger"); //속성값을 읽어내와본다. page영역의 속성값 읽어내는과정-get을 통하여
   Object pString = pageContext.getAttribute("pageString");
   Object pPerson = pageContext.getAttribute("pagePerson");  //이 페이지는 a태그를 통해 눌렀을때의 페이지를 구현하는데, 
   //페이지를 이동하므로 page영역이 공유되지 않아서 속성값이 없음.으로 뜸 
   %>
   <ul>
	   	<li>Integer 객체 : <%= (pInteger == null) ? "값 없음" : pInteger %></li>
	   	<li>String 객체 : <%= (pString == null) ? "값 없음" : pString %></li>
	   	<li>Person 객체 : <%= (pPerson == null) ? "값 없음" : ((Person)pPerson).getName()%></li>
   </ul>
</body>
</html>