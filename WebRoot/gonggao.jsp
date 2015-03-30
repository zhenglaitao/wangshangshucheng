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

<div id="basket"><a href="basket.jsp"></a></div>
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
    
    <div id="action_area">
    	<P><h1 class="action_type">公告！！</h1></P>
        <p class="state">欢迎光临第三波书店网站，本站为淘宝网旗下专业在线书店！<br />您可以使用第三波书店的用户名，直接登录。</p>
     <p class="state">然后.......(以下省略一万字)^^</p>
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
    <!--  -->
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