package net.easycook.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminVO {

	private int admin_no;
	private String admin_id;
	private String admin_pwd;
	private String amdin_name;
	private String admin_date;
	
	//페이징
	private int startrow;
	private int endrow;
	
	//검색
	private String find_field;
	private String find_name;
}
