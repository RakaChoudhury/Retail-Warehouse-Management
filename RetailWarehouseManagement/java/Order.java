package com.sore.model;

public class Order {
	public int orderID;
	public String desc;
	public int quantityOrdered;
	public String deliveryDate;
	public String order;
	public int item_id;
	public Order(int orderID, String desc, int quantityOrdered, String deliveryDate, String order){
		this.orderID=orderID;
		this.desc=desc;
		this.quantityOrdered=quantityOrdered;
		this.deliveryDate=deliveryDate;
		this.order=order;
	}
	public Order(int orderID, String desc, int quantityOrdered, String deliveryDate, String order,int item_id){
		this.orderID=orderID;
		this.desc=desc;
		this.quantityOrdered=quantityOrdered;
		this.deliveryDate=deliveryDate;
		this.order=order;
		this.item_id=item_id;
	}
}
