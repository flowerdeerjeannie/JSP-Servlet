<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String popupMode = "on"; //레이어 팝업창 띄울지 여부.

	Cookie[] cookies = request.getCookies(); //request getcookies 통하여 쿠키값 읽어옴, 쿠키객체 만들어서 response에 응답객체에 추가했으니까
	//여기서 request를 통하여 요청하면 받아와지는것임 
	if (cookies != null){
		for (Cookie c:cookies){
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			if (cookieName.equals("PopupClose")) { //얻어내서 쿠키네임중에 Popupclose가 있으면 
				popupMode = cookieValue; //popupMode의 값을 걔의 밸류로 갱신함,
										//Cookie cookie = new Cookie("PopupClose", "off");
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업 관리 ver 0.2</title>
<style>
	div#popup {
		position: absolute; top:100px; left:50px; color:yellow;
		width:270px; height:100px; background-color:gray;
	}
	div#popup>div {
		position: relative; background-color:#ffffff; top:0px;
		border:1px solid gray; padding:10px; color:black;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(function(){ 
	//아까 밑에서 id값이 이거였던 버튼. 얘를 누르면 이하의 함수가 실행된다. 팝업이라는애가 숨겨짐!!
	$('#closeBtn').click(function(){
		$('#popup').hide();
		
		var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
		//id가 inactiveToday이면서 체크된상태의. 체크박스의 val() 값을 읽어와서 chkVal에 넣는데
		//<input type="checkbox" id="inactiveToday" value="1" /> 이 부분에 의해서 
		//이 인풋타입인 체크박스의 value가 1이라서, chkVal도 1인게 성립하는거임 
		if (chkVal==1){
			$.ajax({ //비동기 요청을 보내는 제이쿼리
				url : './PopupCookie.jsp', //요청을 보낼 페이지 url
				type : 'get', //메소드.get이나 post등
				data : {inactiveToday:chkVal}, //서버로 보낼 데이터는 {} 이거에요. Parameter로 받을거에요
				dataType : "text", //서버로부터 리퀘스트를 통하여 받을 데이터의 타입
				success : function(resData) { //요청 성공할 시 resData가 있다면
					if (resData != '') location.reload(); //페이지를 리로드해서 새로고침 
				}
			});
		}
	});
});
</script>
</head>
<body>
<h2>팝업 메인 페이지(ver 0.2)</h2>
<%
	for(int i=1; i<=10; i++){
	out.print("현재 팝업창은"+popupMode+"상태입니다.<br/>");
	}

	if (popupMode.equals("on")){ //popupMode 밸류값이 on이면 이 밑의 div가 보이고. off면 없는거지 
%>

	<div id="popup">
		<h2 align="center"> 공지사항 팝업입니다. </h2>
		<div alighn="right"><form name="popFrm">
			<input type="checkbox" id="inactiveToday" value="1" />
			하루 동안 열지 않음
			<input type="button" value="닫기" id="closeBtn" /> 
			<%--이거의 아이디가 closeBtn인걸 잘봐야지 그래야 저 $('#closeBtn') 제이쿼리에서 이거를 쓰는걸 이해한다구 --%>
		</form></div>
	</div>
<%
	}
%>
</body>
</html>