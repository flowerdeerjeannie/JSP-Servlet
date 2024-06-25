package common;

public class Person { //데이터 저장.전송을 위해 쓰이는 객체 DTO를 만들어줌. 
	private String name; //1.바로 자바파일에 만들지 말고 common같은 패키지 만들고! 이 객체 만들어 줄것
	private int age; //2.멤버 변수 접근 지정자는 ***private으로 선언 
	 
	public Person() {} //3.***기본생성자 만들어주어야함

	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

	public String getName() { //4.변수를 private으로 설정해 주었으므로 이 변수들에 접근할 수 있도록 getter,setter. 
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
}
