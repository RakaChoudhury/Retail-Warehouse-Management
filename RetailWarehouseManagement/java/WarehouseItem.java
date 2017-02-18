package com.sore.model;

public class WarehouseItem {
	public String name;
	public String desc;
	public int quantity;
	public WarehouseItem(String name,String desc,int quantity){
		this.name=name;
		this.desc=desc;
		this.quantity=quantity;
	}
	public WarehouseItem(){}
}
