<%@ page language="java"  import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>数据分析</title>
        <script type="text/javascript" src="js/dataDesign.js"></script>
	<link rel="stylesheet" type="text/css" href="css/dataDesign.css">
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
		text-algin:center;
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
    <jsp:include page="menu.jsp"></jsp:include>
	
	
    <div id="sideBox" class="userWrap">
		<h3 class="sideHead">分类</h3>
		<div class="sideLi">
		<ul class="userMenu">
		
                <li class="sideLih" data-id="position">岗位</li>
                <li class="sideLih" data-id="salary">薪水</li>
                <li class="sideLih" data-id="place">地区</li>
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
                    case "#position":
                        pathn = "position.html";
                        i = 0;
                        break;
                    case "#salary":
                        pathn = "salary.html";
                        i = 1;
                        break;
                    case "#place":
                        pathn = "place.html";
                        i = 2;
                        break;
                    　　　　　
                    default:
                        pathn = "user_center.html";
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