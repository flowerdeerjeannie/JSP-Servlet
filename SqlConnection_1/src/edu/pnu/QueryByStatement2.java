package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class QueryByStatement2 {

    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/world";
    private static final String USERNAME = "scott";
    private static final String PASSWORD = "tiger";

    
    public static void main(String[] args) {
    	Connection con;
    	Statement st; 
    	
    	try {// 데이터베이스 연결 설정
    		con = getConnection();
    		st =con.createStatement(); //여기서 만들어진 st를 계속 받아서 쓸수있도록 하기위해 쿼리들에 인자로 st를 전달함 
    		
    		Scanner sc = new Scanner(System.in);
	        while (true) {
	            System.out.println("=".repeat(80));
	            System.out.println(">>Select[0:Exit]");
	            System.out.println("[1].수도 이름과 함께 국가 이름을 검색합니다");
	            System.out.println("[2].세계에서 인구가 가장 많은 상위 5개 도시의 이름과 인구를 검색합니다. ");
	            System.out.println("[3].미국(United States)에 있는 모든 도시의 이름을 검색합니다.");
	            System.out.println("[4].중국(China)에서 사용되는 모든 언어의 이름을 검색합니다.");
	            System.out.println("[5].인구가 100만 명 이상인 유럽 국가의 이름을 검색합니다.");
	            System.out.println("[6].1900년 이후 독립한 국가의 이름을 검색합니다.");
	            System.out.println("[7].영어가 공용어가 아니고 국민총생산(GNP)이 1,000보다 큰 국가의 이름을 검색합니다.");
	            int sel = sc.nextInt();
	            System.out.println("=".repeat(80));
	
	            if (sel == 0)
	                break;
	            switch (sel) {
	                case 1:
	                    query1(st); //try 시작할때 만든 st를 쿼리에 넘겨줘야 동작이 가능함.
	                    break;
	                case 2:
	                    query2(st);
	                    break;
	                case 3:
	                    query3(st);
	                    break;
	                case 4:
	                    query4(st);
	                    break;
	                case 5:
	                	query5(st);
	                	break;
	                case 6:
	                	query6(st);
	                	break;
	                case 7:
	                	query7(st);
	                	break;
	                default:
	                    System.out.println("Please select 1, 2, 3, 4, 5, 6 or 7.");
	            }
	        }
	        sc.close(); //while문이 끝나는 자리에서 close 
	        
        } catch (Exception e) {
            System.out.println("연결실패: " + e.getMessage());
        }
    }

	//getConnection 메소드, driver라는 클래스에서 이름 가져오고 url.username,password를 전달하여 커넥션합니다 
    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName(DRIVER);
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    private static void query1(Statement st) {
        String query = "select c.name, ci.name from country c,city ci where c.Capital=ci.id";
        executeQuery(st, query);
    }

    private static void query2(Statement st) {
        String query = "select name population from city order by population desc limit 5";
        executeQuery(st, query);
    }

    private static void query3(Statement st) {
    	String query = "select name from city where countrycode='USA'";
        executeQuery(st, query);
    }
    
    private static void query4(Statement st) {
    	String query = "select language from countrylanguage where countrycode='CHN'";
    	executeQuery(st, query);
    }
    
	private static void query5(Statement st) {
		String query = "select name from country where continent like 'europe' and population >= 1000000";
		executeQuery(st, query);	
	}

	private static void query6(Statement st) {
		String query = "select name,IndepYear from country where IndepYear>=1900 order by IndepYear asc";
		executeQuery(st, query);	
	}

	private static void query7(Statement st) {
		String query = "select distinct c.name from countrylanguage cl, country c " +
                "where cl.language='English' and cl.IsOfficial='F' and c.GNP > 1000 and cl.countrycode = c.code";  
		executeQuery(st, query);
	}
    
    //executeQuery에 query를 전달받았을때 실행문- 연결은 항상 trycatch 사용해서 작성
    private static void executeQuery(Statement st, String query) { //데이터베이스 연결에 사용되는 객체-1.connection, 2.statement, 3.resultset
        try (ResultSet rs = st.executeQuery(query))        
         	{ 
        	int columnCount = rs.getMetaData().getColumnCount(); //결과 집합의 열 수만큼 반복문 돌려고 columncount 설정
            while (rs.next()) {
                for (int i = 1; i <= columnCount; i++) {
                    System.out.print(rs.getString(i) + "\t");
                }
                System.out.println();
            }
            
        } catch (Exception e) {
            System.out.println("연결실패: " + e.getMessage());
        }
    }
}