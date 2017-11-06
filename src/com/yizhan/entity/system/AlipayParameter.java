package com.yizhan.entity.system;

public class AlipayParameter {
	
	//随机9位订单号
	public String out_trade_no;
	//订单合计金额
	public String total_amount;
	//返回的成功与否信息
	public String msg;
	//appID
	public String app_id;
	
	public String getOut_trade_no() {
		return out_trade_no;
	}
	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}
	public String getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(String total_amount) {
		this.total_amount = total_amount;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getApp_id() {
		return app_id;
	}
	public void setApp_id(String app_id) {
		this.app_id = app_id;
	}
	
	
	
}
