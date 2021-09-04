package net.easycook.vo;

public class HotNewsBoardVO {

	private int hno;
	private String hwriter;
	private String htitle;
	private String hcont;
	private String hlink;
	private String hfile;
	private int viewcnt;
	private String regdate;
	
	private int startrow;
	private int endrow;
	
	private String find_field;
	private String find_name;
	
	
	
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	public String getFind_field() {
		return find_field;
	}
	public void setFind_field(String find_field) {
		this.find_field = find_field;
	}
	public String getFind_name() {
		return find_name;
	}
	public void setFind_name(String find_name) {
		this.find_name = find_name;
	}
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getHwriter() {
		return hwriter;
	}
	public void setHwriter(String hwriter) {
		this.hwriter = hwriter;
	}
	public String getHtitle() {
		return htitle;
	}
	public void setHtitle(String htitle) {
		this.htitle = htitle;
	}
	public String getHcont() {
		return hcont;
	}
	public void setHcont(String hcont) {
		this.hcont = hcont;
	}
	public String getHlink() {
		return hlink;
	}
	public void setHlink(String hlink) {
		this.hlink = hlink;
	}
	public String getHfile() {
		return hfile;
	}
	public void setHfile(String hfile) {
		this.hfile = hfile;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getRegdate() {
		return regdate.substring(0, 10);
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
