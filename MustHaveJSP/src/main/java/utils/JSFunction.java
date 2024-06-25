package utils;

import jakarta.servlet.jsp.JspWriter;

public class JSFunction {
	//메세지 알림창을 띄운 후 특정 url로 이동하도록 도와줌
	public static void alertLocation(String msg, String url, JspWriter out) { //msg는 알림창에 띄울 메세지. url은 알림창을 닫은 후 이동할 페이지 주소. 
		//out은 자바스크립트 코드를 삽입할 출력스트림. 
		try {
			String script = "" //삽입할 자바스크립트 코드 기술
						+"<script>"
						+"	alert('"+msg+"');"
						+"	location.href='" + url + "';"
						+"</script>";
			out.println(script);//자바스크립트 코드를 out 내장 객체로 출력(삽입)
		}
		catch(Exception e) {
			
		}
}
//메세지 알림창을 띄운 후 이전 페이지로 돌아감 인데 url 지정없이 무조건 이전페이지로 백 
public static void alertBack(String msg, JspWriter out) {
	try {
		String script = ""
					+"<script>"
					+"	alert('"+msg+"');"
					+"	history.back();"
					+"</script>";
		out.println(script);
	}
	catch(Exception e) {}

	}
}
