package com.human93.VO;

public class BCommentVO {
	private String Bno; //댓글달린 게시판 번호 
	private String Cno; //댓글의 번호
	private String Cwriter; //아이디
	private String Ccontent; //내용
	private String Cregtime; //등록 시간 
	
	
	private String nickname; //db엔 없는데 조인했을때 받을라궁 
	
	
	public String getBno() {
		return Bno;
	}
	public void setBno(String bno) {
		Bno = bno;
	}
	public String getCno() {
		return Cno;
	}
	public void setCno(String cno) {
		Cno = cno;
	}
	public String getCWriter() {
		return Cwriter;
	}
	public void setCWriter(String Cwriter) {
		this.Cwriter = Cwriter;
	}
	public String getCContent() {
		return Ccontent;
	}
	public void setCContent(String Ccontent) {
		this.Ccontent = Ccontent;
	}
	public String getCRegtime() {
		return Cregtime;
	}
	public void setCRegtime(String Cregtime) {
		this.Cregtime = Cregtime;
	}
	

}
