<%@page import="com.msit.books.Books"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'datu.jsp' starting page</title>
  </head>
  
  <body>
    <jsp:useBean id="nc" class="book.books" />
      
               <%
			  String nid = request.getParameter("nid");
			 Books n= nc.getBookByid(nid);//在此调用查询单个方法
			%>
			<img src="Images/BookCovers/<%=n.getIsbn() %>.jpg" alt="" width="250" height="400"/>
	<a href="bookdetail.jsp?nid=<%=nid%>">返回</a>
  </body>
</html>
