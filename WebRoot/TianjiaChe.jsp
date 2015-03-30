<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@page import="com.msit.books.Books"%>
<%@page import="com.msit.books.Gouwuche"%>
<jsp:useBean id="nc" class="book.books" />
<%
	 String nid = request.getParameter("nid");
	 Books n= nc.getBookByid(nid);//在此调用查询单个方法
  request.setCharacterEncoding("utf-8");
  String shuliang=request.getParameter("shuliang");

     //将表单数据添加到实体类中
     Gouwuche comm=new Gouwuche();
     //调用后台业务处理类  做添加操作
  Class.forName("com.mysql.jdbc.Driver");
  String url="jdbc:mysql://127.0.0.1:3306/book?user=root&password=root";
  Connection conn=DriverManager.getConnection(url);
  Statement stm=conn.createStatement();
  String sql="INSERT into Gouwuche VALUES (id,'"+n.getTitle()+"','"+n.getIsbn()+"','"+n.getAuthor()+"','"+n.getUnitPrice()+"','"+shuliang+"')";
  int num=stm.executeUpdate(sql);
  
  if(num>=1){%>
<script Type="text/javascript">
     alert("添加购物车成功");
     open("bookdetail.jsp?nid=<%=nid %>","_self");
     </script>
<%}
  else
  {%>
<script Type="text/javascript">
     alert("添加购物车失败");
     open("bookdetail.jsp?nid=<%=nid %>","_self");
     </script>
<%
  }
  stm.close();
  conn.close();
%>