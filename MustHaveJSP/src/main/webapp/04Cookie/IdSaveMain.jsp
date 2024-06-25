<%@ page import="utils.CookieManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginId = CookieManager.readCookie(request, "loginId"); //loginId로 저장되어있는 아이디가 있다면 저기 value에서 사용될거임 
	String cookieCheck = "";
	if (!loginId.equals("")){   //cookieCheck 변수의 값을 설정함. loginId가 빈게 아니라면 => 체크다 즉 loginId에 문자열이 무언가 있다면 checked로 속성 부여한다.
	cookieCheck="checked";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie-아이디 저장하기</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<form action="IdSaveProcess.jsp" method="post">
	아이디: <input type="text" name="user_id" value="<%= loginId %>" /> 
		<%--표현식을 사용하여 value 기본값을 설정하고 있음!!  --%>
		<input type="checkbox" name="save_check" value="Y" <%= cookieCheck%> />
		아이디 저장하기
	<br />
	패스워드 : <input type = "text" name = "user_pw" />
	<br />
	<input type="submit" value="로그인하기" />
	</form>
</body>
</html>