<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그-UseBean</title>
</head>
<body>
	<h3> 액션 태그로 폼값 한 번에 받기</h3>
	<jsp:useBean id="person" class="common.Person" />
	<jsp:setProperty property="*" name="person" />
	<%--property에 *를 사용하면 멤버 변수 이름을 안써도 폼값이 한번에 저장됨. name은 그냥 그 객체이름 --%>
	<ul>
		<li> 이름: <jsp:getProperty name="person" property="name" /></li>
		<li> 나이: <jsp:getProperty name="person" property="age" /></li>
	</ul>
</body>
</html>