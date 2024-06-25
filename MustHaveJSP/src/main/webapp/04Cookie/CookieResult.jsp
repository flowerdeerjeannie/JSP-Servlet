<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieResult.jsp</title>
</head>
<body> 
 <%--a href를 누르면 서버한테 쿠키 받아서 저장해놨던거를 요청 헤더에 담아 서버로 전송하고, 출력이 여기서 가능해지는거임 .1시간동안은. --%>
	<h2>쿠키값 확인하기(쿠키가 생성된 이후의 페이지)</h2>
	<%
	Cookie[] cookies = request.getCookies();
	if (cookies != null){
		for (int i=0; i<cookies.length; i++){
			String cookieName = cookies[i].getName();
			String cookieValue = cookies[i].getValue();
			out.println(String.format("쿠키명: %s - 쿠키값 : %s<br/>", cookieName, cookieValue));
			}
		}
	%>
</body>
</html>