package com.yizhan.entity.system;

import com.yizhan.entity.Page;

/**
 * 
 * title：住户（业主）
 * author： lj
 * date：2016-11-22
 *
 */
 
 
public class Proprietor {
		public String proprietorId;
		public String proprietorName;
		public String sex;
		public String IDCard;
		public String age;
		public String marry; //婚否
		public String occupation;
		public String familyCount;
		public String residence;//小区住宅
		public String unit;  //单元
		public String definitePosition; //具体楼层房号
		public String telPhone;
		
		public Page page;
		
		public Page getPage() {
			if(page==null)
				page = new Page();
			return page;
		}
		public void setPage(Page page) {
			this.page = page;
		}
	
		public String getProprietorId() {
			return proprietorId;
		}
		public void setProprietorId(String proprietorId) {
			this.proprietorId = proprietorId;
		}
		public String getProprietorName() {
			return proprietorName;
		}
		public void setProprietorName(String proprietorName) {
			this.proprietorName = proprietorName;
		}
		public String getSex() {
			return sex;
		}
		public void setSex(String sex) {
			this.sex = sex;
		}
		public String getIDCard() {
			return IDCard;
		}
		public void setIDCard(String iDCard) {
			IDCard = iDCard;
		}
		public String getAge() {
			return age;
		}
		public void setAge(String age) {
			this.age = age;
		}
		public String getMarry() {
			return marry;
		}
		public void setMarry(String marry) {
			this.marry = marry;
		}
		public String getOccupation() {
			return occupation;
		}
		public void setOccupation(String occupation) {
			this.occupation = occupation;
		}
		public String getFamilyCount() {
			return familyCount;
		}
		public void setFamilyCount(String familyCount) {
			this.familyCount = familyCount;
		}
		public String getResidence() {
			return residence;
		}
		public void setResidence(String residence) {
			this.residence = residence;
		}
		public String getUnit() {
			return unit;
		}
		public void setUnit(String unit) {
			this.unit = unit;
		}
		public String getDefinitePosition() {
			return definitePosition;
		}
		public void setDefinitePosition(String definitePosition) {
			this.definitePosition = definitePosition;
		}
		public String getTelPhone() {
			return telPhone;
		}
		public void setTelPhone(String telPhone) {
			this.telPhone = telPhone;
		}
		
		
		
		
		
		
		
		
		
		
}
