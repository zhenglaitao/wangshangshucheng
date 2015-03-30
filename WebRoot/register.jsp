<%@page import="com.msit.books.Categories"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="Robots" content="index,follow" />
<title>"第三波书店"-网上书店</title>
<link href="CSS/global.css" rel="stylesheet" type="text/css" />
<link href="CSS/member.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="top">
	<div class="status">
	您好，欢迎来到第三波书店^_^   
	<c:set var="Name" value="${sessionScope.NAME }"/>
	<c:if test="${Name==null }" var="islogin">
	<span><a href="login.jsp">【登录】</a><a href="register.jsp">【免费注册】</a></span>
    </c:if>
    <c:if test="${Name!=null}">
          欢迎您： <b><c:out value="${Name}"/></b>
    <a href="loginout.jsp">退出</a>
    </c:if>
   </div>
</div>

<div id="header">
	<div id="logo"><img src="Images/logo.gif" alt="第三波书店" /></div>
    <div id="nav">
    	<div id="a_b_01"><img src="Images/a_b_01.gif" />[<img src="Images/taobao.gif" /> <a href="#">分站</a>]</div>
       <ul id="mainnav">
        	<li class="current"><a href="index.jsp">首页</a></li>
            <li><a href="login.jsp">登录</a></li>
            <li><a href="register.jsp">注册</a></li>
  <li><a href="index.jsp">特价甩卖</a></li>
            <li><a href="basket.jsp">购物车</a></li>
            <li><a href="gouwuliuc.jsp">购物流程</a></li>
            <li><a href="Help.jsp">帮助</a></li>
        </ul>
    </div>
</div>

<div id="container">
	<!--left content-->
	<div id="intro">
    	<div id="basket"><a href="#">目前您的购物篮是空的</a></div>
        <div id="search">
        	<form action="" method="post" target="_blank">
            	<input type="text" id="keyword" class="search_key" />
                <input type="submit" id="s_submit" class="search_sub" value="" />
            </form>
        </div>
        <div id="alltype">
        	<h1 class="all_type black"><a href="#">查看所有分类>></a></h1>
            <div id="subnav">
                 <ul class="black">
                    <jsp:useBean id="cat" class="categories.categories" />       
                
        <% List<Categories> catt = cat.selectBook2();
          for(int i=0;i<catt.size();i++){
        %>
        <li>
        <a href='index2.jsp?nid=<%=catt.get(i).getId() %>'> 
        <%=catt.get(i).getCname() %>
        </a>
        </li>
        <% } %>
                </ul>
            </div>
            <!--subnav end-->
        </div>
        <!--link start-->
        <div id="choice_pub">
        	<select name="publishs" id="publishs" class="n_select">
            	<option>>>根据出版社选择图书</option>
                <option>北京师范大学出版社</option>
                <option>电子工业出版社</option>
            </select>

        	<select name="publishs" id="special" class="n_select">
            	<option>>>根据专题选择图书</option>
                <option>国庆出游专题</option>
                <option>新年计划专题</option>
            </select>
        </div>
        
        <div id="s_b_03"><a href="#">赖世雄美语从头学</a><br /><a href="#">沪江团购 ，价格更优惠</a></div>
        <!--link start-->
    </div>
    
    
  <script type="text/javascript">
   function a()
 {
	 var username3=document.getElementById("username");
	 var username4=document.getElementById("username1");
	 username4.innerHTML="";
	 if(username3.value=="")
	 {
		username4.innerHTML="请输入用户名！！"
		return false;
		 }
		 return true;
	 }
	 
	 function b()
 {
	 var password3=document.getElementById("password");
	 var password4=document.getElementById("password1");
	 password4.innerHTML="";
	 if(password3.value=="")
	 {
		password4.innerHTML="请输入密码！"
		return false;
		 }return true;
	 }
	 
	 	 function c()
 {
	  var password3=document.getElementById("password");
	 var repassword3=document.getElementById("repassword");
	 var repassword4=document.getElementById("repassword1");
	 repassword4.innerHTML="";
	 if(repassword3.value=="")
	 {
		repassword4.innerHTML="请输入再输入一次密码！"
		return false;
		 }
	//if(password3!=repassword3)
	//{
	//	repassword4.innerHTML="两次密码输入不一致！"
	////	return false;
	//	}
		 return true;
	 }
	 
	 	 function d()
 {
	 var name3=document.getElementById("name");
	 var name4=document.getElementById("name1");
	 name4.innerHTML="";
	 if(name3.value=="")
	 {
		name4.innerHTML="请输入姓名！"
		return false;
		 }return true;
	 }
	 
	 	 function e()
 {
	 var email3=document.getElementById("email");
	 var email4=document.getElementById("email1");
	 email4.innerHTML="";
	 if(email3.value=="")
	 {
		email4.innerHTML="请输入邮箱！"
		return false;
		 }
	 if(email3.value.indexOf('@',0)==-1)
	{
		email4.innerHTML="Email必须包含@字符!";
		return false;
		} 
	return true;
	 }
	 
	 	 function f()
 {
	 var phone3=document.getElementById("phone");
	 var phone4=document.getElementById("phone1");
	 phone4.innerHTML="";
	 if(phone3.value=="")
	 {
		phone4.innerHTML="请输入手机号码！"
		return false;
		 }
	if(phone3.value.length!=11)
	{
		phone4.innerHTML="手机号码为十一位数!"
		return false;
		}	 
		 return true;
	 }
	 
	 	 function g()
 {
	 var adress3=document.getElementById("adress");
	 var adress4=document.getElementById("adress1");
	 adress4.innerHTML="";
	 if(adress3.value=="")
	 {
		adress4.innerHTML="请输入地址！"
		return false;
		 }return true;
	 }
	 
	 
	 function number(){
        var number1=document.myform.rand.value;
    
	 var checkno4=document.getElementById("checkno1");
	 checkno4.innerHTML="";
        if(number1==""){
       checkno4.innerHTML="验证码输入错误！"
      
        return false;
        }
   
       
        return true;
        
        }
        
        function loadimage(){ 
//不缓存
document.getElementById("randImage").src = "image.jsp?"+Math.random(); 
} 
	 
	 
	 function ss()
	 {
		 if(a()!=true||b()!=true||c()!=true||d()!=true||e()!=true||f()!=true||g()!=true||number()!=true)
		 {
			 return false;
			 }
			 return true;
		 }
    </script>
    
    <div id="action_area">
    	<h2 class="action_type"><img src="Images/register.gif" alt="会员注册" /></h2>
        <form name="myform" action="zhuche.jsp" method="post" class="member_form" onsubmit="return ss()">
   <table>
    <tr>
        	<td><p><label><span>*</span>登录名</label><input name="username" id="username" type="text" class="opt_input"  onblur="a()"/></td><td><div id="username1"></div></p></td></tr>
           <td> <p><label><span>*</span>密&#160;&#160;&#160;&#160;码</label><input name="password" id="password" type="password" class="opt_input"  onblur="b()"/></td><td><div id="password1"></div></p></td></tr>
            <td><p><label><span>*</span>确认密码</label><input name="repassword" id="repassword" type="password" class="opt_input"  onblur="c()"/></td><td><div id="repassword1"></div></p></td></tr>
             <td><p><label><span>*</span>用户名</label><input name="name"  id="name" type="text" class="opt_input"  onblur="d()"/></td><td><div id="name1"></div></p></td></tr>
            <td><p><label><span>*</span>电子邮件</label><input name="email" id="email" type="text" class="opt_input"  onblur="e()"/></td><td><div id="email1"></div></p></td></tr>
            <td><p><label><span>*</span>电&#160;&#160;&#160;&#160;话</label><input name="phone" id="phone" type="text" class="opt_input"  onblur="f()"/></td><td><div id="phone1"></div></p></td></tr>
            <td><p><label><span>*</span>地&#160;&#160;&#160;&#160;址</label><input name="adress" id="adress" type="text" class="opt_input"  onblur="g()"/></td><td><div id="adress1"></div></p></td></tr>
            <td ><p><label><span>*</span>验证码</label>
			<input	name="rand" type="text"  onblur="number()" /> <a href="javascript:loadimage();"> 
			<img alt="code..."	name="randImage" id="randImage" src="image.jsp"  align="absmiddle"> </a> &nbsp; <a
					href="javascript:loadimage();">
					<font class=pt95>看不清点我</font>
				</a> </td><td><div id="checkno1"></div></p></td></tr>
         <tr>
 <td>
            <p class="form_sub"><input type="submit" value="确定了，马上提交" class="opt_sub" /></p>
            <p class="form_sub">加<span>*</span>的为必填项目</p>
            <p class="form_sub"><a href="login.html">已经有账号，马上登录</a></p>
            </td></tr>
            </table>
        </form>
    </div>
    
