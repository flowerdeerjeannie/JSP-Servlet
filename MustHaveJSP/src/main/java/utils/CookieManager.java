package utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieManager {
	//새로운 쿠키 생성 메소드. 쿠키생성.경로설정.유지기간.response에 추가 똑같음 
	public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime) {
		Cookie cookie = new Cookie(cName, cValue);
		cookie.setPath("/");
		cookie.setMaxAge(cTime);
		response.addCookie(cookie);
	}
	
	//조건에 건 쿠키 찾아서 반환하는 메소드. cookieValue는 빈값으로 string만들어주고 시작하는거 똑같음, 이 string에다가 해당하는 쿠키를 찾아서 반환할거임 
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue = "";
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null) { //cookies에 값이 있다는 전제하에 
			for (Cookie c:cookies) { //하나하나 값을 순회하면서 cookieName에다가 그 네임값을 저장하고
				String cookieName = c.getName(); 
				if (cookieName.equals(cName)) { //그 쿠키네임이 해당하는 cName. 내가 찾고자하는거랑 동일해지는 순간에는 cookieValue에 그값을 넣는다 
					cookieValue = c.getValue();
				}
			}
		}
		return cookieValue;
	}
	public static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response, cName, "", 0);
	}
}
