<%@page import="com.msit.books.orderbook"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>订单查询</title>

<link href="admin/css/admin.css" rel="stylesheet" type="text/css" />

</head>

<body>
	<div id="breadcrumb" class="black">
		您现在的位置： <a href="#">第三波</a> > <a href="#">管理员后台</a> > <a href="#">订单管理</a>
		> <a href="#">订单查询</a>
	</div>
	<form action="admin/Order.jsp" method="post">

			<jsp:useBean id="nc" class="book.dindan" />
			<%
				String id = request.getParameter("didanChaXun");
				orderbook dindan = nc.select(id);
			%>

			<table width="96%" border="0" cellspacing="0" cellpadding="0"
				align="center" class="data_table">
				<thead>
					<tr>
						<th width="10%" scope="col">订单编号</th>
						<th width="6%" scope="col">姓名</th>
						<th width="7%" scope="col">省份</th>
						<th width="10%" scope="col">地址</th>
						<th width="7%" scope="col">邮编</th>
						<th width="12%" scope="col">电话</th>
						<th width="12%" scope="col">手机</th>
						<th width="13%" scope="col">Email</th>
						<th width="11%" scope="col">下单时间</th>
						<th width="12%" scope="col">价格</th>
					</tr>
				</thead>
				<tbody id="data_body">
					<tr>
						<td class="name"><%=dindan.getId()%></td>
						<td><%=dindan.getName()%></td>
						<td><%=dindan.getShengfen()%></td>
						<td><%=dindan.getDizhi()%></td>
						<td><%=dindan.getYoubian()%></td>
						<td><%=dindan.getDianhua()%></td>
						<td><%=dindan.getShouji()%></td>
						<td><%=dindan.getEmail()%></td>
						<td><%=dindan.getShijian()%></td>
						<td><%=dindan.getJiage()%></td>
						
					</tr>
				</tbody>
			</table>
		<div align="center" id="left1">
			<input type="submit" value="返回" />
		</div>
	</form>
</body>
</html>

