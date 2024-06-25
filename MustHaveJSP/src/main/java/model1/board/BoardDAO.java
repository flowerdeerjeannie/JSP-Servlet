package model1.board;


import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class BoardDAO extends JDBConnect{
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM BOARD";
		if (map.get("searchWord") != null) {					//Map컬렉션에 이 저장값이 null이 아닌 경우=저장값이 있는 경우 아래 쿼리문을 실행. 
			query += " WHERE " + map.get("searchField")+" "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		
		try {
			stmt=con.createStatement(); //쿼리 실행하기 위한 stmt 객체생성-con.---statement
			rs = stmt.executeQuery(query); //그 객체에서 쿼리를 실행해가지고 rs에 반환
			rs.next(); //커서를 이동시켜 결과값 있는지 확인한다. 
			totalCount = rs.getInt(1); //첫번째칼럼의 값을 가져와서토탈카운트로 추출.반환하겠다. rs객체의 1번 인덱스 결과를 int로 추출한다. 
		}
		
		catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;

	}	
	
	public List<BoardDTO> selectList(Map<String, Object> map) { //map 이거는 검색 조건이 매개변수가 되는거임.
		List<BoardDTO> bbs = new Vector<BoardDTO>(); //vector라는것도 list같은건데. 테이블에서 레코드를 가져올때는 항상 arraylist나 list계열 컬렉션을 사용하는데 그중하나가 vector임. 
		
		String query = "SELECT * FROM BOARD ";
		if (map.get("searchWord") != null) { //searchWord는 검색단어. 검색단어가 있느냐없느냐 
			query += " WHERE " + map.get("searchField") + " " //searchfield는 말그대로 검색조건값.필터값임 뭐 타이틀이던지 작성자든지.. 
					+ " LIKE '%" + map.get("searchWord") + "%' ";
		}
		
		query += " ORDER BY num DESC"; //최근게시물이 맨위로 올라올수있도록 desc 추가함 
		
		try {
			stmt=con.createStatement();
			rs=stmt.executeQuery(query);
			
			while (rs.next()) { //커서를 움직이며 결과를 순회하면서, 한 행. 게시물 하나의 내용을 DTO에 저장한다. while-더이상 행이 존재하지 않을때까지 무한반복.
				
				BoardDTO dto = new BoardDTO (); //boardDTO 객체 생성해서 저장할수있도록 만들어놓음, dto하나는 아래의 정보들을 가진 객체
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(dto); //결과목록 bbs에다가 dto를 저장함. 이 dto는 list컬렉션에 담기고, bbs는 아까 위에 만들어둔 vector(list컬렉션타입) 타입의 컬렉션임 
			}
		}
		catch(Exception e) {
			System.out.println("게시물 조회 중 예외발생");
			e.printStackTrace();
		} 
		return bbs;
	}
	
	public List<BoardDTO> selectListPage(Map<String,Object> map){
		List<BoardDTO> bbs = new Vector<BoardDTO>();
	
		String query = "SELECT * FROM BOARD ";
		
		if(map.get("searchWord") != null) {
	        query += " WHERE " + map.get("searchField") + " LIKE ? ";

		}
		
		query += " ORDER BY NUM DESC limit ?,? ";
		
		try {
			psmt=con.prepareStatement(query);
			
			int paramIndex = 1;
			if (map.get("searchWord") != null) {
	            psmt.setString(paramIndex++, "%" + map.get("searchWord") + "%");
			}
			
			psmt.setInt(paramIndex++, (int)map.get("start"));
			psmt.setInt(paramIndex, (int)map.get("pageSize"));
			rs=psmt.executeQuery();
			
	while (rs.next()) { //커서를 움직이며 결과를 순회하면서, 한 행. 게시물 하나의 내용을 DTO에 저장한다. while-더이상 행이 존재하지 않을때까지 무한반복.
				
				BoardDTO dto = new BoardDTO (); //boardDTO 객체 생성해서 저장할수있도록 만들어놓음, dto하나는 아래의 정보들을 가진 객체

				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));

				bbs.add(dto); // 결과목록 bbs에다가 dto를 저장함. 이 dto는 list컬렉션에 담기고, bbs는 아까 위에 만들어둔 vector(list컬렉션타입)
								// 타입의 컬렉션임
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외발생");
			e.printStackTrace();
		}
		return bbs;
	}
	
	//게시글 데이터를 받아 db에 추가하도록 하는 메서드. dto타입의 객체, 내용이 담겨있는 매개변수를 받아서 데이터를 insert함 
	public int insertWrite(BoardDTO dto) {
		int result = 0; //result는 정수로, 성공한 행의 갯수를 정수로 반환한다는걸 알수있음 
		
		try { 
			String query = " INSERT INTO board ( "
							+ " num, title, content, id, visitcount) " 
							+ " VALUES ( "
							+ " NULL, ?, ?, ?, 0)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		
		String query = "SELECT B.*, M.name "
					+ " FROM member M INNER JOIN board B "
					+ " ON M.id = B.id "
					+ " WHERE num=?"; 
		
		try { 
			psmt=con.prepareStatement(query);
			psmt.setString(1,num);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString("name"));
			}
		}
		catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	public void updateVisitCount(String num) {
		String query = " UPDATE board SET "
				 	+ " visitcount = visitcount+1"
				 	+ " WHERE num=? ";
		
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeUpdate();
		} 
		catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	public int updateEdit(BoardDTO dto) {
		int result= 0;
		
		try {
			String query = " UPDATE board SET "
					 	+ " title=?, content=? "
					 	+ " WHERE num=? ";
			
			psmt=con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			result=psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deletePost(BoardDTO dto) {
		int result= 0;
		
		try {
			String query = "DELETE FROM board WHERE num=? ";
			
			psmt=con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			
			result=psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}

}

