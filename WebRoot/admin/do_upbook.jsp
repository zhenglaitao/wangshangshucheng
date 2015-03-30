<%@page import="com.msit.util.SqlHelper"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
  //1.取得表单提交过来的数据
  String bookname=request.getParameter("bookname");
  String author=request.getParameter("author");
  String date=request.getParameter("date");
  String count=request.getParameter("count");
  String price=request.getParameter("price");
  String isbn=request.getParameter("isbn");
  //2.加载jdbc驱动
  Class.forName("com.mysql.jdbc.Driver");
  //3.使用驱动管理类创建链接对象
  String url="jdbc:mysql://127.0.0.1:3306/book?user=root&password=root";
  DriverManager.getConnection(url);
  Connection conn=DriverManager.getConnection(url);
  //4.通过链接对象，创建执行对象
  Statement stm=conn.createStatement();
  //5.通过命令执行对象 执行sql脚本
  String sql="UPDATE books SET Title='"+bookname+"',Author='"+author+"',PublishDate='"+date+"',WordsCount='"+count+"',UnitPrice='"+price+"' WHERE ISBN='"+isbn+"'";
  //6.执行查询语句  得到结果集
  int num=stm.executeUpdate(sql);
  if(num>=1){
      %>
     <script Type="text/javascript">
     alert("修改成功");
     open("adminBooks.jsp","_self")
     </script>
     <%
  }else{
  %>
  <script Type="text/javascript">
     alert("修改失败");
     open("BookQuery.jsp","_self")
     </script>
      <%
  }
  
  stm.close();
  conn.close();  
%>