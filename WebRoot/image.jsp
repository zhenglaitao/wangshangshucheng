<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ page contentType="image/jpeg" import="java.awt.*, java.awt.image.*,java.util.*,javax.imageio.*"%> 

<%! 
Color getRandColor(int fc,int bc) 
{ 
Random random = new Random(); 
if(fc>255) fc=255; 
if(bc>255) bc=255; 
int r=fc+random.nextInt(bc-fc); 
int g=fc+random.nextInt(bc-fc); 
int b=fc+random.nextInt(bc-fc); 
return new Color(r,g,b); 
} 
%> 



<% 

/*
产生这样的异常原因:是web容器生成的servlet代码中有out.write(""),这个和JSP中调用的response.getOutputStream()产生冲突.
即Servlet规范说明，不能既调用response.getOutputStream()，又调用response.getWriter(),无论先调用哪一个，
在调用第二个时候应会抛出IllegalStateException，因为在jsp中，out变量实际上是通过response.getWriter得到的
，你的程序中既用了response.getOutputStream，又用了out变量，故出现以上错误。

*/

////下面两行非常重要，java.lang.IllegalStateException: getOutputStream() has already been called


out.clear();   
out = pageContext.pushBody(); 



response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache"); 
response.setDateHeader("Expires", 0); 


int width=60, height=20;
 
 //图像对象
BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB); 

//画笔对象
Graphics g = image.getGraphics(); 

Random random = new Random(); 
//设置画笔的颜色
g.setColor(getRandColor(200,250)); 

//填充矩形
g.fillRect(0, 0, width, height); 

//设置字体
g.setFont(new Font("Times New Roman",Font.PLAIN,18)); 

//设置画笔的颜色
g.setColor(getRandColor(160,200)); 


//产生155条线
for (int i=0;i<155;i++) 
{ 
int x = random.nextInt(width); 
int y = random.nextInt(height); 
int xl = random.nextInt(12); 
int yl = random.nextInt(12); 
//画线
g.drawLine(x,y,x+xl,y+yl); 
} 


//生成4个数字
String sRand=""; 
for (int i=0;i<4;i++){ 
String rand=String.valueOf(random.nextInt(10)); 
sRand+=rand; 
g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110))); 

//输出字符串
g.drawString(rand,13*i+6,16); 
} 


// 将认证码存入SESSION 
session.setAttribute("rand",sRand); 
g.dispose(); 
ImageIO.write(image, "JPEG", response.getOutputStream()); 
%>

