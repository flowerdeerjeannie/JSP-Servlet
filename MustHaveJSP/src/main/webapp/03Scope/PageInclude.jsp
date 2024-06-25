<%@ page import="common.Person"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4>Include 페이지</h4>
	<%
	int pInteger2 = (Integer)(pageContext.getAttribute("pageInteger")); 
	Person pPerson2 = (Person)(pageContext.getAttribute("pagePerson"));  
	//include된페이지. 이동이 없는 페이지라서 객체의 속성값을 읽어내올수가있음
	//이렇게하면 이동없이 한페이지로뜸 그냥보여지는 컴포처럼
	%> 
   	<ul>
		<li>Integer 객체 : <%= pInteger2 %></li>
		<li>String 객체 : <%= pageContext.getAttribute("pageString") %></li>
		<li>Person 객체 : <%= pPerson2.getName() %>,<%= pPerson2.getAge() %></li> 
	</ul>
