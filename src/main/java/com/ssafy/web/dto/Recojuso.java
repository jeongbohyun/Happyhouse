package com.ssafy.web.dto;

public class Recojuso {
	private String sido;
	private String gugun;
	private String dong;
	private float score;
	private float hospital;
	private float school;
	private float subway;
	private float movie;
	private float cafe;
	private float mart;
	private float fast;
	
	public Recojuso() {
		
	}
		
	public Recojuso(String sido, String gugun, String dong, float score, float hospital, float school, float subway,
			float movie, float cafe, float mart, float fast) {
		super();
		this.sido = sido;
		this.gugun = gugun;
		this.dong = dong;
		this.score = score;
		this.hospital = hospital;
		this.school = school;
		this.subway = subway;
		this.movie = movie;
		this.cafe = cafe;
		this.mart = mart;
		this.fast = fast;
	}

	public float getHospital() {
		return hospital;
	}

	public void setHospital(float hospital) {
		this.hospital = hospital;
	}

	public float getSchool() {
		return school;
	}



	public void setSchool(float school) {
		this.school = school;
	}



	public float getSubway() {
		return subway;
	}



	public void setSubway(float subway) {
		this.subway = subway;
	}



	public float getMovie() {
		return movie;
	}



	public void setMovie(float movie) {
		this.movie = movie;
	}



	public float getCafe() {
		return cafe;
	}



	public void setCafe(float cafe) {
		this.cafe = cafe;
	}



	public float getMart() {
		return mart;
	}



	public void setMart(float mart) {
		this.mart = mart;
	}



	public float getFast() {
		return fast;
	}



	public void setFast(float fast) {
		this.fast = fast;
	}



	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "Recojuso [sido=" + sido + ", gugun=" + gugun + ", dong=" + dong + ", score=" + score + ", hospital="
				+ hospital + ", school=" + school + ", subway=" + subway + ", movie=" + movie + ", cafe=" + cafe
				+ ", mart=" + mart + ", fast=" + fast + "]";
	}
	
}
