package membership;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	//원래 driver, 어쩌구, url, 다써줬던걸 자주 쓰니깐 상속을 받는 것으로 하고
	//생성자 만들어서 super로 다 받아주면 String Driver= 어쩌구 안쓰고 편하게 쓸수있음

	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	//getMemberDTO가 메서드임 MemberDTO는 타입임 헷갈릴수있으니 잘봐야함 
	//MemberDTO는 int처럼 그럴때 타입이라는거
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto=new MemberDTO();
		String query = "SELECT * FROM member WHERE id=? AND pass=?";
		
		try {
			//psmt에 쿼리문 컴파일한거를 저장함. 
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery(); //쿼리실행 결과를 rs에 저장함. 
			
			if(rs.next()) { //결과 처리, 쿼리 결과로 얻은 회원정보를 다시 dto에 set=저장. 
				dto.SetId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto; 
	}

}
