<%@page import="book.books"%>
<%@ page import="com.msit.books.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="CSS/admin.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
#center {
	margin-left: 15%;
}
-->
</style>
</head>


<body>
<jsp:useBean id="bc" class="book.books"/>
<%
   String isbn=request.getParameter("isbn");
   Books book=bc.BookISBN(isbn);
  
 %>
<div id="breadcrumb" class="black">您现在的位置：  第三波  >    管理员后台  >图书管理>    修改图书 </div>
<div id="center">
<form action="" method="post" name="form1">
 <p>书名：&nbsp;&nbsp; &nbsp; &nbsp;<textarea name="bookname" id="textarea2" cols="55" rows="1"><%=book.getTitle()%> </textarea></p><br />
 <p> 作者：&nbsp; &nbsp;&nbsp; &nbsp;<textarea name="author" id="textarea3" cols="55" rows="1"><%=book.getAuthor()%></textarea> <br /></p>
  <br />
 <p> 出版时间： <textarea name="date" id="textarea6" cols="55" rows="1"><%=book.getPublishDate()%></textarea>
   <br /></p>
  <br />
 <p> 字数：&nbsp;&nbsp;&nbsp;&nbsp; <textarea name="count" id="textarea4" cols="55" rows="1"><%=book.getWordsCount()%></textarea>
   <br /></p>
  <br />
 <p> 价格：&nbsp;&nbsp;&nbsp;&nbsp; <textarea name="price" id="textarea5" cols="55" rows="1"><%=book.getUnitPrice()%></textarea>
 </p>
 <br />
 &nbsp;&nbsp;&nbsp;<input name="" type="button" value=" 修改 " onclick="Student()" />
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input name="" type="button" value=" 删除 "onclick="Teacher()"/>
</form>
</div>
<script type="text/javascript">
function Student()
{ 
document.form1.action="admin/do_upbook.jsp?isbn=<%=book.getIsbn() %>";
document.form1.submit();
}
function Teacher()
{
document.all.form1.action="admin/do_debook.jsp?isbn=<%=book.getIsbn() %>";
document.all.form1.submit();
}
</script>
</body>
</html>