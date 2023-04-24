<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://concat.lietou-static.com/fe-www-pc/v6/css/pages/search-jobs.fbe2ce14.css" />
 <link rel="stylesheet" type="text/css" href="choose.css">
<title>Insert title here</title>

</head>
<body>


<section>
  <div url="/JobAggregation/web/JobListServlet">
    <!-- 列表输出区 -->
    <table>
    <%
   //循环显示数据
    List<Job> jobList=(List)request.getAttribute("jobList1"); // 取request里面的对象队列
    if(jobList.size()!=0){
        for(int i=0;i<jobList.size();i++){
        Job job =new Job(); //新建对象
         job = jobList.get(i);
    //out.print(jobList.size());
    
    
     %>
      <tr>
      <td><%=jobList.get(i).getJobName() %></td> 
      <td><%=jobList.get(i).getCompanyName() %></td>
      <td><%=jobList.get(i).getSalary() %></td>
      <td><%=jobList.get(i).getPlace() %></td>
      <td><%=jobList.get(i).getWelfare()%></td>    
      </tr>
      <%
      }
    }else{
     %>
<tr><td colspan="6">数据库中没有数据！</td></tr>
    <%
    }
    %>
      </table>
  </div>
</section>

</body>
</html>