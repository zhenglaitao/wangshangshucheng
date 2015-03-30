<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.msit.books.orderbook"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="Robots" content="noindex,nofollow" />
<title>管理后台</title>
<link href="css/admin.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div id="breadcrumb" class="black">
		您现在的位置： <a href="#">第三波</a> > <a href="#">管理员后台</a> > <a href="#">图书分类管理</a>
		> <a href="#">订单管理</a>
	</div>
	<form action="adminOrder2.jsp" method="post">
		<div align="center" id="left1">
			<font size="+2">请输入要查询的订单编号</font><input name="didanChaXun" type="text" style="width:200px; height:22px" /> 
			<input name=""  type="submit" value="订单查询" />
		</div>
	</form>

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
			<jsp:useBean id="dingdan" class="book.dindan" />
			<%
				List<orderbook> pu = dingdan.selectByNid();
			                  for(int i=0;i<pu.size();i++){
			%>
			<tr>
				<td class="name"><%=pu.get(i).getId()%></td>
				<td><%=pu.get(i).getName()%></td>
				<td><%=pu.get(i).getShengfen()%></td>
				<td class="name"><%=pu.get(i).getDizhi()%></td>
				<td class="name"><%=pu.get(i).getYoubian()%></td>
				<td><%=pu.get(i).getDianhua()%></td>
				<td><%=pu.get(i).getShouji()%></td>
				<td class="name"><%=pu.get(i).getEmail()%></td>
				<td><%=pu.get(i).getShijian()%></td>
				<td><%=pu.get(i).getJiage()%></td>
			</tr>
			<%
				}
			%>
		</tbody>

	</table>


	<script type="text/javascript">
		var s = document.getElementById("data_body").getElementsByTagName("tr");
 for( var i=0; i< s.length; i++) s[i].style.background = i%2==0?"#DDF5D9":"#fff";
	</script>
</body>
</html>