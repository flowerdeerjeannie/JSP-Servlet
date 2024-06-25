<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%
String num = request.getParameter("num"); //num을 일련번호로 받아서 num에 저장
BoardDAO dao = new BoardDAO(application); //DAO생성
BoardDTO dto = dao.selectView(num); //게시물 가져오기 
String sessionId = session.getAttribute("UserId").toString(); //로그인id얻기,
if(!sessionId.equals(dto.getId())){ //본인인지 확인하는 함수. dto게시물의 작성자 id랑 현재 session의 id가 equal한지 확인 
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
	return;
}
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script type="text/javascript">
function validateForm(form){
	if (form.title.value == "") {
		alert("제목을 입력하세요.");
		form.title.focus();
		return false;
	}
	if (form.content.value =="") {
		alert("내용을 입력하세요.");
		form.content.focus();
		return false;
	}
}
</script>
</head>
<body>
<jsp:include page="../Common/Link.jsp" />
<h2> 회원제 게시판 - 수정하기(Edit)</h2>
<form name="writeFrm" method="post" action="EditProcess.jsp"
	onsubmit="return validateForm(this);">
	<input type="hidden" name="num" value="<%= dto.getNum() %>" />
	<table border="1" width="90%" >
		<tr>
			<td> 제목 </td>
			<td>
				<input type="text" name="title" style="width:90%;" value="<%= dto.getTitle() %>" />
				<%--기존 게시물의 제목,내용을 각각의 입력 폼에 미리 채워진채로 value값이 나오게 할수있도록 하기위하여 이렇게 함수를 넣어서 사용함.  --%>
			</td>
		</tr>
		<tr>
			<td> 내용 </td>
			<td>
				<textarea name="content" style="width:90%; height:100px;"> <%= dto.getContent() %></textarea>
			</td>
			
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit"> 작성 완료 </button>
				<button type="reset"> 다시 입력 </button>
				<button type="button" onclick="location.href='List.jsp';"> 목록 보기 </button>
			</td>
		</tr>
	</table>
</body>
</html>