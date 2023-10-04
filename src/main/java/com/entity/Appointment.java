package com.entity;

public class Appointment {
  private int id;
  private int userid;
  private String fullname;
  private String gender;
  private String age;
  private String appointmentdate;
  private String email;
  private String phoneno;
  private String diseases;
  private int doctorid;
  private String fulladdress;
  private String status;

  public Appointment() {
	super();
	// TODO Auto-generated constructor stub
}

public Appointment(int userid, String fullname, String gender, String age, String appointmentdate, String email,
		String phoneno, String diseases, int doctorid, String fulladdress, String status) {
	super();
	this.userid = userid;
	this.fullname = fullname;
	this.gender = gender;
	this.age = age;
	this.appointmentdate = appointmentdate;
	this.email = email;
	this.phoneno = phoneno;
	this.diseases = diseases;
	this.doctorid = doctorid;
	this.fulladdress = fulladdress;
	this.status = status;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public int getUserid() {
	return userid;
}

public void setUserid(int userid) {
	this.userid = userid;
}

public String getFullname() {
	return fullname;
}

public void setFullname(String fullname) {
	this.fullname = fullname;
}

public String getGender() {
	return gender;
}

public void setGender(String gender) {
	this.gender = gender;
}

public String getAge() {
	return age;
}

public void setAge(String age) {
	this.age = age;
}

public String getAppointmentdate() {
	return appointmentdate;
}

public void setAppointmentdate(String appointmentdate) {
	this.appointmentdate = appointmentdate;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getPhoneno() {
	return phoneno;
}

public void setPhoneno(String phoneno) {
	this.phoneno = phoneno;
}

public String getDiseases() {
	return diseases;
}

public void setDiseases(String diseases) {
	this.diseases = diseases;
}

public int getDoctorid() {
	return doctorid;
}

public void setDoctorid(int doctorid) {
	this.doctorid = doctorid;
}

public String getFulladdress() {
	return fulladdress;
}

public void setFulladdress(String fulladdress) {
	this.fulladdress = fulladdress;
}

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}


}
