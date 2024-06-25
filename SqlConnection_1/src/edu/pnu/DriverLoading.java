package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverLoading {

	public static void main(String[] args) throws ClassNotFoundException, SQLException { //control+space+enter
		Class.forName("com.mysql.cj.jdbc.Driver"); //load path
		
		System.out.println("로딩 성공?");
		
		Connection con=DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/world", "scott", "tiger");
		
		System.out.println("연결 성공!");
		
		con.createStatement(); //질의가능한객체생성
		
//		Statemenet의 메서드 사용법!
//		1.ResultSet executeQuery(String sql) - select
//		2.int executeUpdate(String sql)	- select를 제외한 나머지 질의, 해당하는 count가 리턴됨
//		3.boolean execute(String sql) - 모든 질의

		
		}
}
