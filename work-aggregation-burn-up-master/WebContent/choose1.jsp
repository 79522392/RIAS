<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    String path=request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<style>
	.searchContainer {
	    height: 70px;
	    width: 800px;
	    margin: 0 auto 0 auto;
	    padding-top: 10px;
	}
	.parent {
	    position: relative;
	}
	.search {
	    width: 300px;
    	height: 40px;
    	border-radius: 18px;
    	outline: none;
    	border: 1px solid #ccc;
    	padding-left: 20px;
    	position: absolute;    
    	left: 400px;
	
	}
	.btn{
	    height: 35px;
    	width: 35px;
    	position: absolute;
    	background: url(images/searchButton.png) repeat 2px 74px;
    	top: 3px;
    	left: 650px;
    	border: none;
    	outline: none;
    	cursor: pointer;
	}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/joblist.css" />
<title>choose</title>
<link rel="stylesheet" type="text/css" href="css/choose.css">
<script type="text/javascript" src="<%=path %>/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript">
var arr=[];
var select=[];
$(function(){
	$(".store dt+dd a" ).attr("class",'all-color');
	$(".store a").click(function(){
		//移除本来选的地方的颜色
		$(this).parents("dl").children('dd').each(function(){
			$(this).children('div').children('a').removeClass("all-color")
		})
		//给所选的添加颜色
		$(this).attr("class",'all-color');
		//隐藏筛选栏
		$(this).parentsUntil("dl").parent().hide();
		
		arr.push($(this));
		//获取已选项目的类别和具体选项
		var s="";
		for(var i=0;i<arr.length;i++){
			//获取
			select[i]=arr[i].parents("dl").children('dt').html()+":"+arr[i].html()+"!";
			s=s+select[i];
		}
		
		//将筛选条件传到servlet中
		//window.location.href="jobList?sel="encodeURI(encodeURI(s));//此种方式解决了+/等特殊字符丢失的问题
		//request.setAttribute("sel",select);
		
		var val=$(this).html();
		//alert(val);
		var domItem="<a onclick=deletes('"+val+"') rel='"+val+"'> × <span>"+val+"</span> </a>";
		$(".itme").append(domItem);
		//$(".itme a span").append(val);
		
		//$(".list1").loadData("jobList",{"sel":s});
		$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath }/jobList",
				data:{"sel":s}, 
				success:function(){
					$(".list1").load("jobList .list2",{"sel":s});
					//$("#list1").datagrid("reload");
				}

		});
		

	})
	$(".favorite span").click(function(){
		 var s=$(this).html();
		 var userID  ="<%=session.getAttribute("userID")%>";
		 s=s.replace("收藏","");
	
		 $.ajax({
				type:"post",
				url:"${pageContext.request.contextPath }/SetFavorite",
				data:{"userID":userID,"JobId":s}, 
				success:function(){
					 alert("已收藏");
				}
		});		 
	})
	$(".p a").click(function(){
		 var n=$(this).html();
			
			//获取已选项目的类别和具体选项
			var s="";
			for(var i=0;i<arr.length;i++){
				//获取
				select[i]=arr[i].parents("dl").children('dt').html()+":"+arr[i].html()+"!";
				s=s+select[i];
			}
			$(".list1").load("jobList .list2",{"sel":s,"page":n});
			
	})
	$(".submit").click(function(){
		var dom=document.getElementById('pg');
		 var n=dom.value;
			
			//获取已选项目的类别和具体选项
			var s="";
			for(var i=0;i<arr.length;i++){
				//获取
				select[i]=arr[i].parents("dl").children('dt').html()+":"+arr[i].html()+"!";
				s=s+select[i];
			}
			$(".list1").load("jobList .list2",{"sel":s,"page":n});
			
	})
})

function deletes(val){
	$(".filter").find("a[rel='"+val+"']").remove();
	for(var i=0;i<arr.length;i++){
		if(arr[i].html()==val){
			arr[i].parentsUntil("dl").parent().show();
			arr.splice(i,1);
			i--;
		}else{
			arr[i].parentsUntil("dl").parent().hide();
		}
	}
	var s="";
	for(var i=0;i<arr.length;i++){
		//获取
		select[i]=arr[i].parents("dl").children('dt').html()+":"+arr[i].html()+"!";
		s=s+select[i];
	}
	$(".list1").load("jobList .list2",{"sel":s});
}

	//将筛选条件传到servlet中
	//window.location.href="jobList?sel="+select;


