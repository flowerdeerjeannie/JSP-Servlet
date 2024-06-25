<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="common.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - set 2</title>
</head>
<body>
	<h4> List 컬렉션 이용하기 </h4>
	<%--Person객체가 들어갈 pList생성하고 new Person통해서 객체추가 --%>
	<%
	ArrayList<Person> pList = new ArrayList<Person>();
	pList.add(new Person("성삼문", 55));
	pList.add(new Person("박팽년", 60));
	%>
	<%--이 컬렉션을 scope=request통해서 request 영역에 넣어둠 --%>
	<c:set var="personList" value="<%= pList %>" scope="request" />
	<ul>
		<li> 이름 : ${ requestScope.personList[0].name }</li>
		<li> 나이 : ${ personList[0].age }</li>
		<%--다른영역에 저장한게 없으므로 어차피 request라서, requestScope 부분 생략해준것 --%>
	</ul>
	
	<h4> Map 컬렉션 이용하기 </h4>
	<%
	Map<String, Person> pMap = new HashMap<String, Person>();
	pMap.put("personArgs1", new Person("하위지", 65));
	pMap.put("personArgs2", new Person("이개", 67));
	%>
	<c:set var="personMap" value="<%= pMap %>" scope="request" />
	<ul>
		<li> 이름 : ${ requestScope.personMap.personArgs2.name }</li>
		<li> 나이 : ${ personMap.personArgs2.age }</li>
	</ul>
</body>
</html>