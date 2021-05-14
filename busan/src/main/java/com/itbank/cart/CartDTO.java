package com.itbank.cart;

public class CartDTO {

	private String id, cftname;
	private int change;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCftname() {
		return cftname;
	}
	public void setCftname(String cftname) {
		this.cftname = cftname;
	}
	public int getChange() {
		return change;
	}
	public void setChange(int change) {
		this.change = change;
	}
}
