<%@page import="com.web.Entity.kehu"%>
<%@page import="com.web.Service.kehuService"%> 
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=utf-8");
request.setCharacterEncoding("UTF-8");
kehu entity = new kehu(); 
entity.setUsername(request.getParameter("username"));
entity.setPassword(request.getParameter("password"));
entity.setDianhua(request.getParameter("dianhua"));

boolean tag= new kehuService().add(entity);
out.println("<script>alert('注册成功，请登录');window.location.href='Login.jsp'</script>");
%>