package com.human93.VO;

public class BCommentVO {
	private String Bno; //��۴޸� �Խ��� ��ȣ 
	private String Cno; //����� ��ȣ
	private String Cwriter; //���̵�
	private String Ccontent; //����
	private String Cregtime; //��� �ð� 
	
	
	private String nickname; //db�� ���µ� ���������� ������� 
	
	
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
