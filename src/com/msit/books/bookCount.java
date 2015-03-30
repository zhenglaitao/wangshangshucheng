package com.msit.books;

public class bookCount {
	private int id;
	private String usersId;
	private Books bookID;
	private int quantity;
	private String unitPrice;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getUsersId() {
		return usersId;
	}

	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}

	public Books getBookID() {
		return bookID;
	}

	public void setBookID(Books bookID) {
		this.bookID = bookID;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}

}