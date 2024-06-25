<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%--로그인을 해야 글쓰기가 가능하도록 로그인확인 이걸 include함 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script tye="text/javascript">
function validateForm(form) { //폼에 값이 있는지 확인하는 함수 
	if (form.title.value == ""){
		alert("제목을 입력하세요.");
		form.title.focus();
		return false;
	}
	if (form.content.value == "") {
		alert("내용을 입력하세요.");
		form.content.focus();
		return false;
	}
}
</script>
</head>
<body>
<jsp:include page="../Common/Link.jsp" />
<h2> 회원제 게시판 - 글쓰기 (Write)</h2> <%--폼의 이름, 전송 방식(post), 폼값 전송 경로 지정.  --%>
<form name="writeFrm" method="post" action="WriteProcess.jsp"
	onsubmit="return validateForm(this);"> <%--submit 이벤트가 발생했을 때 해당 함수를 호출하도록. 검증함수인 이게 false를 반환하면 폼값을 전송하지 않도록 해줌 --%>
	<table border="1" width="90%">
		<tr>
			<td> 제목</td>
			<td>
				<input type="text" name="title" style="width: 90%;" />
			</td>
		</tr>
		<tr>
			<td> 내용 </td>
			<td>
				<textarea name ="content" style="width: 90%; height: 100px;">
				</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit"> 작성 완료 </button>
				<button type="reset"> 다시 입력 </button>
				<button type="button" onClick="location.href='List.jsp';"> 목록 보기 </button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>