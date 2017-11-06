package com.yizhan.entity.system;

/**
 * 物业公司
 * 功能：
 * 作者： lj
 * date：2016-12-15
 *
 */
public class EstateCompany {
	private String estate_company_id;
	private String  estate_company_name;
	private String  residence_count;//小区数
	private String  address;
	private String  principal; //负责人
	
	public String getEstate_company_id() {
		return estate_company_id;
	}
	public void setEstate_company_id(String estate_company_id) {
		this.estate_company_id = estate_company_id;
	}
	public String getEstate_company_name() {
		return estate_company_name;
	}
	public void setEstate_company_name(String estate_company_name) {
		this.estate_company_name = estate_company_name;
	}
	public String getResidence_count() {
		return residence_count;
	}
	public void setResidence_count(String residence_count) {
		this.residence_count = residence_count;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPrincipal() {
		return principal;
	}
	public void setPrincipal(String principal) {
		this.principal = principal;
	}
	
	
}
