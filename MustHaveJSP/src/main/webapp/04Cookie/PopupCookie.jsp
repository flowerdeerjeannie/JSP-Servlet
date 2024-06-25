<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String chkVal = request.getParameter("inactiveToday"); //inactiveToday 매개변수의 값 얻어내기 이므로 
//실제 저게 오는게 아니고 {inactiveToday:chkVal} 의 값인 chkVal이 오는것임 

	if (chkVal != null && chkVal.equals("1")) { //chkVal 값이 null도 아니고 딱 1이면 쿠키를 생성해 응답 객체에 추가
		Cookie cookie = new Cookie("PopupClose", "off"); //쿠키 생성, 경로 설정, 시간 설정, 응답객체 추가
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		out.println("쿠키:하루동안 열지 않음");
	}
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