package edu.pnu.dao3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public abstract class MemberDao {
	protected Scanner sc; // 나는 원래 여기 static을 붙였었는데 그러면 인스턴스에 속하는 것이 되므로 제거해야함. 하위클래스에서 접근할수있도록 protected해주기
	protected Connection con;

	public MemberDao(Scanner sc, Connection con) { // 생성자가 아예 없는 상태에서는 클래스가 있어도 사용할수없으므로 위 sc와 con을 클래스 내에서 사용할 수 있도록 자기걸로 만드는 만드는 사람이 등장해야됨.
		this.sc = sc; // 이렇게 생성자 통해서 필드 변수가 초기화되어야 사용할 수 있음.아니면 사용불가
		this.con = con;
	}

	public abstract void insertMember(Connection con) throws SQLException;

	public abstract void updateMember(Connection con) throws SQLException;

	public abstract void deleteMember(Connection con) throws SQLException;

	public abstract void selectMember(Connection con) throws SQLException;

}

class MemberDaoStatement extends MemberDao {
	
	//얘는 생성자.반드시 호출해줘야 필드사용가능
	public MemberDaoStatement(Scanner sc, Connection con) { //부모 클래스의 생성자를 호출하기 위하여 여기서도 생성자를 만들어줌.
		super(sc,con); //따로 this 하지 않고 그대로 super써줌으로서 부모클생성자 호출이 명시적으로 완료됨.
	}
	
	//메인은 클래스 레벨에서 정의되어 있기 때문에 모든 메소드가 공유할 수 있음.
	//따라서 sc, con 둘다 main 안에서 생성하고 전달할 수 있도록 해야함.
	//아래 두 코드는 클래스나 메서드 안에 직접 작성 X 메인 바디 내 설정.
	public static void main(String[] args) { 

		try {Scanner sc = new Scanner(System.in);
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musthave","scott","tiger");
			//얘는 이 클래스 내의 인스턴스. 메소드를 호출하기 위해서는 인스턴스를 만들어주어야 한다.
			MemberDaoStatement ms = new MemberDaoStatement(sc, con); //내가 놓친 점 이 생성자에 파라미터 sc,con을 안줌.
			//but 메인메소드에서 메소드를 바로 호출할때는 인스턴스 만들 필요가 없다고 하네...;
			boolean flag = true;

			while(flag) {
				System.out.print("[I]nsert/[U]pdate/[D]elete/[S]elect/e[X]it:");
				String s = sc.next().toUpperCase(); //사용자가 무엇을 입력하든 upper해서 s에 저장함니다
				switch(s) {
				case "I" :ms.insertMember(con);break;
				case "U" :ms.updateMember(con);break;
				case "D" :ms.deleteMember(con);break;
				case "S" :ms.selectMember(con);break;
				case "X" : flag=false;
				}
					
	    } System.out.println("DONE!");
	    
		} catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	@Override
	public void insertMember(Connection con) throws SQLException {
			System.out.println("Insert just pass (enter) name. Id will be automatically made.");
			String pass = sc.next();
			String name = sc.next();
			
			try {
				PreparedStatement ps = con.prepareStatement("insert into member(pass,name) values (?,?)");
				ps.setString(1,pass);
				ps.setString(2,name);
				ps.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}

	@Override
	public void updateMember(Connection con) throws SQLException {
		System.out.println("Update Member");
		int id = sc.nextInt();
		String pass = sc.next();
		String name = sc.next();
		
		try {
			PreparedStatement ps = con.prepareStatement("update member set pass=? name=? where id=?");
			ps.setString(1, pass);
			ps.setString(2, name);
			ps.setInt(3, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMember(Connection con) throws SQLException {
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

	@Override
	public void selectMember(Connection con) throws SQLException {
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
