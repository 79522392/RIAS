<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
    * { 
		/* Basic CSS reset */
		margin:0; 
		padding:0;		
	}
	body {
		/* These styles have nothing to do with the ribbon */
		background:url(images/dark_wood.png) 0 0 repeat;
		padding:0 0 0;
		margin:auto;
		
	}
	.ribbon {

	}

    .ribbon:after, .ribbon:before {
		margin-top:0.5em;
		content: "";
		float:left;
		border:1.5em solid #CA8EFF ;
		width:100px;
	}

	.ribbon:after {
	}
	.ribbon:before {
		float:left;
	}

	.ribbon a:link, .ribbon a:visited { 
		color:#fff;
		text-decoration:none;
		float:left;
		height:3.5em;
		overflow:hidden;
	}
	.ribbon span {
		background:#CA8EFF;
		display:inline-block;
		line-height:3em;
		padding:0 1em;
		margin-top:0.5em;
		position:relative;

		-webkit-transition: background-color 0.2s, margin-top 0.2s;  /* Saf3.2+, Chrome */
		-moz-transition: background-color 0.2s, margin-top 0.2s;  /* FF4+ */
		-ms-transition: background-color 0.2s, margin-top 0.2s;  /* IE10 */
		-o-transition: background-color 0.2s, margin-top 0.2s;  /* Opera 10.5+ */
		transition: background-color 0.2s, margin-top 0.2s;
	}
	.ribbon a:hover span {
		background: #F1E1FF ;
		margin-top:0;
	}

	.ribbon span:before {
		content: "";
		position:absolute;
		top:3em;
		left:0;
		border-right:0.5em solid #9B8651;
		border-bottom:0.5em solid #F1E1FF;
	}

	.ribbon span:after {
		content: "";
		position:absolute;
		top:3em;
		right:0;
		border-left:0.5em solid #9B8651;
		border-bottom:0.5em solid #F1E1FF;
	}
    .userMenu {
        float: left;
        width: 180px;
    }
    #content{
        float:bottom;
    }
           
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/homeDesign.js"></script>
<link rel="stylesheet" type="text/css" href="css/homeDesign.css">
<title>菜单栏</title>
</head>
<body>

<!-- 菜单栏 -->
<div class='ribbon'>
			<a href='index.jsp'><span>首页</span></a>
			<a href='jobList'><span>招聘职位</span></a>
			<a href='DataSearch.jsp'><span>数据分析</span></a>
			<a href='UserCenter.jsp'><span>我的</span></a>
</div>


</body>
</html>