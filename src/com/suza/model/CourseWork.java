package com.suza.model;

public class CourseWork {

	private int cwId;
	private double score;
	private String student,course,recorder,cwDate;
	public int getCwId() {
		return cwId;
	}
	public void setCwId(int cwId) {
		this.cwId = cwId;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getStudent() {
		return student;
	}
	public void setStudent(String student) {
		this.student = student;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getRecorder() {
		return recorder;
	}
	public void setRecorder(String recorder) {
		this.recorder = recorder;
	}
	public String getCwDate() {
		return cwDate;
	}
	public void setCwDate(String cwDate) {
		this.cwDate = cwDate;
	}
}
