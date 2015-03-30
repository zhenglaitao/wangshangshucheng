<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	 String nid = request.getParameter("nid");
  request.setCharacterEncoding("utf-8");
  String biaoti=request.getParameter("biaoti");
String zhengwen=request.getParameter("zhengwen");
 Date dt=new Date();
 String dd=dt.toLocaleString();

  Class.forName("com.mysql.jdbc.Driver");
  String url="jdbc:mysql://127.0.0.1:3306/book?user=root&password=root";
  Connection conn=DriverManager.getConnection(url);
  Statement stm=conn.createStatement();
  String sql="INSERT into readercomments VALUES (Id,"+nid+",'张三','"+biaoti+"','"+zhengwen+"','"+dd+"')";
  int num=stm.executeUpdate(sql);
  
  if(num>=1){%>
<script Type="text/javascript">
     alert("提交评论成功");
     open("bookdetail.jsp?nid=<%=nid %>","_self");
     </script>
<%}
  else
  {%>
<script Type="text/javascript">
     alert("提交评论失败");
     open("bookdetail.jsp?nid=<%=nid %>","_self");
     </script>
<%
  }
  stm.close();
  conn.close();
%>