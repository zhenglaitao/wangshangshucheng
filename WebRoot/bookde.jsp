<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.msit.books.Categories"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="com.msit.books.Books"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="Robots" content="index,follow" />
<title>"第三波书店"-网上书店</title>
<link href="CSS/global.css" rel="stylesheet" type="text/css" />
<link href="CSS/channel.css" rel="stylesheet" type="text/css" />
<link href="CSS/answer.css" rel="stylesheet" type="text/css" />
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
    	<div id="basket"></div>
        <div id="search">
        	<form action="" method="post" target="_blank">
            	<input type="text" id="keyword" class="search_key" />
                <input type="submit" id="s_submit" class="search_sub" value="" />
            </form>
        </div>
        <div id="alltype">
        	<h1 class="all_type black"><a href="index.jsp">查看所有分类>></a></h1>
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
        
      
        <!--link start-->
    </div>
   
     <jsp:useBean id="nc" class="book.books" />
      
               <%
			  String nid = request.getParameter("nid");
			  Books n= nc.getBookByid(nid);//在此调用查询单个方法
			%>
			 <form action="TianjiaChe.jsp?nid=<%=nid %>" method="post">
    <div class="book_view">
    <c:set var="ss" value="<%=n.getTitle() %>" />
    	<h1 class="b_title">${fn:substring(ss,0,40)}</h1>
        <div class="b_exa">
        	<span class="book_group">丛书名：${fn:substring(ss,0,40)}</span>
            <span class="book_status">正在阅读（<%=n.getNowRead() %> 人），已经阅读（<%=n.getOllRead() %> 人）</span>
        </div>
        
        <!--book basic start-->
        <dl class="put_book">
        	<dt>
            	<img src="Images/BookCovers/<%=n.getIsbn() %>.jpg" onerror="this.src='Images/default.jpg'" alt="" width="150" height="200"/>
            	<div class="chakan"><img src="Images/zoom.gif" /> <a class="gray878787a" href="datu.jsp?nid=<%=nid %>" name="bigpicture">点击查看大图</a></div>
            </dt>
             
            <dd>
            	<div id="book_editor">作　　者：<%=n.getAuthor() %></div>
                <ul id="book_attribute">
                    <li>出版时间：<%=n.getPublishDate() %></li>
                    <li>字　　数：<%=n.getWordsCount() %> </li>
                    <li>版　　次： <%=n.getPublisherId() %></li>

                    <li>页　　数： 540</li>
                    <li>印刷时间： 2009-5-1</li>
                    <li>开　　本： 16开</li>
                    <li>印　　次： 1</li>
                    <li>纸　　张： 胶版纸</li>
                    <li>I S B N    ： <%=n.getIsbn() %></li>

                    <li>包　　装： 平装</li>
                </ul>
                
                <div id="book_categroy">所属分类： <a href="#" target="_blank" class="blue12a">图书</a>  </div>
                
                <div id="book_price">
                    <span class="gray87">定价：<%=n.getUnitPrice() %></span>
                </div> 
                
                <div id="book_point">
                	
                	<span >购买数量：<span id="pointsTag" ><input name="shuliang" value="1" type="text" size="5"/></span></span><br/>　
                	<input type="submit" value="添加购物车" class="gouwuche"/>
                   <a href="basket.jsp">进入购物车</a>   <a href="index.jsp">返回</a>
                   
                </div> 
                
                <div id="book_count">
                	顾客评分：<span id="book_id_15">5</span>
                    共有商品评论0条  <a href="#">查看评论摘要</a>
                </div>
                
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
				var book_score = parseInt($("book_id_15").innerHTML);
				var book_score_str="";
				
                for(var m=0; m<book_score; m++){
					book_score_str +=  "<img src='Images/star_red.gif' />";
				}
				$("book_id_15").innerHTML = book_score_str ;
                </script>

            </dd>
        </dl>
        <!--book basic end-->
        <!--book intro start-->
     
        </form>  
       
       <!-- 添加评论数据 -->
        <div class="comm_answer">
        <form action="pinglun.jsp?nid=<%=nid %>" method="post">
			<!--review head start-->
            <div id="div_product_reviews">
                <div class="total_comm">
                    <div class="comm_title">
                        <h2>商品评论 共<em>814</em>条
                        <span class="look_comm"> (<a href="#" name='reviewList'  target='_blank'>查看所有评论</a>)</span></h2>
                    </div>
        
                           标题：<input type="text" name="biaoti"/> <br />
                             正文 :<textarea name="zhengwen" cols="40" rows="5"></textarea><br/>
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="提交"/>&nbsp;&nbsp;
                               <input type="reset" value="重置"/>
                </div>
              
           
            </div>
       </form>
    </div>
</div>

<!-- 结尾 -->
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