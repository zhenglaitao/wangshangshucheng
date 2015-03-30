<%@page import="com.msit.books.users"%>
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
    
    <title>My JSP 'UserQuery.jsp' starting page</title>
    
	<link href="css/admin.css" rel="stylesheet" type="text/css" />
</head>



<style type="text/css">
#center {
	margin-left: 15%;
}
</style>
<body>
<jsp:useBean id="nc" class="book.Users"/>
<%
   String id=request.getParameter("id");
   users user=nc.select(id);
 %>

<div id="breadcrumb" class="black">您现在的位置：  第三波  >    管理员后台   管理用户  >    修改用户
<div id="center">
<form action="" method="post" theme="simple" name="form1">
 <p> 用户名：<input name="name" type="text" value="<%=user.getLoginId() %>" /><br /></p>
 <br />
  <p>密码：&nbsp;&nbsp;<input name="pwd" type="text" value="<%=user.getLoginPwd() %>" /><br /></p>
   <br />
 <p> 昵称：&nbsp;&nbsp;<input name="uname" type="text" value="<%=user.getuName() %>"/><br /></p>
  <br />
 <p> 住址：&nbsp;&nbsp;<input name="address" type="text" value="<%=user.getAddress() %>" /><br /></p>
  <br />
 <p> 电话：&nbsp;&nbsp;<input name="phone" type="text" value="<%=user.getPhone() %>" /><br /></p>
  <br />             
 <p> Email:&nbsp;&nbsp;<input name="email" type="text" value="<%=user.getMail() %>" /></p>
 <br />
 <input name="" type="button" value=" 修改 " onclick="Student()" />&nbsp;&nbsp;&nbsp;&nbsp;
 <input name="" type="button" value=" 删除 " onclick="Teacher()" >
 &nbsp;&nbsp;<a href="admin/adminUser.jsp">返回</a>
</form>
</div>
<script type="text/javascript">
function Student()
{ 
document.form1.action="admin/do_update.jsp?id=<%=user.getId()%>";
document.form1.submit();
}
function Teacher()
{
document.all.form1.action="admin/do_delete.jsp?id=<%=user.getId()%>";
document.all.form1.submit();
}
</script>
</body>
</html>