<%@page import="com.web.Entity.kehu"%>
<%@page import="com.web.Service.kehuService"%>
<%@page import="com.web.Service.userinfoService" %>
<%@page import="com.web.Entity.userinfo" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=utf-8");
request.setCharacterEncoding("UTF-8");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String role = request.getParameter("role");
	if (role.equals("管理员")) {
		List<userinfo> list = new userinfoService()
				.getList(String.format("username='%s' and password='%s'", username, password));
		if (list == null || list.isEmpty()) {
			out.write("<script>alert('用户名或密码错误！');window.location.href='Login.jsp'</script>");
		} else {
			request.getSession().setAttribute("username", list.get(0));
			response.sendRedirect("index.jsp");
		}
	}else{
		List<kehu> list = new kehuService()
				.getList(String.format("username='%s' and password='%s'", username, password));
		if (list == null || list.isEmpty()) {
			out.write("<script>alert('用户名或密码错误！');window.location.href='Login.jsp'</script>");
		} else {
			request.getSession().setAttribute("kehu", list.get(0));
			response.sendRedirect("index.jsp");
		}	
	}
%>