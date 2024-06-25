package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class QueryByStatement {
	
	public static void main(String[] args) {
			Connection con = null;

		try {String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/world";
			String username = "scott";
			String password = "tiger";
			
			Class.forName(driver); // JDBC 드라이버 클래스를 로드
			con = DriverManager.getConnection(url, username, password); //주어진 URL, 사용자 이름, 비밀번호를 사용하여 데이터베이스에 연결하고 Connection 객체를 반환
			
			Statement st = con.createStatement(); //Statement 객체생성
			ResultSet rs=st.executeQuery("select id, name, countrycode, district, population from city limit 10");
			//쿼리 실행한 결과 rs에 저장
			
			while(rs.next()) {
			System.out.println(rs.getString("id")+"."); //getInt가 될수도 있고 getBoolean 일수도 있지만 모르면 getString
			System.out.println(rs.getString("name")+",");
			System.out.println(rs.getString("countrycode")+",");
			System.out.println(rs.getString("district")+",");
			System.out.println(rs.getString("population")+"\n");
		}
		rs.close();
		st.close();
		con.close();
		
		} catch(Exception e) {
			System.out.println("연결실패"+e.getMessage());
		}

	}
}
