package org.sms.bean;



public class EmailBean{
	
	private String queryEmail;
	private String querySubject;
	private String qyeryMsg;
	private String queryContact;
	
	

	public String getQueryContact() {
		return queryContact;
	}

	public void setQueryContact(String queryContact) {
		this.queryContact = queryContact;
	}

	public String getQueryEmail() {
		return queryEmail;
	}

	public void setQueryEmail(String queryEmail) {
		this.queryEmail = queryEmail;
	}

	public String getQuerySubject() {
		return querySubject;
	}

	public void setQuerySubject(String querySubject) {
		this.querySubject = querySubject;
	}

	public String getQyeryMsg() {
		return qyeryMsg;
	}

	public void setQyeryMsg(String qyeryMsg) {
		this.qyeryMsg = qyeryMsg;
	}

}
