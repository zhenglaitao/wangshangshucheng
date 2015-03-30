<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.msit.books.users"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
  request.setCharacterEncoding("utf-8");
  
  String username=request.getParameter("username");
  String password=request.getParameter("password");
  
  String name=request.getParameter("name");
  String emil=request.getParameter("email");
   String phone=request.getParameter("phone");
   String adress=request.getParameter("adress");

  users comm=new users();
  Class.forName("com.mysql.jdbc.Driver");
  String url="jdbc:mysql://127.0.0.1:3306/book?user=root&password=root";
  Connection conn=DriverManager.getConnection(url);
  Statement stm=conn.createStatement();
  String sql="INSERT into users(id,LoginId,LoginPwd,uName,Mail,Phone,Address,UserRoleId,UserStateId) VALUE(id,'"+username+"','"+password+"','"+name+"','"+emil+"','"+phone+"','"+adress+"',1,1)";
  int num=stm.executeUpdate(sql);
  if(num>=1){%>
  <script Type="text/javascript">
     alert("注册成功");
     open("index.jsp","_self");
     </script>
  <%}
  else
  {%>
  <script Type="text/javascript">
     alert("注册失败");
     open("index.jsp","_self");
     </script>
  <%
  }
  stm.close();
  conn.close();
%>

