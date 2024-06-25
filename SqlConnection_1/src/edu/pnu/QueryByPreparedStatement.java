package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class QueryByPreparedStatement {
//prepared->컴파일된 쿼리를 db에 저장하므로, 동일한 쿼리를 실행할때마다 컴파일 안해도 돼서.
	
	public static void main(String[] args) {

		Connection con = null;

		try {
			String DRIVER = "com.mysql.cj.jdbc.Driver";
			String URL = "jdbc:mysql://localhost:3306/world";
			String USERNAME = "scott";
			String PASSWORD = "tiger";
			
			//1.DRIVER 로드 2.url,username,password 정보를 넘겨서 connection 되도록 얘한테 정보를 저장
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

			//sql쿼리를 컴파일하여 보관하도록 prepareStatement하여 쿼리문 전달하고, pt에 저장함
			PreparedStatement pt = 
					con.prepareStatement("select id, name, countrycode, district,population from city where name like ? and population>? limit ?");
			pt.setString(1, "S%");
			pt.setInt(2, 100000); //그냥 statement랑 다른점=파라미터를 pt에 전달하였으므로, 따로 string을 설정할수있다. 첫번째 ? 에 Seoul을 넣는다는 뜻
			pt.setInt(3, 5);
			ResultSet rs = pt.executeQuery();
			
			//4.쿼리 실행 및 결과 얻기
			while (rs.next()) {
				System.out.print(rs.getInt("id") + ",");
				System.out.print(rs.getString("name") + ",");
				System.out.print(rs.getString("countrycode") + ",");
				System.out.print(rs.getString("district") + ",");
				System.out.println(rs.getInt("population") + ",");
			}
			//5.자원 해제
			rs.close();
			pt.close();
			con.close();

		//6.예외처리
		} catch (Exception e) {
			System.out.println("연결실패" + e.getMessage());
		}
	}

}
