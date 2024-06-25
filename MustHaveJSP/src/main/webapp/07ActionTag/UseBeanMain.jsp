<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - UseBean</title>
</head>
<body>
	<h2>useBean 액션 태그</h2>
	<h3>자바빈즈 생성하기</h3>
	<%--객체 이름, 객체의 클래스명, 객체 영역을 지정하여 자바빈즈를 생성해준다. class 이하는 임포트하는거라고 생각하면됨--%>
	<jsp:useBean id="person" class="common.Person" scope="request" />
	
	<h3>setProperty 액션 태그로 자바빈즈 속성 지정하기</h3>
	<%--setProperty를 통하여. 이름 / 속성명 / 설정값  --%>
	<jsp:setProperty name="person" property="name" value="임꺽정" />
	<jsp:setProperty name="person" property="age" value="41" />
	
	<h3>getProperty 액션 태그로 자바빈즈 속성 읽기</h3>
	<ul>
		<li> 이름 : <jsp:getProperty name="person" property="name" /></li>
		<li> 나이 : <jsp:getProperty name="person" property="age" /></li>
		
	</ul>
</body>
</html>