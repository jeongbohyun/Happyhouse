package com.ssafy.web.dto;

public class Store {
	private int no; //번호
	private String storeName; //가게명
	private String sido; //시도
	private String gugun; //구군

	private String dong; //동
	private String juso; //전체주소
	private String type; //종류
	private String type2; //종류2
	
	public Store() {
		// TODO Auto-generated constructor stub
	}
	
	public Store(int no) {
		this.no = no;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getJuso() {
		return juso;
	}
	public void setJuso(String juso) {
		this.juso = juso;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	@Override
	public String toString() {
		return "Store [no=" + no + ", storeName=" + storeName + ", sido=" + sido + ", gugun=" + gugun + ", dong=" + dong
				+ ", juso=" + juso + ", type=" + type + "]";
	}

	public String getType2() {
		return type2;
	}

	public void setType2(String type2) {
		this.type2 = type2;
	}
	
}
