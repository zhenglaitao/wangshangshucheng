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
    <title>"第三波书店"-网上书店</title>
    <link href="css/admin.css" rel="stylesheet" type="text/css" />
</head>

<body id="login" background="images/bj.jpg">
    <div class="login_t">
    </div>
    <div class="login_m">
    </div>
    <div class="login_b">
        <form method="post" action="do_login.jsp">
        <p>
            <label>
                用户名</label><input type="text" name="username" class="login_input" /></p>
        <p>
            <label>
                密&#160;&#160;码</label><input type="password" name="password" class="login_input" /></p>
        <p>
            <input type="submit" name="button" id="button" value="提交" class="login_sub" />
            <input type="reset" name="button" id="button" value="重置" class="login_sub login_reset" /></p>
        </form>
    </div>

    <script type="text/javascript">
        function divMid() {
            var oheight = document.documentElement.clientHeight;
            document.getElementById("login").style.paddingTop = oheight / 2 - 197 + "px";
        }
     
    </script>

</body>
</html>
