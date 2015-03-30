<%@page import="com.msit.util.SqlHelper"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
  //1.取得表单提交过来的数据
  String name=request.getParameter("name");
  String pwd=request.getParameter("pwd");
    String uname=request.getParameter("uname");
  String address=request.getParameter("address");
    String phone=request.getParameter("phone");
  String email=request.getParameter("email");
  String id=request.getParameter("id");
  //2.加载jdbc驱动
  Class.forName("com.mysql.jdbc.Driver");
  //3.使用驱动管理类创建链接对象
  String url="jdbc:mysql://127.0.0.1:3306/book?user=root&password=root";
  DriverManager.getConnection(url);
  Connection conn=DriverManager.getConnection(url);
  //4.通过链接对象，创建执行对象
  Statement stm=conn.createStatement();
  //5.通过命令执行对象 执行sql脚本
  String sql="UPDATE users SET LoginId='"+name+"',LoginPwd='"+pwd+"',uName='"+uname+"',Address='"+address+"',Phone='"+phone+"',Mail='"+email+"'  WHERE Id="+id;
  //6.执行查询语句  得到结果集
  int num=stm.executeUpdate(sql);
  if(num>=1){
      %>
     <script Type="text/javascript">
     alert("修改成功");
     open("adminUser.jsp","_self")
     </script>
     <%
  }else{
  %>
  <script Type="text/javascript">
     alert("修改失败");
     open("adminUser.jsp","_self")
     </script>
      <%
  }
  
  stm.close();
  conn.close();  
%>