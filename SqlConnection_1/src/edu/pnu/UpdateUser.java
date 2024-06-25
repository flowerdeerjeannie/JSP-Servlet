package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class UpdateUser {
	private static Connection con = null;

	public static void main(String[] args) {

		PreparedStatement ps = null;
		
		try
			{
			Scanner sc = new Scanner(System.in);

			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musthave", "scott", "tiger");
			String sql = "update member set pass=?, name=? where id=?"; 
			ps = con.prepareStatement(sql); 
			
			System.out.println("update success");
			selectUser(con);
			updateUser(con, sc); //try안에 scanner쓴걸 인자로 넘겨줘야 updateUser 실행할때 가능 
			
			} catch(Exception e) {
				e.printStackTrace();
				
			} finally {
				try {
					if (ps != null) ps.close();
					if (con != null) con.close();
					
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}

	//모든 행을 일단 먼저 보여주는 메소드임. 
	private static void selectUser(Connection con) {
		  try { //따로 파라미터 설정없이 바로 모든걸 보도록 하는 selectUser임.select라고 해서 선택이라기보다는 다 보여주는거 
			 String sql = "SELECT * FROM member";
			 Statement st = con.createStatement(); //create는 직접 컴파일 없이, 실행 후에 쿼리 받아서그때그때 컴파일하므로 () 인자값 안받음. st는 데이터베이스로 쿼리 보내기위한 역할. 질문던지기-st
			 ResultSet rs = st.executeQuery(sql); //결과반환값이 있으니 쿼리문하고, rs에 저장.
			 
			while(rs.next()) {
				System.out.print("id:"+rs.getString("id")); //getInt가 될수도 있고 getBoolean 일수도 있지만 모르면 getString
				System.out.print(", pass:"+rs.getString("pass"));
				System.out.println(", name:"+rs.getString("name"));
			}
				rs.close();
			    st.close();
			
		  	} catch (SQLException e) {
		        e.printStackTrace();
		    }
		}

	private static void updateUser(Connection con, Scanner sc) {
		int id = sc.nextInt();
		String pass = sc.next();
		String name = sc.next(); //필드(변수)설정->스캐너 통해 값을 입력받고
		//try 안에서 쿼리문 설정, ps에 컴파일 전달하고 ps.setInt.. 등등 내가 원하는 바를 써줌
		try {//파라미터 사용할때는 prepareStatement.  
			PreparedStatement ps = con.prepareStatement("update member set pass=?, name=? where id=?");
			ps.setInt(3, id); //ps에 파라미터를 전달해주는 형태이므로 ***setId가 아닌 setInt 해서 (위치, id) 로 전달함.
			ps.setString(1, pass);
			ps.setString(2, name);
			
			ps.executeUpdate();
			
			//executequery는 rs 결과 집합을 반환, update는 상태변경이므로 반환 없음.
		} catch (SQLException  e) {
	        e.printStackTrace();
		}
		
	}

}