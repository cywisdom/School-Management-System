package org.sms.bean;

public class AttendenceBean {
	
	private String standard;
	private String section;
	private String course;
	private String date;
	private int grade_Id;
	private int classroom_Id;
	private int course_Id;
	
	
	public int getCourse_Id() {
		return course_Id;
	}
	public void setCourse_Id(int course_Id) {
		this.course_Id = course_Id;
	}
	public int getGrade_Id() {
		return grade_Id;
	}
	public void setGrade_Id(int grade_Id) {
		this.grade_Id = grade_Id;
	}
	public int getClassroom_Id() {
		return classroom_Id;
	}
	public void setClassroom_Id(int classroom_Id) {
		this.classroom_Id = classroom_Id;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	

}
