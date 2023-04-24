<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>

<html lang="en">
<head>
<meta charset="UTF-8">
<title>互联网信息聚合系统</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/root.js"></script>
<link rel="stylesheet" type="text/css" href="css/root.css">
 </head>
 <body>
     <div class="wrap">
         <div class="header">互联网信息聚合系统</div>
	     <div class="nav">
             <ul>
	             <li class="nav-list">
			         <h2>
					     首页
					     <i></i>
					 </h2>
				     <div class="hide">
					     <h5 onclick="show()">招聘信息一览</h5>
						 <h5 onclick="add()">招聘信息搜索</h5>
					 </div>
			     </li>
			     <li class="nav-list">
			         <h2>数据分析相关
					     <i></i>  
					 </h2>
				     <div class="hide">
					     <h5 onclick="add()">地区数据分析</h5>
						 <h5 onclick="add()">薪资数据分析</h5>
						 <h5 onclick="add()">学历数据分析</h5>
					 </div>
			     </li>
				 <li class="nav-list">
			         <h2>个人信息相关
					     <i></i>  
					 </h2>
				     <div class="hide">
					     <h5 onclick="add()">个人详细信息</h5>
						 <h5 onclick="add()">修改个人信息</h5>
					 </div>
			     </li>
				 <li class="nav-list">
			         <h2>招聘方相关
					     <i></i>  
					 </h2>
				     <div class="hide">
					     <h5 onclick="add()">发布招牌信息</h5>
					 </div>
			     </li>
				 <li class="nav-list">
			         <h2>管理员相关
					     <i></i>  
					 </h2>
				     <div class="hide">
					     <h5 onclick="add()">招聘信息管理</h5>
						 <h5 onclick="add()">用户信息管理</h5>
					 </div>
			     </li>
             </ul>
	     </div>
		<button class="button" type="button" id="return" onclick="closewindow()">退出系统</button>
     </div>
     
 <script type="text/javascript">
 var aList = document.querySelectorAll('.nav-list h2');    //依次获取需要h2，.hide,i标签
 var aHide = document.querySelectorAll('.hide');
 var oIcon = document.querySelectorAll('.nav-list i');
 var lastIndex = 0;    //自定义变量监控点击后的下标
 for(var i=0;i<aList.length;i++){
     aList[i].index = i;  //自定义属性保存下标
     aList[i].onclick = function() {
		 //判断是否二次点击同一栏
		 if(aHide[this.index].style.height =='' || aHide[this.index].style.height == '0px'){
		 aHide[lastIndex].style.height = '0';
		 aList[lastIndex].className = '';
		 oIcon[lastIndex].className = '';
		 //设置当前样式
         aHide[this.index].style.height = '135px';
	     aList[this.index].className = 'on';            //点击后为h2添加class = 'on'
		 oIcon[this.index].className = 'on';
		 }
		  else{
		     aHide[this.index].style.height = '0';
		     aList[this.index].className = '';
		     oIcon[this.index].className = '';
		  }
		 lastIndex = this.index; // 保存当前下标
 	}
 }
 </script>
 
 </body>
</html>