</script>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>

<!-- 搜索框 -->
<div class="searchContainer">
     <%String keyWord=(String) request.getAttribute("keyWord");//获取搜索关键词 %>
    <form action="jobList" method="post" class="parent">
        <input type="text" class="search" name="searchKeyWord" placeholder="搜索职位/类别/地点/公司关键词" 
        value="<%
        if(keyWord!=null)
        	out.print(keyWord);
        else
            out.print("");%>"/>
        <input type="submit" value=" " name="" id="" class="btn"/>
    </form>
</div>

<div class='container'>
	<div class='filter'>
		<span>已选条件:</span>
		<div class='itme'>
			<!--  <a>
				×  <span>惠普</span>
			</a>-->
		</div>  
	</div>
	<div class='store'>
		<dl>
			<dt >工作地点</dt>
			<dd><div><a>全部</a></div></dd>
			<dd><div><a>福州</a></div></dd>
			<dd><div><a>上海</a></div></dd>
			<dd><div><a>杭州</a></div></dd>
			<dd><div><a>北京</a></div></dd>
			<dd><div><a>深圳</a></div></dd>
			<dd><div><a>武汉</a></div></dd>
			<dd><div><a>北京</a></div></dd>
			<dd><div><a>山东</a></div></dd>
		</dl>
		<dl>
			<dt>职位类别</dt>
			<dd><div><a>全部</a></div></dd>
			<dd><div><a>Java</a></div></dd>
			<dd><div><a>PHP</a></div></dd>
			<dd><div><a>Python</a></div></dd>
			<dd><div><a>C</a></div></dd>
			<dd><div><a>C++</a></div></dd>
			<dd><div><a>.NET</a></div></dd>
			<dd><div><a>互联网软件开发</a></div></dd>
			<dd><div><a>视觉设计</a></div></dd>
		</dl>
		<dl>
			<dt>月薪范围</dt>
			<dd><div><a>全部</a></div></dd>
			<dd><div><a>0-5k</a></div></dd>
			<dd><div><a>5-10k</a></div></dd>
			<dd><div><a>10-20k</a></div></dd>
			<dd><div><a>20-30k</a></div></dd>
			<dd><div><a>30-40k</a></div></dd>
			<dd><div><a>40-50k</a></div></dd>
			<dd><div><a>50-100k</a></div></dd>
		</dl>
	
	</div>
</div>
<%

	int PageSize = 30;//每页显示记录数
	int StartRow = 0; //开始显示记录的编号 
	int PageNo = 0;//需要显示的页数
	int CounterStart = 0;//每页页码的初始值
	int CounterEnd = 0;//显示页码的最大值
	int RecordCount = 0;//总记录数;
	int MaxPage = 0;//总页数
	int PrevStart = 0;//前一页
	int NextPage = 0;//下一页
	int LastRec = 0;
	int LastStartRecord = 0;//最后一页开始显示记录的编号


	//out.print(request.getParameter("PageNo"));
	//获取需要显示的页数，由用户提交
	if (request.getAttribute("PageNo") == null||request.getAttribute("PageNo").toString()=="0") { //如果为空，则表示第1页
		System.out.println("1当前页面："+PageNo);
		if (StartRow == 0) {
			PageNo = StartRow + 1; //设定为1
		}
	} else {
		PageNo = Integer.parseInt(request.getAttribute("PageNo").toString()); //获得用户提交的页数
		System.out.println("2当前页面："+PageNo);
		StartRow = (PageNo - 1) * PageSize; //获得开始显示的记录编号
	}


	//因为显示页码的数量是动态变化的，假如总共有一百页，则不可能同时显示100个链接。而是根据当前的页数显示
	//一定数量的页面链接

	//设置显示页码的初始值!!
	if (PageNo % PageSize == 0) {
		CounterStart = PageNo - (PageSize - 1);
	} else {
		CounterStart = PageNo - (PageNo % PageSize) + 1;
	}
	CounterEnd = CounterStart + (PageSize - 1);

