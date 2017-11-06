package com.yizhan.entity.system;

import com.hp.hpl.sparta.xpath.ThisNodeTest;

public class ThreadTokenHolder {
	String token;
	Proprietor proprietor = new Proprietor();

	public Proprietor getProprietor() {
		return proprietor;
	}

	public void setProprietor(Proprietor proprietor) {
		this.proprietor = proprietor;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	
	public ThreadTokenHolder() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
