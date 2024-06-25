<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//request통해서 폼으로 들어온 id,pw값을 각각 저장함.
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");

//web.xml에 저장해둔 dr,url,id,pwd정보를 데이터베이스랑 연결함 - db랑 연결해야 로그인 성공 실패 여부 확인 가능하므로. 
String MySQLDriver=application.getInitParameter("MySQLDriver");
String MySQLURL=application.getInitParameter("MySQLURL");
String MySQLId=application.getInitParameter("MySQLId");
String MySQLPwd=application.getInitParameter("MySQLPwd");

//회원테이블DAO, dao라는객체는 저거 다 얻어올수있는 애라서 
//얘를 타입으로 하는 dto 만들고 dto에다가 id, pw 저장해줌. 
MemberDAO dao=new MemberDAO(MySQLDriver, MySQLURL,MySQLId,MySQLPwd);
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
dao.close();

//로그인성공여부에 따른 처리 설명-memberDTO객체에 id값을 get해본다 null이 아니라면
if(memberDTO.getId() != null){
	//로그인 성공시 세션에다가 이걸 저장해줘요. 
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getName());
	response.sendRedirect("LoginForm.jsp"); //저장후 로그인 페이지로 리디렉트!! 이동하고
	//이 속성값들은 session영역에 저장되어 웹 닫을때까지 모든 페이지에서 공유함.
}
else { //로그인 실패하면 request에 이걸 저장하고 
	//다시 로그인폼 페이지로 포워드한다. 
	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
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