package membership;

public class MemberDTO { //멤버변수,필드 선언하고 각각의 getter setter 만들어줌 
	private String id;
	private String pass;
	private String name;
	private String regidate;

	public String getId() { 
		return id;
	}
	
	public void SetId(String id) {
		this.id=id;
	}
	
	public String getPass() {
		return pass;
	}
	
	public void setPass(String pass) {
		this.pass=pass;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name=name;
	}
	
	public String getRegidate() {
		return regidate;
	}
	
	public void setRegidate(String regidate) {
		this.regidate=regidate;
	}
	
}
