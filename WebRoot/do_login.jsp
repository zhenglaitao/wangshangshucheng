<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
  //1.取得表单提交过来的数据
  String name=request.getParameter("username");
  String pwd=request.getParameter("password");
  //2.加载jdbc驱动
  Class.forName("com.mysql.jdbc.Driver");
  //3.使用驱动管理类创建链接对象
  String url="jdbc:mysql://127.0.0.1:3306/book?user=root&password=root";
  DriverManager.getConnection(url);
  Connection conn=DriverManager.getConnection(url);
  //4.通过链接对象，创建执行对象
  Statement stm=conn.createStatement();
  //5.通过命令执行对象 执行sql脚本
  String sql="select * from users where LoginId='"+name+"' AND LoginPwd='"+pwd+"'";
  //6.执行查询语句  得到结果集
  ResultSet rs=stm.executeQuery(sql);
  if(rs.next()){
     session.setAttribute("NAME",name);
     if(name.equals("admin")){
      %>
       <script Type="text/javascript">
        alert("您使用的是管理员账号!!!");
        open("admin/login.jsp","_self");
       </script>
     <%
     }else{
     %>
     <script Type="text/javascript">
     alert("登陆成功");
     open("index.jsp","_self");
     </script>
   <%
     }
  }else{
   %>
<script Type="text/javascript">
     alert("登陆失败");
     open("login.jsp","_self");
     </script>
<%
  }
  
  rs.close();
  stm.close();
  conn.close();  
%>