</div>


<div id="footer">
	<!--contac us-->
	<div class="telephone">
        <strong>热线</strong> 021-61508168　<strong>传真</strong> 021-61508168-8020　 <br />
        <strong>Q Q</strong>375013071  13483528    562655482  1143735195（技术)<br />
        <strong>MSN</strong> hjservice@hotmail.com   <strong>信箱</strong> shop@hjenglish.com<br />
        <strong>帮助</strong> <a href="/help/help.aspx" target="_blank">银行汇款帐户</a> <a href="/help/help.aspx#help_post" target="_blank">邮局汇款地址</a> 	<a href="/help/help.aspx#help_ship" target="_blank">送货方式及费用</a> <a href="http://www.hjenglish.com/down/faq_2.htm" target="_blank">如何进行下载</a>
    </div>
    <!---->
  <div class="imp_link">
    	<img src="Images/alipay.gif" alt="支付宝支付" /><img src="Images/online_pay.gif" alt="在线支付" /><br />
        <a href="http://www.hjenglish.com/about/aboutus.htm" target="_blank">网站介绍</a>　<a href="http://www.hjenglish.com/about/partner.htm" target="_blank">合作伙伴</a>　<a href="#" target="_blank">网站地图</a>　<a href="#" target="_blank">联系我们</a><br />
    <a href="#" target="_blank">增值电信业务经营许可证沪B2-20040503</a> </div>
</div>

<div id="child_site">
	<strong>分站</strong>　 <a href="#" target="_blank">沪江网</a>  <a href="#" target="_blank">听说</a>  <a href="#" target="_blank">口译</a>  <a href="#" target="_blank">CET</a>  <a href="#" target="_blank">考研</a>  <a href="#" target="_blank">雅思</a>  <a href="#" target="_blank">托福</a>  <a href="#" target="_blank">日语</a>  <a href="#" target="_blank">法语</a>  <a href="#" target="_blank">下载</a>  <a href="#" target="_blank">文库</a>  <a href="#" target="_blank">部落</a>  <a href="#" target="_blank">博客</a>  <a href="#" target="_blank">词典</a>  <a href="#" target="_blank">IT新闻</a>  <a href="#" target="_blank">博客园</a>  <a title="新世界日语" href="#" target="_blank">新世界日语</a>  <a title="2010考研书籍推荐专题" href="#" target="_blank">2010考研书籍</a>
</div>


</body>
</html>