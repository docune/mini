package study.jsp.mysite.model;

public class Teacher {
	private int id;
	private String subject;
	private String univ;
	private String intro;
		
	public Teacher(int id, String subject, String univ, String intro) {
		super();
		this.id = id;
		this.subject = subject;
		this.univ = univ;
		this.intro = intro;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getUniv() {
		return univ;
	}


	public void setUniv(String univ) {
		this.univ = univ;
	}


	public String getIntro() {
		return intro;
	}


	public void setIntro(String intro) {
		this.intro = intro;
	}

	@Override
	public String toString() {
		return "Teacher [id=" + id + ", subject=" + subject + ", univ=" + univ
				+ ", intro=" + intro + "]";
	}

}
