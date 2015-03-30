<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
   //注销
   String name=(String)session.getAttribute("NAME");
   //退出，返回原页面
   ServletContext context=getServletContext();
   Map<String,String> us=(Map<String,String>)context.getAttribute("users");
   if(null!=us){
         for(String k:us.keySet()){
            //判断us这个map是否存储了要登陆的用户
            if(us.get(k).equals(name)){
             //从map中移除该用户
             us.remove(k);
            }
         }
       }
       context.setAttribute("users", us);
   session.removeAttribute("NAME");
   response.sendRedirect("http://127.0.0.1:8080/wangshangshucheng/index.jsp");
 %>
