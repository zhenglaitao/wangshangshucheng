package com.msit.books;

public class orders {
	private int Id;
	private String OrderDate;
	private int UserId;
	private String TotalPrice;

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getOrderDate() {
		return OrderDate;
	}

	public void setOrderDate(String orderDate) {
		OrderDate = orderDate;
	}

	public int getUserId() {
		return UserId;
	}

	public void setUserId(int userId) {
		UserId = userId;
	}

	public String getTotalPrice() {
		return TotalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		TotalPrice = totalPrice;
	}
}
