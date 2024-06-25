<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.setMaxInactiveInterval(1800);
%>
    <%
    SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss"); //이방식으로 날짜를 표시하도록 객체생성
    
    long creationTime = session.getCreationTime();
    String creationTimeStr = dateFormat.format(new Date(creationTime));
    
    long lastTime = session.getLastAccessedTime();
    String lastTimeStr = dateFormat.format(new Date(lastTime));%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<h2>Session 설정 확인</h2>
		<ul>
			<li>세션 유지 시간 : <%= session.getMaxInactiveInterval() %></li>
			<li>세션 아이디 : <%= session.getId() %></li>
			<li>최초 요청 시각 : <%= creationTime %></li>
			<li>마지막 요청 시각 : <%= lastTimeStr %></li>
		</ul>

</body>
</html>