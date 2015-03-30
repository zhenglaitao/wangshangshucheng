<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<div id="header"><img src="images/admin_top.gif" /></div>

<div id="main">
	<div id="opt_list">
    	<h1>管理员，您好！</h1>
    	<ul>
        	<li><a href="Index.jsp">订单管理</a></li>
            <li><a href="Index1.jsp">用户管理</a></li>
            <li><a href="Index2.jsp">角色管理</a></li>
            <li><a href="Index3.jsp">图书分类管理</a></li>
            <li><a href="Index4.jsp">图书管理</a></li>
            <li><a href="Index5.jsp">销售统计</a></li>
            <li><a href="loginout.jsp">安全退出</a></li>
        </ul>
    </div>
    <div id="opt_area">
    	<iframe id="frame_content" name="frame_content" src="Order.jsp" width="100%" height="800" scrolling="no" frameborder="0"></iframe>
    </div>
</div>


<script type="text/javascript">
var $=function(id){ return document.getElementById(id);}

function reinitIframe(){
	var iframe = $("frame_content");
	try{
		var bHeight = iframe.contentWindow.document.body.scrollHeight;
		var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
		var height = Math.max(bHeight, dHeight);
		iframe.height =  height;
	}catch (err){ alert(err.description);}
}

//window.setInterval("reinitIframe()", 200);
</script>

</body>
</html>