%>
<div class="list1" id="list1" url="reloadList">
	<div class=list2>    
    <!-- 列表输出区 -->
    <table id="list" url="jobList" >
    <%
   //循环显示数据
    List<Job> jobList=(List)request.getAttribute("jobList1"); // 取request里面的对象队列
    if(jobList.size()!=0){
    	//分页
    	RecordCount=jobList.size();
        if (RecordCount % PageSize == 0) {
			MaxPage = RecordCount / PageSize;
		} else {
			MaxPage = RecordCount / PageSize + 1;
		}

      //i根据页面所需显示数据
        int i=0;
        i=i + (PageNo - 1) * PageSize;
        for(int j=0;j<PageSize;j++){
        Job job =new Job(); //新建对象
         job = jobList.get(i);
    //out.print(jobList.size());
    //out.print("1"+job.getType());
    
     %>
      <li>
            <div class="job-list-item">
                <div
                    data-info="%7B%22jobId%22%3A%2244274251%22%2C%22jobKind%22%3A%222%22%2C%22as_from%22%3A%22search_prime%22%2C%22d_headId%22%3A%2289d23413e87b20c6d11aae36efe08126%22%2C%22d_ckId%22%3A%22459196759810e280590566ae54f6842f%22%2C%22d_curPage%22%3A%220%22%2C%22d_pageSize%22%3A%2240%22%7D"
                    class="job-card-pc-container seo-job-card-action-box"
                >
                    <div class="job-card-left-box">
                        <div class="job-detail-box">
                        <div class="favorite">
                        <span >收藏<%=jobList.get(i).getJobId() %></span>
                        </div>
                            <!-- href需拼上dataPromId数据 -->
                            <a data-nick="job-detail-job-info"
                               target="_blank"
                               href="<%=jobList.get(i).getUrl()%>"
                            >
                                <div class="job-detail-header-box">
                                    <div class="job-title-box">
                                        <div title="销售专员" class="ellipsis-1"><%=jobList.get(i).getJobName() %></div>
                                        <div class="job-dq-box">
                                            <span class="dq-bracket">【</span>
                                            <span class="ellipsis-1"><%=jobList.get(i).getPlace() %></span>
                                            <span class="dq-bracket">】</span>
                                        </div>
                                    </div>
                                    
                                    <span class="job-salary"><%=jobList.get(i).getSalary() %></span>
                                </div>
                                <div class="job-labels-box">
                                    <!-- campusJobKind 非空时显示 -->
                                    <!-- requireWorkYears 非空时显示 -->
                                    <span class="labels-tag"><%=jobList.get(i).getExperience() %></span>
                                    <span class="labels-tag" ><%=jobList.get(i).getDegree() %></span>
                                    <span class="labels-tag" ><%=jobList.get(i).getType() %></span>
                                </div>
                            </a>
                                     <div class="job-company-info-box">
                                        <span class="company-name ellipsis-1"><%=jobList.get(i).getCompanyName() %></span>
                                        <!-- compIndustry || compStage || compScale 三个都没有值时不显示 -->
                                        <div class="company-tags-box ellipsis-1">
                                            <span><%=jobList.get(i).getWelfare()%></span>
                                            
                                        </div>
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </li>
      <%
      i++;
        }
    }else{
     %>
<tr><td colspan="6">数据库中没有数据！</td></tr>
    <%
    }
    
    %>
    <div align="center">
        <font size=4><%="当前页：" + PageNo + "/"+ MaxPage%></font>
	    <div class="p">
     <%
			/*
			   打印需要显示的页码
			*/
			 CounterStart=PageNo;
			 CounterEnd=CounterStart+10;
			 
			for (int c = CounterStart; c <= CounterEnd; c++) {
				if (c < MaxPage) {
					if (c == PageNo) {
						if (c % PageSize == 0) {
							out.print(c);
						} else {
							out.print(c + " ,");
						}
					} else if (c % PageSize == 0) {
						%>
						<a><%=c %></a>,
						<%
					} else {
						%>
						<a><%=c %></a>,
						<%
					}
				} else {
					if (PageNo == MaxPage) {
						out.print(c);
						break;
					} else {
						%>
						<a><%=c %></a>,
						<%
						break;
					}
				}
			}
%>
</div>
    
    </div>
<div align="center">
<input id="pg" value="<%=PageNo%>" style="width:50px"/>
<a class="submit">确定</a>
</div>
      </table>
	</div>
</div>


</body>
</html>