<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.msit.books.*"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>

<title>用户管理</title>
<link href="css/admin.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div id="breadcrumb" class="black">
		您现在的位置： <a href="#">第三波</a> > <a href="#">管理员后台</a> > <a href="#">销售统计</a>
	</div>
	<table width="95%" border="0" cellspacing="0" cellpadding="0"
		align="center" class="data_table">
		<thead>
			<tr>
				<th width="30%" height="32" scope="col">书名</th>
				<th width="20%" scope="col">销售数量</th>
				<th width="21%" align="center" valign="middle" scope="col">单价</th>
				<th width="29%" scope="col">购买者ID</th>
			</tr>
		</thead>
		<tbody id="data_body">
			<jsp:useBean id="shuben" class="com.msit.biz.bookCountServer" />
			<%
				int total_books = shuben.getBookCount();
			           int pageSize=6;
			           int total_page = total_books/pageSize+1;
			           int pageIndex=1;
			           String page_no = (String)request.getParameter("pageIndex");
			           if(page_no!=null){
			             pageIndex = Integer.parseInt(page_no);
			           }
			           request.setAttribute("pageIndex", pageIndex);
			           request.setAttribute("total_page", total_page);
			            List<bookCount> book = shuben.getPageList(pageSize, pageIndex); 
			           request.setAttribute("order",book);
			%>
			<c:forEach var="us" items="${order }">
				<tr>
					<td height="61"><span class="name"><c:out
								value="${us.bookID.title }" />
					</span>
					</td>
					<td class="name"><c:out value="${us.quantity }" />
					</td>
					<td align="center" valign="middle" class="name"><c:out
							value="${us.unitPrice }" />
					</td>
					<td class="name"><c:out value="${us.usersId }" />
					</td>
				</tr>
			</c:forEach>
		</tfoot>
		<tr>
      <td colspan="6"  class="pages" bgcolor="#00FF99">
                  <a>当前页数:[<%=pageIndex %>/<%=total_page %>]&nbsp;</a>
					<c:if test="${pageIndex==1}">
						<a href="BookCount.jsp?pageIndex=1">首页</a>
						<a href="BookCount.jsp?pageIndex=<%=pageIndex+1%>">下一页</a>
						<a href="BookCount.jsp?pageIndex=<%=total_page%>">末页</a>
					</c:if>
					<c:if test="${pageIndex==total_page}">
						<a href="BookCount.jsp?pageIndex=1">首页</a>
						<a href="BookCount.jsp?pageIndex=<%=pageIndex-1%>">上一页</a>
						<a href="BookCount.jsp?pageIndex=<%=total_page%>">末页</a>
					</c:if>
					<c:if test="${pageIndex>1 && pageIndex<total_page}">
						<a href="BookCount.jsp?pageIndex=1">首页</a>
						<a href="BookCount.jsp?pageIndex=<%=pageIndex-1%>">上一页</a>
						<a href="BookCount.jsp?pageIndex=<%=pageIndex+1%>">下一页</a>
						<a href="BookCount.jsp?pageIndex=<%=total_page%>">末页</a>
					</c:if> 
	</tr>
	</table>



	<script type="text/javascript">
		var s = document.getElementById("data_body").getElementsByTagName("tr");
 for( var i=0; i< s.length; i++) s[i].style.background = i%2==0?"#DDF5D9":"#fff";
	</script>
</body>
</html>