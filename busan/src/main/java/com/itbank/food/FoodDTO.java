package com.itbank.food;

public class FoodDTO {
//	FNAME      NOT NULL VARCHAR2(30)  
//	FPNUM1     NOT NULL VARCHAR2(3)   
//	FPNUM2     NOT NULL VARCHAR2(4)   
//	FPNUM3     NOT NULL VARCHAR2(4)   
//	FADDR      NOT NULL VARCHAR2(100) 
//	FOPEN               VARCHAR2(20)  
//	FCLOSE              VARCHAR2(20)  
//	FMENU               VARCHAR2(200) 
//	FHOLIDAY            VARCHAR2(20)  
//	FPIC       NOT NULL VARCHAR2(20)  
//	FBREAKTIME          VARCHAR2(20)  
//	FDEL       NOT NULL NUMBER    

	private int fdel;
	private String fname,fpnum1,fpnum2,fpnum3,faddr,fopen,fclose,fmenu,fholiday,fpic,fbreaktime;
	
	public int getFdel() {
		return fdel;
	}
	public void setFdel(int fdel) {
		this.fdel = fdel;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	
	public String getFaddr() {
		return faddr;
	}
	public void setFaddr(String faddr) {
		this.faddr = faddr;
	}
	public String getFopen() {
		return fopen;
	}
	public void setFopen(String fopen) {
		this.fopen = fopen;
	}
	public String getFclose() {
		return fclose;
	}
	public void setFclose(String fclose) {
		this.fclose = fclose;
	}
	public String getFmenu() {
		return fmenu;
	}
	public void setFmenu(String fmenu) {
		this.fmenu = fmenu;
	}
	public String getFholiday() {
		return fholiday;
	}
	public void setFholiday(String fholiday) {
		this.fholiday = fholiday;
	}
	public String getFpic() {
		return fpic;
	}
	public void setFpic(String fpic) {
		this.fpic = fpic;
	}
	public String getFbreaktime() {
		return fbreaktime;
	}
	public void setFbreaktime(String fbreaktime) {
		this.fbreaktime = fbreaktime;
	}
	public String getFpnum1() {
		return fpnum1;
	}
	public void setFpnum1(String fpnum1) {
		this.fpnum1 = fpnum1;
	}
	public String getFpnum2() {
		return fpnum2;
	}
	public void setFpnum2(String fpnum2) {
		this.fpnum2 = fpnum2;
	}
	public String getFpnum3() {
		return fpnum3;
	}
	public void setFpnum3(String fpnum3) {
		this.fpnum3 = fpnum3;
	}
	
}
