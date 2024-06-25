<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
// 필드 변수 선언
String str1 = "JSP";
String str2 = "안녕하세요!!";

//메소드 선언
public int add(int num1, int num2) {
	return num1+num2;
}
public int mul(int num1, int num2){
	return num1*num2;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 요소</title>
</head>
<body>
<% //메소드 호출을 비롯한 로직처리 작성.(선언은 안됨.호출만 가능), ! 없는 얘는 그냥 jspService 메소드 내에 포함됨. 

int result1;
int result2;

try {
	int num1 = Integer.parseInt(request.getParameter("num1")); //getParameter하면 무조건 string만 넘어오므로 변환타입 필수
	int num2 = Integer.parseInt(request.getParameter("num2"));
	
	result1 = add(num1, num2);
	result2 = mul(num1, num2);
	
} catch(Exception e){
		result1 = 0;
		result2 = 0;
}
%>

덧셈 결과 1: <%= result1 %> <br />
덧셈 결과 2: <%= add(30,40) %> <br />
곱셈 결과 1: <%= result2 %> <br />
</body>
</html>