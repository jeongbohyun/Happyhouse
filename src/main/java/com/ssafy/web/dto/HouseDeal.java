package com.ssafy.web.dto;

public class HouseDeal {

	/** 거래 정보를 식별할 번호 */
	private int no;
	private int noInfo;
	/** 건축 연도 */
	private String buildYear;
	/** 거래 연도 */
	private int dealYear;
	private String code;
	private String name;
	private String si;
	
	/** 동 **/
	private String dong;
	/** 거래 금액 */
	private int dealAmount; //매매면 거래금액, 전월세면 보증금
	/** 평균 금액 */
	private float avgDeal; //매매면 거래금액, 전월세면 보증금
	/** 평균 금액 */
	private float minDeal; //매매면 거래금액, 전월세면 보증금
	/** 평균 금액 */
	private float maxDeal; //매매면 거래금액, 전월세면 보증금
	
	/* 아파트 이름 **/
	private String aptName;
	/** 거래 월 */
	private int dealMonth;
	/** 월세 **/
	private int rentMoney;
	/** 거래 일 **/
	private int dealDay;
	/** 전용면적 **/
	private String area;
	/** 지번 **/
	private String jibun;
	/** 층 */
	private float floor;
	
	
	/** Type **/
	private boolean aptType; //true : 아파트 false: 연립주택
	private boolean dealType;//true : 매매 false: 전월세
	private boolean dealType2;//true : 월세 false: 매매,전세
	
	public HouseDeal() {
		
	}
	
	public HouseDeal(int no) {
		this.no = no;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getBuildYear() {
		return buildYear;
	}
	public void setBuildYear(String buildYear) {
		this.buildYear = buildYear;
	}
	public int getDealYear() {
		return dealYear;
	}
	public void setDealYear(int dealYear) {
		this.dealYear = dealYear;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public int getDealAmount() {
		return dealAmount;
	}
	public void setDealAmount(int dealAmount) {
		this.dealAmount = dealAmount;
	}
	public float getAvgDeal() {
		return avgDeal;
	}
	public void setAvgDeal(float avgDeal) {
		this.avgDeal = avgDeal;
	}
	public String getAptName() {
		return aptName;
	}
	public void setAptName(String aptName) {
		this.aptName = aptName;
	}
	public int getDealMonth() {
		return dealMonth;
	}
	public void setDealMonth(int dealMonth) {
		this.dealMonth = dealMonth;
	}
	public int getRentMoney() {
		return rentMoney;
	}
	public void setRentMoney(int rentMoney) {
		this.rentMoney = rentMoney;
	}
	public int getDealDay() {
		return dealDay;
	}
	public void setDealDay(int dealDay) {
		this.dealDay = dealDay;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getJibun() {
		return jibun;
	}
	public void setJibun(String jibun) {
		this.jibun = jibun;
	}
	public float getFloor() {
		return floor;
	}
	public void setFloor(float floor) {
		this.floor = floor;
	}
	public boolean isAptType() {
		return aptType;
	}
	public void setAptType(boolean aptType) {
		this.aptType = aptType;
	}
	public boolean isDealType() {
		return dealType;
	}
	public void setDealType(boolean dealType) {
		this.dealType = dealType;
	}
	public boolean isDealType2() {
		return dealType2;
	}
	public void setDealType2(boolean dealType2) {
		this.dealType2 = dealType2;
	}
	@Override
	public String toString() {
		return "HouseDeal [no=" + no + ", buildYear=" + buildYear + ", dealYear=" + dealYear + ", dong=" + dong
				+ ", dealAmount=" + dealAmount + ", avgDeal=" + avgDeal + ", aptName=" + aptName + ", dealMonth="
				+ dealMonth + ", rentMoney=" + rentMoney + ", dealDay=" + dealDay + ", area=" + area + ", jibun="
				+ jibun + ", floor=" + floor + ", aptType=" + aptType + ", dealType=" + dealType + ", dealType2="
				+ dealType2 + "]";
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	
	public String getSi() {
		return si;
	}

	public void setSi(String si) {
		this.si = si;
	}

	public float getMinDeal() {
		return minDeal;
	}

	public void setMinDeal(float minDeal) {
		this.minDeal = minDeal;
	}

	public float getMaxDeal() {
		return maxDeal;
	}

	public void setMaxDeal(float maxDeal) {
		this.maxDeal = maxDeal;
	}

	public int getNoInfo() {
		return noInfo;
	}

	public void setNoInfo(int noInfo) {
		this.noInfo = noInfo;
	}

}
