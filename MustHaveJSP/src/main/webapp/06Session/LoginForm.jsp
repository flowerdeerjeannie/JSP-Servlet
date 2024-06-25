<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>로그인 페이지</h2>
	<span style="color: red; font-size: 1.2em;">
		<%= request.getAttribute("LoginErrMsg") == null ? //request 내장 객체 중에서 LoginErrMsg를 찾아보고 있으면 그 속성을 get함 
				"" : request.getAttribute("LoginErrMsg") %>
	</span>
	<%
	if(session.getAttribute("UserId") == null) { //session에 UserId가있는지 확인함, null로 뜨면 저장되지 않은 것=로그아웃 상태. 
												//이 값이 null이면 아래 else 위까지의 함수를 실행함. 
	%>
	<script>
	function validateForm(form){ //이 스크립트가 출력되게끔 하는거 자체를 함수로 지정함
		if(!form.user_id.value){ //form에 user_id.value가 없으면 알람발생
			alert("아이디를 입력하세요.");
			return false;
		}
		if (form.user_pw.value == ""){
			alert("패스워드를 입력하세요.");
			return false;
		}
	}
	</script>
	<form action="LoginProcess.jsp" method="post" name="loginFrm" 
		onsubmit="return validateForm(this);"> <%--값이 들어가고 나면 post 방식으로 action 이하인 jsp에다가 그 값을 post하게 만들고,
												핸들클릭처럼 onsubmit을 달아서, submit이 되면 validateForm 이라는 함수를 호출하도록 함.--%>
		아이디 : <input type="text" name="user_id" /><br />
		패스워드 : <input type="password" name="user_pw" /><br /> 
		<input type="submit" value="로그인하기" />
	</form>
	<%
	} else {
	%>
		<%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다. <br />
		<a href="Logout.jsp">[로그아웃]</a> <%--session.getAttribute("UserId")를 통해서 값이 있는지 없는지를 본거를 통해서 이미 로그인되어 있는 상태면 이거 보여지게함. --%>
	<%
	}
	%>
</body>
</html>