<%@page import="com.msit.books.Categories"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.msit.util.SqlHelper"%>
<%@taglib uri="/struts-tags" prefix="s" %>
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
<script type="text/javascript" src="js/global.js"></script>
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
    	<div id="a_b_01"><input NAME="images1" TYPE="image" ID="images1" 

SRC="Images/a_b_01.gif"   

onMouseMove="move()" onMouseOut="out()"/>[<img src="Images/taobao.gif" /> <a href="#">分站</a>]</div>
        <ul id="mainnav">
        	<li class="current"><a href="index.jsp">首页</a></li>
            <li><a href="login.jsp">登录</a></li>
            <li><a href="register.jsp">注册</a></li>
             <li><a href="index.jsp">书籍求购</a></li>
            <li><a href="basket.jsp">购物车</a></li>
            <li><a href="gouwuliuc.jsp">购物流程</a></li>
            <li><a href="Help.jsp">帮助</a></li>
        </ul>
    </div>
</div>

<div id="container">
	<!--left content-->
	<div id="intro">
    	<div id="basket"><a href="basket.jsp">目前您的购物篮是空的</a></div>
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
    	<h2 class="action_type backet">
        	<p class="imp_link">全场运费一律0元 <br />
            <p class="mark">确认商品价格与交易条件</p>
        </h2>
       <table width="488" height="211">
       <tr>
       <td  colspan="2" height="76">
       <h1 align="center">交易成功！！！</h1>
       </td>
       </tr>
       <tr>
       <td width="210"> 收货人姓名：<s:property value="#session.name"/></td>
       <td width="266">省&#160;&#160;&#160;&#160;份:<s:property value="#session.shengfen"/></td>
       </tr>
      
       <tr>
       <td>地址：<s:property value="#session.dizhi"/></td>
       <td> 邮编：<s:property value="#session.youbian"/></td>
       </tr>
       
       <tr>
       <td>固定电话：<s:property value="#session.gudingdianhua"/></td>
       <td>手机：<s:property value="#session.shouji"/></td>
       </tr>
       
        <tr>
       <td>电子邮件：
         <s:property value="#session.Email"/></td>
       </tr>
       </table>
       
       <script language="javascript">
var w=images1.width;
var h=images1.height;
images1.height = Math.floor(h*0.8);
images1.width = Math.floor(w*0.8);
function move()
{
	images1.height = h;
	images1.width = w;
}
function out()
{
	images1.height = Math.floor(h*0.8);
	images1.width = Math.floor(w*0.8);
}
</script>
          <script language="javascript">
var w=images1.width;
var h=images1.height;
images1.height = Math.floor(h*0.8);
images1.width = Math.floor(w*0.8);
function move()
{
	images1.height = h;
	images1.width = w;
}
function out()
{
	images1.height = Math.floor(h*0.8);
	images1.width = Math.floor(w*0.8);
}
</script>
<script type="text/javascript">
        var table_obj = $("basket_data").getElementsByTagName("tr");
        for( var i=0; i< table_obj.length; i++) table_obj[i].style.background = i%2==0?"#FEF7DB":"#E2E2E2";
        </script>
            <p class="form_sub basker_ok_link"><a href="index.jsp">继续购物</a></p>
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