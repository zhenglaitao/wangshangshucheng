<%@page import="com.msit.util.SqlHelper"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.msit.books.Gouwuche"%>
<%@page import="java.util.Date"%>
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
    	<div class="order_p_head"><img src="Images/order_p_h.gif" alt="请认真核对订单信息" /></div>
    </div>
</div>

<div id="container">
	<h3 class="order_p_title">填写核对订单信息</h3>
    <div class="order_p_main">
    	<dl>
        	<dt>收货人信息   [<a href="basket.jsp">修改</a>]</dt>
            <dd>收货人姓名：<s:property value="#session.name"/><br />
            	省&#160;&#160;&#160;&#160;份：<s:property value="#session.shengfen"/><br />
                地址：<s:property value="#session.dizhi"/><br />
                邮编：<s:property value="#session.youbian"/><br />
                固定电话：<s:property value="#session.gudingdianhua"/><br />
                手机：<s:property value="#session.shouji"/><br />
                电子右键：<s:property value="#session.Email"/>
            </dd>
        </dl>
        
        <dl>
        	<dt>发票信息   [<a href="basket.jsp">修改</a>]</dt>
            <dd>发票类型：<s:property value="#session.leixin"/><br />
            	发票抬头：<s:property value="#session.taitou"/><br />
                发票内容：<s:property value="#session.text"/>
            </dd>
        </dl>
        
        <dl>
        	<dt>订单备注   [<a href="basket.jsp">修改</a>]</dt>
            <dd><s:property value="#session.liuyan"/>
            </dd>
        </dl>
        
        <dl class="nopadding">
        	<dt>商品清单   <a href="basket.jsp">返回修改购物车</a></dt>
            <dd>
            <table width="96%" align="center" border="0" cellspacing="0" cellpadding="0" class="order_table">
            <thead>
              <tr>
                <th scope="col">书本名称</th>
                <th scope="col" width="10%">书本编号</th>
                <th scope="col" width="10%">作者</th>
                <th scope="col" width="10%">价格</th>
                <th scope="col" width="10%">商品数量</th>
                <th scope="col" width="10%">库存状态</th>
              </tr>
            </thead>
             <jsp:useBean id="gouwuche" class="book.gouwuche" />
            <tbody>
             <% List<Gouwuche> gou = gouwuche.selectByNid();
             int ollmoney=0;
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
                <td>有货</td>
              </tr>
                <% 
                ollmoney+=a*b;
                } %>
             </tbody>
            </table>

            </dd>
        </dl>
        
        <dl class="nopadding enddl">
        	<dt>结算信息</dt>
            <dd>
            <table width="96%" align="center" border="0" cellspacing="0" cellpadding="0" class="count_table">
            <thead><tr>
                <th scope="col" align="left" colspan="2">商品金额  <%=ollmoney %> 元 + 运费： 0.00 元 </th>
            </tr></thead>
            <tbody><tr>
                <td class="name ">（+）使用优惠券抵消部分</td>
                <td class="order_count" width="20%">应付总额：<span class="red"><%=ollmoney %></span> 元</td>
            </tr></tbody>
            </table>

            </dd>
        </dl>
         <%
        Date dt=new Date();
         String dd=dt.toLocaleString();
 
  String name=request.getParameter("name");
  String shengfen=request.getParameter("shengfen");
  String dizhi=request.getParameter("dizhi");
  String youbian=request.getParameter("youbian");
  String gudingdianhua=request.getParameter("gudingdianhua");
  String shouji=request.getParameter("shouji");
  String Email=request.getParameter("Email");
  String sql="INSERT into orderbook(Id,name,shengfen,dizhi,youbian,dianhua,shouji,email,shijian,jiage) VALUE(Id,'"+name+"','"+shengfen+"','"+dizhi+"','"+youbian+"','"+gudingdianhua+"','"+shouji+"','"+Email+"','"+dd+"','"+ollmoney+"')";
  int con=SqlHelper.executeNotQuerty(sql);
if(con>0)
{
        %>
        <script type="text/javascript">
</script>
<%
}else
{%>
<script type="text/javascript">
alert("订单提交后台失败");
</script>
<%
}
%>
        <form action="gouwucheShanchuQU.action" method="post">
         <div class="order_p_btn"><input type="submit" class="order_p_sub" value="" /></div>
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