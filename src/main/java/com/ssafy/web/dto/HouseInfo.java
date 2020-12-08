package com.ssafy.web.dto;

public class HouseInfo {
	/** 아파트를 식별할 번호 */
	private String no;
	/** 법정 코드 */
	private String si;
	/** 법정 코드 */
	private String code;
	/** 구군 이름 **/
	private String name;
	/** 법정 동명 */
	private String dong;
	/** 아파트 이름 */
	private String aptName;
	/** 건축 연도 */
	private int buildYear;
	/** 지번 */
	private String jibun;
	/** 집타입 **/
	private boolean aptType; //true: 아파트, false: 연립 
	/** 거래타입 **/
	private boolean dealType; //true: 매매, false: 전월세

	/** 집타입 **/
	private boolean dealType2; //true: 월세, false: 매매,전세
	/** 평균가 **/
	private float avgDeal;
	/** 평균가 **/
	private float minDeal;
	/** 평균가 **/
	private float maxDeal;
	
	public HouseInfo() {
	}

	public HouseInfo(String no) {
		super();
		this.no = no;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getAptName() {
		return aptName;
	}

	public void setAptName(String aptName) {
		this.aptName = aptName;
	}

	public int getBuildYear() {
		return buildYear;
	}

	public void setBuildYear(int buildYear) {
		this.buildYear = buildYear;
	}

	public String getJibun() {
		return jibun;
	}

	public void setJibun(String jibun) {
		this.jibun = jibun;
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

	public boolean isAptType() {
		return aptType;
	}

	public void setAptType(boolean aptType) {
		this.aptType = aptType;
	}

	public float getAvgDeal() {
		return avgDeal;
	}

	public void setAvgDeal(float avgDeal) {
		this.avgDeal = avgDeal;
	}

	@Override
	public String toString() {
		return "HouseInfo [no=" + no + ", code=" + code + ", name=" + name + ", dong=" + dong + ", aptName=" + aptName
				+ ", buildYear=" + buildYear + ", jibun=" + jibun + ", aptType=" + aptType + ", dealType=" + dealType
				+ ", dealType2=" + dealType2 + ", avgDeal=" + avgDeal + "]";
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

	public String getSi() {
		return si;
	}

	public void setSi(String si) {
		this.si = si;
	}


		
}