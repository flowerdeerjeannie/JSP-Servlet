<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//로그아웃을 처리하는 방법 1. 세션에서 속성을 각각 지운다.
session.removeAttribute("UserId");
session.removeAttribute("UserName");

//2. 세션에서 모든 속성을 한번에 지운다.
session.invalidate();

//3. 속성 삭제 후 리디렉트로 loginForm 페이지로 이동한다.
response.sendRedirect("LoginForm.jsp");
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