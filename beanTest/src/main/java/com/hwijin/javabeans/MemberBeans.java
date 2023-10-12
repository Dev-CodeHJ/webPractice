package com.hwijin.javabeans;

public class MemberBeans {
	private String name;
	private String id;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public MemberBeans() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberBeans(String name, String id) {
		super();
		this.name = name;
		this.id = id;
	}
	@Override
	public String toString() {
		return "MemberBeans [name=" + name + ", id=" + id + "]";
	}
}
