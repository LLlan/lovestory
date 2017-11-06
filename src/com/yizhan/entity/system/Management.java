package com.yizhan.entity.system;

import java.io.Serializable;
import java.util.List;

public class Management implements Serializable {

	private String merchant_type_id;
	private String parent_id;
	private String type;
	
	private List<Management> subManagement;
	
	public String getMerchant_type_id() {
		return merchant_type_id;
	}
	public void setMerchant_type_id(String merchant_type_id) {
		this.merchant_type_id = merchant_type_id;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public List<Management> getSubManagement() {
		return subManagement;
	}
	public void setSubManagement(List<Management> subManagement) {
		this.subManagement = subManagement;
	}
	
	
}
