package com.digital.pojo;

import java.util.HashSet;
import java.util.Set;

public class ProductInfo {
	private int id;
	private String name;
	private String intro;
	private String brand;
	private int status;
	private int num;
	private Set type=new HashSet();
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Set getType() {
		return type;
	}
	public void setType(Set type) {
		this.type = type;
	}
	public ProductInfo() {
		
	}
	
}
