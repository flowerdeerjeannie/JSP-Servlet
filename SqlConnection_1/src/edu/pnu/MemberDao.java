package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class MemberDao {
	private static Connection con = null; //con은 메인메소드 아닌 클래스에 바로 선언해줌으로서 다른 메소드들에서 전역변수로 사용할수있음 
	
	public static void main(String[] args) {
		PreparedStatement ps = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musthave","scott","tiger");
			boolean flag = true;
			Scanner sc = new Scanner(System.in);
			while(flag) {
				System.out.print("[I]nsert/[U]pdate/[D]elete/[S]elect/e[X]it:");
				String s = sc.next().toUpperCase(); //사용자가 무엇을 입력하든 upper해서 s에 저장함니다
				switch(s) {
				case "I" : insertMember(con, sc);	break;
				case "U" : updateMember(con, sc);	break;
				case "D" : deleteMember(con, sc);	break;
				case "S" : selectAllMember(con);	break;
				case "X" : flag=false;				break;
				
			}
		}
		System.out.println("DONE!");

	} catch (Exception e) {
		e.printStackTrace();

	}
}
	
		private static void insertMember(Connection con, Scanner sc) throws SQLException {
			System.out.println("Insert just pass (enter) name. Id will be automatically made.");
			String pass = sc.next();
			String name = sc.next();
			
			try {
				PreparedStatement ps = con.prepareStatement("insert into member(pass,name) values (?,?)");
				ps.setString(1,pass);
				ps.setString(2, name);
				ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		private static void updateMember(Connection con,Scanner sc) throws SQLException {
			System.out.println("Update Member");
			int id = sc.nextInt();
			String pass = sc.next();
			String name = sc.next();
			
			try {
				PreparedStatement ps = con.prepareStatement("Update member set pass=?, name=? where id=?");
				ps.setString(1, pass);
				ps.setString(2, name);
				ps.setInt(3, id);
				ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		private static void deleteMember(Connection con, Scanner sc) throws SQLException {
			System.out.println("Delete Member");
			int id = sc.nextInt();
			
			try {
				PreparedStatement ps = con.prepareStatement("delete from member where id=?");
				ps.setInt(1, id);
				ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
			
		private static void selectAllMember(Connection con)throws SQLException {
			System.out.println("Select Member");
			
			try {
				PreparedStatement st = con.prepareStatement("select * from member");
				ResultSet rs = st.executeQuery();
				
				while (rs.next()) {
					System.out.print("id"+rs.getString("id"));
					System.out.print(","+rs.getString("pass"));
					System.out.println(","+rs.getString("name"));		
				}				
				rs.close();
				st.close();
				
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
		}
	}



