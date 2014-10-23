package org.sms.bean;

public class StudentRegistrationBean {

	private String fname;
	private String mname;
	private String lname;
	private String dob;
	private String gender;
	private String regno;
	private String grade;
	private String addressLine1;
	private String addressLine2;
	private String phpn = null;
	private String pmno = null;
	private String pfax = null;
	
	private String email;
	private String password;
	private String section = null;
	
	private String aboutMe;
	private String joiningYear;
	
	private String interest;
	private String imagepath;

	
	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	
	
	public String getImagepath() {
		return imagepath;
	}

	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}

	public String getJoiningYear() {
		return joiningYear;
	}

	public void setJoiningYear(String joiningYear) {
		this.joiningYear = joiningYear;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public String getRegno() {
		return regno;
	}

	public void setRegno(String regno) {
		this.regno = regno;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getPhpn() {
		return phpn;
	}

	public void setPhpn(String phpn) {
		this.phpn = phpn;
	}

	public String getPmno() {
		return pmno;
	}

	public void setPmno(String pmno) {
		this.pmno = pmno;
	}

	public String getPfax() {
		return pfax;
	}

	public void setPfax(String pfax) {
		this.pfax = pfax;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
