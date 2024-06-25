<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<h2>쿠키(Cookie) 설정</h2>
	<%
	Cookie cookie = new Cookie("MyCookie", "쿠키맛나요");
	cookie.setPath(request.getContextPath());
	cookie.setMaxAge(3600);
	response.addCookie(cookie); //응답 헤더에 쿠키 추가
	%>
	
	<h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
	<%
	Cookie[] cookies = request.getCookies(); //요청 헤더-request에서 모든 쿠키값 얻어와서 cookies에넣기 
	if(cookies!=null){
		for (Cookie c : cookies) {
		String cookieName = c.getName(); //각각쿠키의네임
		String cookieValue = c.getValue(); //각각쿠키의밸류
		out.println(String.format("%s:%s<br />", cookieName, cookieValue));
		}
	}
	%>
	
	<h2>3.페이지 이동 후 쿠키값 확인하기</h2>
	<a href="CookieResult.jsp">
	다음 페이지에서 쿠키값 확인하기
	</a>
</body>
</html>