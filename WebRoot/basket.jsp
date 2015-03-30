<%@page import="com.msit.books.Categories"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.msit.books.Gouwuche"%>
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
<!-- 导航---------------------------------------------------- -->
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
  <!--左边分类查询 -------------------------------------------------------------------- -->
  <div id="intro">
    <div id="basket"></div>
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
          <li> <a href='index2.jsp?nid=<%=catt.get(i).getId() %>'> <%=catt.get(i).getCname() %> </a> </li>
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
    <div id="s_b_03"><a href="index.jsp">赖世雄美语从头学</a><br />
      <a href="index.jsp">沪江团购 ，价格更优惠</a></div>
    <!--link start-->
  </div>
    <!--购物车主体 -------------------------------------------------------------------- -->
  <div id="action_area">
    <h2 class="action_type backet">
      <p class="imp_link">全场运费一律0元 </p>
      <p class="mark">确认商品价格与交易条件</p>
    </h2>
    <table width="101%" border="0" cellspacing="3" cellpadding="0" align="center" class="data_table">
      <thead>
        <tr>
          <th width="31%" scope="col">商品名</th>
          <th scope="col" width="18%">书本编号</th>
          <th scope="col" width="11%">作者</th>
          <th scope="col" width="14%">价格</th>
          <th scope="col" width="15%">商品数量</th>
          <th scope="col" width="11%">操作</th>
        </tr>
      </thead>
      <jsp:useBean id="gouwuche" class="book.gouwuche" />
      
      <tbody id="basket_data" >
        <%
          int allmoney=0; 
          List<Gouwuche> gou = gouwuche.selectByNid();
          for(int i=0;i<gou.size();i++){
          int a=gou.get(i).getJiage();
          int b=gou.get(i).getShuliang();
         %>
        <tr>
          <td class="name"><%=gou.get(i).getBookname() %></td>
          <td><%=gou.get(i).getBookbianhao() %></td>
          <td><%=gou.get(i).getZuozhe()%></td>
          <td><%=gou.get(i).getJiage() %></td>
          <td><%=gou.get(i).getShuliang()%></td>
          <td><a href="gouwucheSanchu.action?tid=<%=gouwuche.selectByNid().get(i).getId()%>">删除</a></td>
        </tr>
        <%
          		allmoney+=a*b;
           } %>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="6"><a href="index.jsp">继续挑选商品 </a> 一共 <%=allmoney %> 元</td>
        </tr>
      </tfoot>
    </table>
      <!--订单    表单验证 -------------------------------------------------------------------- -->
    <script type="text/javascript">
        var table_obj = $("basket_data").getElementsByTagName("tr");
        for( var i=0; i< table_obj.length; i++) table_obj[i].style.background = i%2==0?"#FEF7DB":"#E2E2E2";
		function a()
 {
	 var s=document.getElementById("name");
	 var aa=document.getElementById("name1");
	 aa.innerHTML="";
	 if(s.value=="")
	 {
		aa.innerHTML="请输入姓名！"
		return false;
		 }
		 return true;
	 }
	 
	function b()
 {
	 var shengfen3=document.getElementById("shengfen");
	 var shengfen4=document.getElementById("shengfen1");
	 shengfen4.innerHTML="";
	 if(shengfen3.value=="")
	 {
		shengfen4.innerHTML="请输入省份！"
		return false;
		 }return true;
	 }
		function c()
 {
	 var dizhi3=document.getElementById("dizhi");
	 var dizhi4=document.getElementById("dizhi1");
	 dizhi4.innerHTML="";
	 if(dizhi3.value=="")
	 {
		dizhi4.innerHTML="请输入地址！"
		return false;
		 }return true;
	 }		
			function d()
 {
	 var youbian3=document.getElementById("youbian");
	 var youbian4=document.getElementById("youbian1");
	 youbian4.innerHTML="";
	 if(youbian3.value=="")
	 {
		youbian4.innerHTML="请输入邮编！"
		return false;
		 }
	 if(youbian3.value.length!=6)
	{
		youbian4.innerHTML="邮编为六位数!"
		return false;
		}return true;
	 }		
		
		function e()
 {
	 var gudingdianhua3=document.getElementById("gudingdianhua");
	 var gudingdianhua4=document.getElementById("gudingdianhua1");
	 gudingdianhua4.innerHTML="";
	 if(gudingdianhua3.value=="")
	 {
		gudingdianhua4.innerHTML="请输入电话！"
		return false;
		 }
    if(gudingdianhua3.value.length!=7)
	{
		gudingdianhua4.innerHTML="电话长度为七位数!"
		return false;
		}
	return true;
	 }		
	
	 		function f()
 {
	 var shouji3=document.getElementById("shouji");
	 var shouji4=document.getElementById("shouji1");
	 shouji4.innerHTML="";
	 if(shouji3.value=="")
	 {
		shouji4.innerHTML="请输入手机号码！"
		return false;
		 }
  if(shouji3.value.length!=11)
	{
		shouji4.innerHTML="手机号码为十一位数!"
		return false;
		}
	return true;
	 }			
	 
	 		function g()
 {
	 var Email3=document.getElementById("Email");
	 var Email4=document.getElementById("Email1");
	 Email4.innerHTML="";
	 if(Email3.value=="")
	 {
		Email4.innerHTML="请输入Email！"
		return false;
		 }
		 if(Email3.value.indexOf('@',0)==-1)
	{
		Email4.innerHTML="Email必须包含@字符!";
		return false;
		} 
		return true;
	 }	
	 
	 function ss()
	 {
		 if(a()!=true||b()!=true||c()!=true||d()!=true||e()!=true||f()!=true||g()!=true)
		 {
			 return false;
			 }
			 return true;
		 }
        </script>
    <h2 class="action_type_h">补充您的邮件地址和联系人基本信息</h2>
    <form action="gouwuche_lianxiren" method="post" class="member_form" onsubmit="return ss()">
      <p class="notice">请确认联系人基本信息：</p>
      <table width="666">
        <tr>
          <td width="65">收件人:</td>
          <td width="144"><input type="text" name="name" onblur="a()"/></td><td width="106"><div id="name1" style="color:#F00"></div></td>
          <td width="57">省&nbsp;&nbsp;份:</td>
          <td width="145"><input type="text" name="shengfen" onblur="b()"/></td><td width="121"><div id="shengfen1" style="color:#F00"></div></td>
        </tr>
        <tr>
          <td> 地&nbsp;&nbsp;址: </td>
          <td><input type="text" name="dizhi" onblur="c()"/></td><td width="106"><div id="dizhi1" style="color:#F00"></div></td>
          <td>邮&nbsp;&nbsp;编: </td>
          <td><input type="text" name="youbian" onblur="d()"/></td><td width="121"><div id="youbian1" style="color:#F00"></div></td>
        </tr>
        <tr>
          <td height="21">固定电话:</td>
          <td><input type="text" name="gudingdianhua" onblur="e()"/></td><td width="106"><div id="gudingdianhua1" style="color:#F00"></div></td>
          <td>手&nbsp;&nbsp;机:</td>
          <td><input type="text" name="shouji" onblur="f()"/></td><td width="121"><div id="shouji1" style="color:#F00"></div></td>
        </tr>
        <tr>
          <td>电子邮件:</td>
          <td><input type="text" name="Email" onblur="g()"/></td><td width="106"><div id="Email1" style="color:#F00"></div></td>
          <td>发票类型:&nbsp;</td>
          <td colspan="2"><input type="text" value="普通发票" name="leixin"/></td>
        </tr>
        <tr>
          <td>发票抬头:&nbsp;</td>
          <td><input type="text" value="个人" name="taitou"/></td>
          <td></td>
          <td >发票内容:&nbsp;</td>
          <td colspan="2"><input type="text" value="书本" name="text"/></td>
        </tr>
        <tr>
          <td>留&nbsp;言：</td>
          <td  colspan="6"><textarea name="liuyan" cols="58"></textarea></td>
        </tr>
        <tr>
          <td colspan="6"><p class="form_sub basker_ok_link"><a href="index.jsp">继续购物</a><a href="QingKong.action">清空购物车</a>
            <input type="submit" value="" class="basker_ok" onclick="retrun gouwu()"/>
          </p></td>
        </tr>
      </table>
    </form>
  </div>
</div>


  <!-- 尾部-------------------------------------------------------------------- -->
<div id="footer">
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