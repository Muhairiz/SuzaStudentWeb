package com.suza.model;

public class Attendance {

	private int id,week;
	private String date,course,studentReg,studentName,status,recorded;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getWeek() {
		return week;
	}
	public void setWeek(int week) {
		this.week = week;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getStudentReg() {
		return studentReg;
	}
	public void setStudentReg(String studentReg) {
		this.studentReg = studentReg;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getRecorded() {
		return recorded;
	}
	public void setRecorded(String recorded) {
		this.recorded = recorded;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
}
