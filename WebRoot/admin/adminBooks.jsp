<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.msit.books.*" %>
<%@page import="book.books"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>

<title>用户管理</title>
<link href="css/admin.css" rel="stylesheet" type="text/css" />
</head>
<style type="text/css">
#left1 {
	margin: 20px;
	width: 670px;
}
-->
</style>
<body>

<div id="breadcrumb" class="black">您现在的位置：  <a href="#">第三波</a>  >    <a href="#">管理员后台</a>  >    <a href="#">图书管理</a></div>

<form id="form1" name="form1" method="post" action="BookQuery.jsp">
  <div align="center" id="left1">
<font size="+2">请输入要查询的图书编号</font>
<input name="isbn" type="text" style="width:200px; height:22px" />
<input name="" type="submit" value="图书查询" />
</div>
</form>

  <jsp:useBean id="shuben" class="book.books" />
   <% 
           int total_books = shuben.getBookCount();
           int pageSize=4;
           int total_page = total_books/pageSize+1;
           int pageIndex=1;
           String page_no = (String)request.getParameter("pageIndex");
           if(page_no!=null){
             pageIndex = Integer.parseInt(page_no);
           }
           request.setAttribute("pageIndex", pageIndex);
           request.setAttribute("total_page", total_page);
            List<Books> book = shuben.getPageList(pageSize, pageIndex); 
           request.setAttribute("books",book);
         %>
  <table width="96%" border="0" cellspacing="0" cellpadding="0" align="center" class="data_table">
  <thead>
    <tr>
      <th width="12%" scope="col">图书编号</th>
      <th width="16%" scope="col">书名</th>
      <th width="18%" scope="col">作者</th>
      <th width="21%" scope="col">出版时间</th> 
      <th width="16%" scope="col">字数</th>
      <th width="17%" scope="col">价格</th>
    </tr>
  </thead>
  <jsp:useBean id="b" class="book.books"/>
  <tbody id="data_body">
  <c:forEach var="book" items="${books }" varStatus="s">
    <tr>
      <td height="61"><c:out value="${book.isbn }"/></td>
      <td class="name"><c:out value="${book.title }"/></td>
      <td><c:out value="${book.author }"/></td>
      <td><c:out value="${book.publishDate }"/></td>
      <td><c:out value="${book.wordsCount }"/></td>
      <td><c:out value="${book.unitPrice }"/></td>
    </tr>
    </c:forEach>
  </tbody>
  <tfoot>
    <tr>
      <td colspan="6"  class="pages" bgcolor="#00FF99">
                  <a>当前页数:[<%=pageIndex %>/<%=total_page %>]&nbsp;</a>
					<c:if test="${pageIndex==1}">
						<a href="adminBooks.jsp?pageIndex=1">首页</a>
						<a href="adminBooks.jsp?pageIndex=<%=pageIndex+1%>">下一页</a>
						<a href="adminBooks.jsp?pageIndex=<%=total_page%>">末页</a>
					</c:if>
					<c:if test="${pageIndex==total_page}">
						<a href="adminBooks.jsp?pageIndex=1">首页</a>
						<a href="adminBooks.jsp?pageIndex=<%=pageIndex-1%>">上一页</a>
						<a href="adminBooks.jsp?pageIndex=<%=total_page%>">末页</a>
					</c:if>
					<c:if test="${pageIndex>1 && pageIndex<total_page}">
						<a href="adminBooks.jsp?pageIndex=1">首页</a>
						<a href="adminBooks.jsp?pageIndex=<%=pageIndex-1%>">上一页</a>
						<a href="adminBooks.jsp?pageIndex=<%=pageIndex+1%>">下一页</a>
						<a href="adminBooks.jsp?pageIndex=<%=total_page%>">末页</a>
					</c:if> 
	</tr>
  </tfoot>
  <tfoot>
  </tfoot>
  </table>
 <script type="text/javascript">
 var s = document.getElementById("data_body").getElementsByTagName("tr");
 for( var i=0; i< s.length; i++) s[i].style.background = i%2==0?"#DDF5D9":"#fff";
 </script>
</body>
</html>