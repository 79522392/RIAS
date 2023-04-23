<%@page import="com.work.entity.List"%>
<%@ page import="com.work.mapper.ListMapper" pageEncoding="UTF-8"%>
<%@ page import="com.work.entity.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
  <head>  
  <meta content="text/html; charset=utf-8">
  <link rel="stylesheet" type="text/css" href="css/all.css">
    <title></title>
  </head>
  <%
   ListMapper dao=new ListMapper();
   ArrayList list=dao.findAll();
   %>
  <body>
<h1 align="center"><br></h1><h1 align="center">招聘信息</h1>
<form>
<input type="hidden" name="id" >
<table border="1" align="center" class="table11_6">
   <tr>
      <th>编号</th>
      <th>工作名称</th>
      <th>薪资</th>
      <th>学历</th>
      <th>工作时间</th>
      <th>工作地区</th>
      <th>公司名称</th>
      <th>公司规模</th>
      <th>行业类型</th>
      <th>工作链接</th>
      <th>公司链接</th>
   </tr>
   <%for(int i=0;i<list.size();i++){
    List obj=(List)list.get(i);%>
    <tr>
     <td><%=obj.getId()%></td>
     <td><%=obj.getJob_name()%></td>
     <td><%=obj.getSalary()%></td>
     <td><%=obj.getDegree()%></td>
     <td><%=obj.getWork_year()%></td>
     <td><%=obj.getJob_area()%></td>
     <td><%=obj.getCompany_name()%></td>
     <td><%=obj.getCompany_size()%></td>
     <td><%=obj.getIndustry_type()%></td>
     <td><%=obj.getJob_href()%></td>
     <td><%=obj.getCompany_href()%></td>
    </tr>
   <%}%>
  </table>
 </form>
  </body>
<html>