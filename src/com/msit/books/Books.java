package com.msit.books;

import java.io.File;

public class Books {
	private int id;
	private String title;
	private String author;
	private int publisherId;
	private String publishDate;
	private String isbn;
	private int wordsCount;
	private int unitPrice;
	private String contentDescription;
	private String aurhorDescription;
	private String editorComment;
	public int getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	private String toc;
	private Categories  categoryId;
	private int clicks;
	private int nowRead;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getPublisherId() {
		return publisherId;
	}
	public void setPublisherId(int publisherId) {
		this.publisherId = publisherId;
	}
	public String getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}
	 
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		//Images/BookCovers/${ns.isbn}.jpg
		//File 
		this.isbn = isbn;
	}
	public int getWordsCount() {
		return wordsCount;
	}
	public void setWordsCount(int wordsCount) {
		this.wordsCount = wordsCount;
	}
	public String getContentDescription() {
		return contentDescription;
	}
	public void setContentDescription(String contentDescription) {
		this.contentDescription = contentDescription;
	}
	public String getAurhorDescription() {
		return aurhorDescription;
	}
	public void setAurhorDescription(String aurhorDescription) {
		this.aurhorDescription = aurhorDescription;
	}
	public String getEditorComment() {
		return editorComment;
	}
	public void setEditorComment(String editorComment) {
		this.editorComment = editorComment;
	}
	 
	public String getToc() {
		return toc;
	}
	public void setToc(String toc) {
		this.toc = toc;
	}
	public int getClicks() {
		return clicks;
	}
	public void setClicks(int clicks) {
		this.clicks = clicks;
	}
	public int getNowRead() {
		return nowRead;
	}
	public Categories getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Categories categoryId) {
		this.categoryId = categoryId;
	}
	public void setNowRead(int nowRead) {
		this.nowRead = nowRead;
	}
	public int getOllRead() {
		return ollRead;
	}
	public void setOllRead(int ollRead) {
		this.ollRead = ollRead;
	}
	private int ollRead;
	
}
