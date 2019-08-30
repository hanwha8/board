package com.hanwha.example.dto;

public class ProjectVO {
	
	private String writer;
	private String location;
	private String content;
	
	
	public void setWriter(String writer){
		this.writer = writer;
	}
	public void setLocation(String location){
		this.location =location;
	}
	public void setContent(String content){
		this.content = content;
	}
	public String getWriter(){
		return this.writer;
	}
	public String getLocation(){
		return this.location;
	}
	public String getContent(){
		return this.content;

	}
}
