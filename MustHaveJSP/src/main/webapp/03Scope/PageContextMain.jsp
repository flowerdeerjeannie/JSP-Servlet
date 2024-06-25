<%@ page import="common.Person"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   pageContext.setAttribute("pageInteger", 1000); //pageContext 객체를 통해 속성값 저장함. setAttribute
   pageContext.setAttribute("pageString", "페이지 영역의 문자열");
   pageContext.setAttribute("pagePerson",new Person("한석봉", 99));
   %>   
<html>
<head>
<meta charset="UTF-8">
<title>page 영역</title></head>
<body>
	<h2>page 영역의 속성값 읽기</h2>
	<%
	int pInteger = (Integer)(pageContext.getAttribute("pageInteger")); //저기서 타입이 object이므로, 원래 타입대로 () 형변환을 해준다. 
	String pString = pageContext.getAttribute("pageString").toString(); //getAttribute 통해서 속성값 읽어온다. 기본이 object 이므로 앞에 (String)하든지 뒤에 toString()
	Person pPerson = (Person)(pageContext.getAttribute("pagePerson")); //아래Person객체에서 멤버변수값 읽어오기 위하여 get사용.private 선언되었으니까// 
	%> 
	<ul>
		<li>Integer 객체 : <%= pInteger %></li>
		<li>String 객체 : <%= pString %></li>
		<li>Person 객체 : <%= pPerson.getName() %>,<%= pPerson.getAge() %></li> 
	</ul>
	<h2>include된 파일에서 page 영역 읽어오기</h2> 
	<%@ include file="PageInclude.jsp"  %> 
	
	<h2>페이지 이동 후 page 영역 읽어오기</h2>
	<a href="PageLocation.jsp">PageLocation.jsp 바로가기</a>
</body>
</html>