<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forEach 1</title>
</head>
<body>
	<h4> 일반 for문 형태의 forEach 태그</h4>
	<!-- step=1은 1씩 증가한다. var는 변수명 -->
	<c:forEach begin="1" end="3" step="1" var="i">
		<p> 반복 ${ i } 입니다</p>
	</c:forEach>
	
	<h4>varStatus 속성 살펴보기</h4>
	<table border="1">
	<!-- 변수명을 loop로 지정했고 활용할수있는 고정안된변수임 varStatus -->
	<c:forEach begin="3" end="5" var="i" varStatus="loop">
		<tr>
			<!-- count-실제 반복횟수, index=i의 현재값, current는 변수 i의 현재 값 
			first는 루프의 처음일때 true, last는 루프의 마지막일때 true-->
			<td>count : ${ loop.count }</td> 
			<td>index : ${ loop.index }</td>
			<td>current : ${ loop.current }</td>
			<td>first : ${ loop.first }</td>
			<td>last : ${ loop.last }</td>
		</tr>
	</c:forEach>
	</table>
	
	<h4>1에서 100까지 정수 중 홀수의 합</h4>
	<c:forEach begin="1" end="100" var="j">
		<c:if test="${ j mod 2 ne 0 }">
		<!-- 조건을 걸어서 이 조건 만족하는 경우, 즉 j가 짝수인 경우에만 sum 출력됨 -->
			<c:set var="sum" value="${ sum + j }" />
		</c:if>
	</c:forEach>
	1~100사이 정수 중 홀수의 합은? ${ sum } 
</body>
</html>