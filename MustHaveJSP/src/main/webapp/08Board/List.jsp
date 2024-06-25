<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
BoardDAO dao = new BoardDAO(application);  //BoardDAO 타입의 dao객체 생성하는데, 이 생성 과정에서 db랑 연결 완료 됨 
//사용자가 입력한 검색 조건을 Map에 저장함
Map<String, Object> param = new HashMap<String, Object>(); //사용자가 입력한 검색조건내용들이 map 형태로 param에 저장됨 

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if(searchWord != null) {
	param.put("searchField",searchField);
	param.put("searchWord",searchWord);
}

int totalCount = dao.selectCount(param); //게시물 수 확인-사용자가 입력한 검색조건을 param에 넣어둔거 그거를 매개변수로 받았으니깐 dao에서 selectcount메서드를 호출해서, 그 검색 조건에 맞는 count만 뱉어줌 
List<BoardDTO> boardLists = dao.selectList(param); //게시물 목록 받기
dao.close();


%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2> 목록 보기(List)</h2>
	<!-- 검색폼: 전송방식 method는 get이고, action을 따로 지정안해서 submit하면 폼값이 현재 페이지로 전송됨. -->
	<form method="get">
	<table border="1" width="90%">
	<tr>
		<td align="center">
			<select name="searchField"> <%--searchField는 아래와 같이 title이랑 content중 선택할 수 있기 때문에 있을때 없을때를 밑에서 구분하여 처리하게됨 --%>
				<option value="title"> 제목 </option>
				<option value="content"> 내용</option>
			</select>
			<input type="text" name="searchWord" />
			<input type="submit" value="검색하기" />
		</td>
	</tr>
	</table>
	</form>
	<!-- 게시물 목록 테이블(표) -->
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
<%
	if(boardLists.isEmpty()) {
	%>	<%--boardList에 저장된 내용이 하나도 없는 경우. --%>
			<tr>
				<td colspan="5" align="center">
					등록된 게시물이 없습니다.
				</td>
			</tr>
	<%
}
	else {  //게시물이 있는 경우에는 for문을 돌면서 하나씩 dto를 출력함. 
		int virtualNum = 0; //화면 상에서의 게시물 번호를 말함. 
		for (BoardDTO dto : boardLists)
		{
			virtualNum = totalCount--; //순회하면서 출력할때마다, 화면상에서의 게시물 번호는 전체 게시물 수에서 시작하면서 1씩 감소한 값으로 출력됨
	%>
			<tr align="center">
				<td><%= virtualNum %></td> <!-- 게시물 번호 -->
				<td align="left"> <!-- 제목과 하이퍼링크. 누르면 해당 num과 제목을 가진 페이지로 이동함:상세보기 -->
					<a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a>		
				</td><!-- 순서대로 dto객체에 저장된 작성자 아이디, 조회수, 작성일을 출력해줌 -->
				<td align="center"><%= dto.getId() %></td>
				<td align="center"><%= dto.getVisitcount() %></td>
				<td align="center"><%= dto.getPostdate() %></td>
			</tr>
	<%
		}
	}
%>
		</table> <%--목록 하단의 글쓰기 버튼을 말함 --%>
		<table border="1" width="90%">
			<tr align="right">
				<td><button type="button" onclick="location.href='Write.jsp';">글쓰기 </button></td>
			</table>
	
</body>
</html>