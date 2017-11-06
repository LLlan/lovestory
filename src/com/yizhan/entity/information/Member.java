package com.yizhan.entity.information;
/**
 * 商户用户信息
 * @author zhangjh
 *
 */
public class Member {
	private String member_id;//主键ID
	private String identity;//手机号
	private String phone;//用户名
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
		
	

}
