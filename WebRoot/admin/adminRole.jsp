<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.msit.books.*"%>
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
<style type="text/css">
<!--
#breadcrumb a {
	color: #000;
	text-decoration: none;
	margin: 0px;
}

.black {
	margin: 20px;
}

#left2 {
	background-color: #FFF;
}

#left table tr td .first {
	color: #000;
	text-decoration: none;
}

#left {
	border: 1px solid #666;
	margin: 20px;
	padding: 0px;
	width: 730px;
	background-color: #CCC;
}

#left1 {
	margin: 20px;
	width: 670px;
	padding: 20px;
}
-->
</style>
<body>

	<div id="breadcrumb" class="black">
		您现在的位置： <a href="#">第三波</a> > <a href="#">管理员后台</a> > <a href="#">角色管理</a>
	</div>


	<table width="96%" border="0" cellspacing="0" cellpadding="0" align="center" class="data_table">

		<thead>
			<tr>
				<th width="6%" scope="col">Id</th>
	            <th width="11%" scope="col">用户名</th>
	            <th width="12%" scope="col">密码</th>
	            <th width="13%" scope="col">昵称</th>
	            <th width="16%" scope="col">住址</th>
	            <th width="13%" scope="col">电话</th>
	            <th width="12%" scope="col">Email</th>
	            <th width="17%" scope="col">用户类型</th>
			</tr>
		</thead>
		<tbody id="data_body">
			<jsp:useBean id="nc" class="book.Users" />
			<%
			  List<users> user=nc.selectUsers();
			  request.setAttribute("user", user);
			%>
			<c:forEach var="ns" items="${user }" varStatus="s">
				<tr>
					<td height="61"><c:out value="${ns.id }" />
					</td>
					<td class="name"><c:out value="${ns.loginId }" />
					</td>
					<td><c:out value="${ns.loginPwd }" />
					</td>
					<td><c:out value="${ns.uName }" />
					</td>
					<td><c:out value="${ns.address }" />
					</td>
					<td><c:out value="${ns.phone }" />
					</td>
					<td><c:out value="${ns.mail }" />
					<td><c:out value="${ns.userRoleId.name }" />
					</td>
				</tr>
			</c:forEach>
		</tbody>

		<tfoot>

		</tfoot>
	</table>
		<div class="opt_action">
		<form action="huiyuan.jsp" method="post">
			<div align="center" id="left1">
				<font size="+2">请输入要提升会员等级的ID</font> <input name="isbn" type="text" style="width:150px; height:22px" />
					<select name="select" id="select">
					<jsp:useBean id="cc" class="com.msit.biz.UserRoles"/>
					<%
					   List<userroles> roles=cc.userrolesselect();
					   request.setAttribute("roles", roles);
					 %>
					<c:forEach var="ns" items="${roles }" varStatus="s">
						<option value="${ns.id }">
							<c:out value="${ns.name }" />
						</option>
					</c:forEach>
				</select> <input type="submit" name="button" id="button" value="确定" />
			</div>
		</form>
	</div>

	<script type="text/javascript">
		var s = document.getElementById("data_body").getElementsByTagName("tr");
 for( var i=0; i< s.length; i++) s[i].style.background = i%2==0?"#DDF5D9":"#fff";
	</script>
</body>
</html>