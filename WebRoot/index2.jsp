<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="book.books"%>
<%@page import="com.msit.books.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="Robots" content="index,follow" />
<title>"第三波书店"-网上书店</title>
<link href="CSS/global.css" rel="stylesheet" type="text/css" />
<link href="CSS/Index.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.scale:hover{-webkit-transform:scale(1.1);-moz-transform:scale(1.1);-o-transform:scale(1.1);-webkit-transform-origin:top center;/*-webkit-transform-origin设定了变换源点*/}
.cls_container{border:1px solid #ccc;width:680px;font-size:12px;height:24px;overflow:hidden;}
.cls_container ul{list-style-type:none;margin:0;padding:0;margin-left:32px;}
.cls_container ul li{height:24px;line-height:24px;width:320px;float:left;display:inline;}
</style>
<script type="text/javascript">
 var i=1;
 function autoChange()
 {
	 var img=document.getElementById("img");
	 img.src="Images/a_b_0"+i+".jpg";
	 i++;
	 if(i==6)i=1;
	 window.setTimeout("autoChange()",2000)
	 }
function chaImg(num)
{
	 var img=document.getElementById("img");
	 img.src="Images/a_b_0"+num+".jpg";
	}
</script>
</head>

<body onLoad="autoChange()">

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
	<div id="logo" class="scale"><img src="Images/logo.gif" alt="第三波书店" /></div>
    <div id="nav">
    	<div id="a_b_01"><img SRC="Images/a_b_01.gif" />[<img src="Images/taobao.gif" /> <a href="#">分站</a>]</div>
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
    	<div id="basket"><a href="basket.jsp">购物车</a></div>
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
        <jsp:useBean id="publi" class="publishs.publishs" /> 
        	 <form action="" method="post" target="_blank">
            <select name="publishs" id="keyword" class="search_key">
            	<option>>>根据出版社选择图书</option>
                 <% List<Publishers> pu = publi.selectPu();
          for(int i=0;i<pu.size();i++){
         %>
          <option><%=pu.get(i).getId() %>
          <%=pu.get(i).getPuName() %></option>
          <% } %>
            </select>	
                <input type="submit" id="s_submit" class="search_sub" value="" />
            </form>

        	
        </div>
        
        <div id="s_b_03"><a href="gonggao.jsp">特价优惠，限时甩卖</a><br /><a href="gonggao.jsp">英语高级口语资格考试</a></div>
        <!--link start-->
    </div>
    
    <!--middle content-->
    <div id="content">
    	<div id="magic"><img src="Images/a_b_02.jpg" alt="幻灯图片" width="480" height="200" id="img"/>
    	<div style="z-index: 2;float:center;" class="lii">   
        <ul> 
      <li> <a href="JavaScript:chaImg(1)">●</a>
        <a href="JavaScript:chaImg(2)">●</a>
    	<a href="JavaScript:chaImg(3)">●</a>
        <a href="JavaScript:chaImg(4)">●</a>
    	<a href="JavaScript:chaImg(5)">●</a></li></ul>
    	</div>
    	</div>
        <div id="a_b_02">
        </div>
        <!--comment books start-->
        <div id="comment_book">
        <br/>
        	<ul>
        	  <jsp:useBean id="shuben" class="book.books" />
        	  
         <% 
           String nid = request.getParameter("nid");
          int s=Integer.parseInt(nid);
          int total_books = shuben.getfenleiCount(s);
           int pageSize=12;
           int total_page = total_books/pageSize+1;
           int pageIndex=1;
           String page_no = (String)request.getParameter("pageIndex");
           if(page_no!=null){
             pageIndex = Integer.parseInt(page_no);
           }
           request.setAttribute("pageIndex", pageIndex);
           request.setAttribute("total_page", total_page);
           //List<Books> book = shuben.getfenlei(pageSize, pageIndex,s); 
        List<Books> n= shuben.getfenlei(pageSize, pageIndex,nid);
           request.setAttribute("books",n);
         %>
        
        <c:forEach var="ns" items="${books}" varStatus="s">
        
        <li><a href='bookdetail.jsp?nid=${ns.id}'>
  <div class="scale"> 
        <img src="Images/BookCovers/${ns.isbn}.jpg" onerror="this.src='Images/default.jpg'" alt="" width="100" height="150"/>
        </div>
        <c:set var="s1" value="${ns.title}" />
           ${fn:substring(s1,0,10)}
        </a></li>
        </c:forEach>

            </ul>
          </div>
          <br/>
            <!-- 页面段落 -->
               当前页数:[<%=pageIndex %> / <%=total_page %>]&nbsp;
               <c:if test="${total_page==1}">
               
               </c:if>
        <c:if test="${pageIndex==1}">
         <a href="index2.jsp?nid=<%=nid%>&pageIndex=1">首页</a>
         <a href="index2.jsp?nid=<%=nid%>&pageIndex=<%=pageIndex+1%>">下一页</a>
         <a href="index2.jsp?nid=<%=nid%>&pageIndex=<%=total_page%>">末页</a> 
        </c:if>
        <c:if test="${pageIndex==total_page}">
         <a href="index2.jsp?nid=<%=nid%>&pageIndex=1">首页</a>
         <a href="index2.jsp?nid=<%=nid%>&pageIndex=<%=pageIndex-1%>" >上一页</a>
         <a href="index2.jsp?nid=<%=nid%>&pageIndex=<%=total_page%>">末页</a> 
        </c:if>
        <c:if test="${pageIndex>1 && pageIndex<total_page}">
         <a href="index2.jsp?nid=<%=nid%>&pageIndex=1">首页</a>
         <a href="index2.jsp?nid=<%=nid%>&pageIndex=<%=pageIndex-1%>" >上一页</a>
         <a href="index2.jsp?nid=<%=nid%>&pageIndex=<%=pageIndex+1%>" >下一页</a>
         <a href="index2.jsp?nid=<%=nid%>&pageIndex=<%=total_page%>">末页</a> 
        </c:if>
      
        <!--comment books end-->
    </div>
    
    <!--sidebar content-->
    <div id="sidebar">
        <div id="myscroll" class="cls_container">
        <ul>
              <li><a href="gonggao.jsp">国庆期间货物延期配送公告</a></li>
              <li><a href="gonggao.jsp">英语高级口语资格考试</a></li>
              <li><a href="gonggao.jsp">特价优惠，限时甩卖</a></li>
              <li><a href="gonggao.jsp">精品图书，清仓特价</a></li>
      </ul>
      </div>
        <div id="order_find">
        	<form action="" method="post" target="_blank">
           	  <label>订单号：</label><input type="text" id="keyword" class="order_key" />
                <input type="submit" id="s_submit" class="order_sub" value="查询状态" />
            </form>
        </div>
        <div class="service">
        	<p><a href="#"><img src="Images/QQ_01.gif" /></a>
                <a href="#"><img src="Images/QQ_02.gif" /></a>
                <a href="#"><img src="Images/QQ_02.gif" /></a></p>
            <p><a href="#"><img src="Images/taobao_01.gif" /></a>
            	<a href="#"><img src="Images/taobao_02.gif" /></a></p>
        </div>
        <!--hot books start-->
          <jsp:useBean id="shuben2" class="book.books" />
        <div class="sidedt hots">
        	<h1>热销排行</h1>
            <ul>
        
           <% List<Books> shu2 = shuben2.selectBook();
          for(int i=0;i<shu2.size();i++){
         %>
        <li>
        <a href='bookdetail.jsp?nid=<%=shu2.get(i).getId() %>'> 
           <%=shu2.get(i).getTitle() %>       
        </a>
        </li>
        <li></li>
        <% } %>
        
            </ul>
        </div>
        <!--hot books end-->
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
   <!-- 滚动文字 -->
<script type="text/javascript">
function $(element){
if(arguments.length>1){
for(var i=0,length=arguments.length,elements=[];i<length;i++){
elements.push($(arguments[i]));
}
return elements;
}
if(typeof element=="string"){
return document.getElementById(element);
}else{
return element;
}
}
var Class={
create:function(){
return function(){
this.initialize.apply(this,arguments);
}
}
}
Function.prototype.bind=function(object){
var method=this;
return function(){
method.apply(object,arguments);
}
}
var Scroll=Class.create();
Scroll.prototype={
initialize:function(element,height){
this.element=$(element);
this.element.innerHTML+=this.element.innerHTML;
this.height=height;
this.maxHeight=this.element.scrollHeight/2;
this.counter=0;
this.scroll();
this.timer="";
this.element.onmouseover=this.stop.bind(this);
this.element.onmouseout=function(){this.timer=setTimeout(this.scroll.bind(this),1000);}.bind(this);
},
scroll:function(){
if(this.element.scrollTop<this.maxHeight){
this.element.scrollTop++;
this.counter++;
}else{
this.element.scrollTop=0;
this.counter=0;
}
if(this.counter<this.height){
this.timer=setTimeout(this.scroll.bind(this),20);
}else{
this.counter=0;
this.timer=setTimeout(this.scroll.bind(this),1000);
}
},
stop:function(){
clearTimeout(this.timer);
}
}
var myscroll=new Scroll("myscroll",24);
</script>     
        
        <!--laster books start-->
        <div class="sidedt laster">
        	<h1>热销排行</h1>
            <ul>
      <% for(int i=0;i<shu2.size();i++){%>
        <li>
        <a href='bookdetail.jsp?nid=<%=shu2.get(i).getId() %>'> 
           <%=shu2.get(i).getTitle() %>       
        </a>
        </li>
        <li></li>
        <% } %>
            </ul>
        </div>
        <!--laster books end-->
    </div>
</div>


<div id="footer">
	<!--contac us-->
	<div class="telephone">
        <strong>热线</strong> 021-61508168　<strong>传真</strong> 021-61508168-8020　 <br />
        <strong>Q Q</strong>375013071??13483528 ?? 562655482??1143735195（技术)<br />
        <strong>MSN</strong> hjservice@hotmail.com???<strong>信箱</strong> shop@hjenglish.com<br />
        <strong>帮助</strong> <a href="/help/help.aspx" target="_blank">银行汇款帐户</a> <a href="/help/help.aspx#help_post" target="_blank">邮局汇款地址</a> 	<a href="/help/help.aspx#help_ship" target="_blank">送货方式及费用</a> <a href="http://www.hjenglish.com/down/faq_2.htm" target="_blank">如何进行下载</a>
    </div>
    <!---->
  <div class="imp_link">
    	<img src="Images/alipay.gif" alt="支付宝支付" /><img src="Images/online_pay.gif" alt="在线支付" /><br />
        <a href="http://www.hjenglish.com/about/aboutus.htm" target="_blank">网站介绍</a>　<a href="http://www.hjenglish.com/about/partner.htm" target="_blank">合作伙伴</a>　<a href="#" target="_blank">网站地图</a>　<a href="#" target="_blank">联系我们</a><br />
    <a href="#" target="_blank">增值电信业务经营许可证沪B2-20040503</a> </div>
</div>

<div id="child_site">
	<strong>分站</strong>　 <a href="#" target="_blank">沪江网</a>? <a href="#" target="_blank">听说</a>? <a href="#" target="_blank">口译</a>? <a href="#" target="_blank">CET</a>? <a href="#" target="_blank">考研</a>? <a href="#" target="_blank">雅思</a>? <a href="#" target="_blank">托福</a>? <a href="#" target="_blank">日语</a>? <a href="#" target="_blank">法语</a>? <a href="#" target="_blank">下载</a>? <a href="#" target="_blank">文库</a>? <a href="#" target="_blank">部落</a>? <a href="#" target="_blank">博客</a>? <a href="#" target="_blank">词典</a>? <a href="#" target="_blank">IT新闻</a>? <a href="#" target="_blank">博客园</a>? <a title="新世界日语" href="#" target="_blank">新世界日语</a>? <a title="2010考研书籍推荐专题" href="#" target="_blank">2010考研书籍</a>
</div>


</body>
</html>