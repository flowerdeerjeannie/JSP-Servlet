package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertSql {

	public static void insertUser(member usr) {
		Connection con = null;
		PreparedStatement ps = null;
	
		try
			{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musthave", "scott", "tiger");
			String sql = "insert into member(id, pass, name) values (?,?,?)"; 
			ps = con.prepareStatement(sql); //con.create나 prepare로 컴파일한걸 ps에 저장.
			
			//ps.set 형태
			ps.setInt(1,usr.getId());
			ps.setString(2,usr.getPass());
			ps.setString(3,usr.getName());
			//insert에서 생기는부분
			ps.executeUpdate();

			System.out.println("insert success");
			
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
	
//	private int deleteUser throws SQLException {
//		Connection con = 
//		
//		Statement st = con.createStatement();
//		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musthave", "scott", "tiger");
//		int ret = st.executeUpdate("delete from member"); //delete 뒤 조건이 없기 때문에 모두 삭제됨, ret은 갯수.
//		st.close();
//		System.out.println("deleted:"+ret);
//		return ret;
//	}

	public static void main(String[] args) {
		for (int i = 1; i <= 10; i++) {
			member usr = new member();
			usr.setId(i);
			usr.setPass("password"+(i+100));
			usr.setName("name"+(i+100));
			
			//위에 메소드가 insertUser임. usr에는 10개짜리 데이터를 가진채로 저 insertUser메소드를 실행하게 됨.
			insertUser(usr);
		}
	}
}

class member {
	private int id;
	private String pass;
	private String name;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getPass() {
		return pass;
	}
	
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
}
