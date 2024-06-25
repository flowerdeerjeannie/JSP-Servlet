package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class MemberDao_ByStatement {
	private static Connection con = null;
	
	public static void main(String[] args) {
		Statement st = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musthave","scott","tiger");
			boolean flag = true;
			Scanner sc = new Scanner(System.in);
			while(flag) {
				System.out.print("[I]nsert/[U]pdate/[D]elete/[S]elect/e[X]it:");
				String s = sc.next().toUpperCase();
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
			System.out.println("Insert Member pass / name. Id will be automatically made.");
			String pass = sc.next();
			String name = sc.next();
			
			try {
				Statement st = con.createStatement();
				st.executeUpdate("insert into member(pass,name) values ('"+pass+"','"+name+"')");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//prepared에서 statement로 사용할때 제일 헤맸던부분 update
		//id 잘못 입력하지 않도록 하는 while문 만들려고 id/ pass.name 따로 만들어보았음 
		private static void updateMember(Connection con,Scanner sc) throws SQLException {
			System.out.println("Update Member");
		    int id = 0;
		    //id값 0으로 상정하고 while문 돌려서 올바른 정수 입력하면 아래로 갈수있고, 아니면 메세지 출력할수 있도록 함 
		    while (true) {
		        System.out.print("정수형의 id를 입력하시와요 ");
		        try {id = sc.nextInt();
		            break; // 올바른 정수 입력 시 루프 종료
		        } catch (InputMismatchException e) {
		            System.out.println("정수입력바람.");
		            
		            sc.next(); // 잘못된 입력값을 버립니다.
		        }
		    }
		    
		    System.out.println("Enter new password and name");
			String pass = sc.next();
			String name = sc.next();
			String sql="UPDATE member SET pass='%s', name='%s' WHERE id='%d', pass, name, id";

		    // Statement 객체 생성 및 SQL 실행
		    try (Statement st = con.createStatement()) {
		        int R = st.executeUpdate(sql); //sql을 실행한 결과가 아니라, 몇 개의 행을 건드렸는지를 R에 저장하므로 R은 숫자가됨. //query는 resultSet에 그 결과를 저장함.
		        if (R > 0) {
		            System.out.println("업데이트 성공");
		        } else {
		            System.out.println("존재하지 않는 id를 입력하셨습니다.");
		        }
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		private static void deleteMember(Connection con, Scanner sc) throws SQLException {
			System.out.println("Delete Member");
			int id = sc.nextInt();
			
			try {
				Statement st = con.createStatement();
				st.executeUpdate("delete from member where id='"+id+"'");

			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
			
		private static void selectAllMember(Connection con)throws SQLException {
			System.out.println("Select Member");
			
			try {
				Statement st = con.createStatement();
				String sql=("select * from member");
				ResultSet rs = st.executeQuery(sql);
				
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



