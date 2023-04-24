<%@ page language="java"  import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<html lang="en">

    <head>
        <title>我的</title>
        <script type="text/javascript" src="js/dataDesign.js"></script>
	<link rel="stylesheet" type="text/css" href="css/userDesign.css">
         <style>
         * { 
		/* Basic CSS reset */
		margin:0; 
		padding:0;
	}
	body {
		/* These styles have nothing to do with the ribbon */
		background:url(images/dark_wood.png) 0 0 repeat;
		padding:35px 0 0;
		margin:auto;
		text-align:center;
	}
	.ribbon {
		display:inline-block;
		position:absolute;
        top:0;
        margin-left:-10px;
	}
	.ribbon:after, .ribbon:before {
		margin-top:0.5em;
		content: "";
		float:left;
		border:1.5em solid #CA8EFF ;
	}

	.ribbon:after {
		border-right-color:transparent;
	}
	.ribbon:before {
		border-left-color:transparent;
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
        <meta charset="utf-8">
        <script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>

    </head>

    <body>
    <%
    Object userID  =  session.getAttribute("userID");
    //out.print(userID);
    %>

<div class='ribbon'>
			<a href='index.jsp'><span>首页</span></a>
			<a href='jobList'><span>招聘职位</span></a>
			<a href='DataSearch.jsp'><span>数据分析</span></a>
			<a href='UserCenter.jsp'><span>我的</span></a>
</div>
	
	
    <div id="sideBox" class="userWrap">
		<!--  <h3 class="sideHead">分类</h3>-->
		<h3 class="sideHead"><img src="images/1.jpg" style="width: 80px;height: 80px;  
border-radius: 45px;
-webkit-border-radius: 45px;
-moz-border-radius: 45px;"/></h3>
		<div class="sideLi">
		<ul class="userMenu">
		
                <li class="sideLih" data-id="user">个人主页</li>
                <li class="sideLih" data-id="favorites">我的收藏</li>
                <li class="sideLih" data-id="settings">个人设置</li>
			</ul>
			
		</div>
		
	</div>
    <div id="content"></div>
    
        
    </body>
    <script>
        $(function() {
            $(".userMenu").on("click", "li", function() {
                var sId = $(this).data("id"); //获取data-id的值
                window.location.hash = sId; //设置锚点
                loadInner(sId);
            });

            function loadInner(sId) {
                var sId = window.location.hash;
                var pathn, i;
                switch(sId) {
                    case "#user":
                        pathn = "MyUser.jsp";
                        i = 0;
                        break;
                    case "#favorites":
                        pathn = "favorites.jsp";
                        i = 1;
                        break;
                    case "#settings":
                        pathn = "settings.jsp";
                        i = 2;
                        break;
                    default:
                        pathn = "test.jsp";
                        i = 3;
                        break;
                }
                $("#content").load(pathn); //加载相对应的内容
                $(".userMenu li").eq(i).addClass("current").siblings().removeClass("current"); //当前列表高亮
            }
            var sId = window.location.hash;
            loadInner(sId);
        });
    </script>

</html>