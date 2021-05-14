package com.itbank.cafe;

public class CafeDTO {
//	CNAME    NOT NULL VARCHAR2(50)  
//	CPNUM1   NOT NULL VARCHAR2(4)   
//	CPNUM2   NOT NULL VARCHAR2(4)   
//	CPNUM3   NOT NULL VARCHAR2(4)   
//	CADDR    NOT NULL VARCHAR2(100) 
//	COPEN             VARCHAR2(20)  
//	CCLOSE            VARCHAR2(20)  
//	CMENU    NOT NULL VARCHAR2(200) 
//	CHOLIDAY          VARCHAR2(40)  
//	CPIC     NOT NULL VARCHAR2(200) 
//	CDEL     NOT NULL NUMBER
	
	private String cname, cpnum1, cpnum2, cpnum3, 
			caddr, copen, cclose, cmenu, choliday, cpic;
	private int cdel;
	
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
	public String getCpnum2() {
		return cpnum2;
	}
	public void setCpnum2(String cpnum2) {
		this.cpnum2 = cpnum2;
	}
	public String getCpnum3() {
		return cpnum3;
	}
	public void setCpnum3(String cpnum3) {
		this.cpnum3 = cpnum3;
	}
	public String getCaddr() {
		return caddr;
	}
	public void setCaddr(String caddr) {
		this.caddr = caddr;
	}
	public String getCopen() {
		return copen;
	}
	public void setCopen(String copen) {
		this.copen = copen;
	}
	public String getCclose() {
		return cclose;
	}
	public void setCclose(String cclose) {
		this.cclose = cclose;
	}
	public String getCmenu() {
		return cmenu;
	}
	public void setCmenu(String cmenu) {
		this.cmenu = cmenu;
	}
	public String getCholiday() {
		return choliday;
	}
	public void setCholiday(String choliday) {
		this.choliday = choliday;
	}
	public String getCpic() {
		return cpic;
	}
	public void setCpic(String cpic) {
		this.cpic = cpic;
	}
	public int getCdel() {
		return cdel;
	}
	public void setCdel(int cdel) {
		this.cdel = cdel;
	}
	public String getCpnum1() {
		return cpnum1;
	}
	public void setCpnum1(String cpnum1) {
		this.cpnum1 = cpnum1;
	}

}
