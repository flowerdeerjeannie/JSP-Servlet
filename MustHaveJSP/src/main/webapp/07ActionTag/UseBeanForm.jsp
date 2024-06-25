<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그-UseBean</title>
</head>
<body>
	<h2>액션 태그로 폼값 한 번에 받기</h2>
	<form method="post" action="UseBeanAction.jsp" >
		이름: <input type="text" name="name" /><br />
		나이: <input type="text" name="age" /><br />
		<%--input의 name 속성에 지정한 이름을 통해서 폼값이 전송된다. 이 name은 그 person의 변수이름이랑 똑같음.--%>
		<input type="submit" value="폼값 전송" />
	</form>
</body>
</html>