<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
		line-height:50px;
		padding:1px 55px;
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


    .userMenu {
        float: left;
        width: 180px;
    }
    #content{
        float:bottom;
    }

.container {
    height: auto;
    width: auto;
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
    left: 850px;
    

}
.btn{
    height: 35px;
    width: 35px;
    position: absolute;
    background: url(images/searchButton.png) repeat 2px 74px;
    top: 3px;
    left: 1100px;
    border: none;
    outline: none;
    cursor: pointer;
}
     

<!-- 广告图 -->
     
#LPAdServer-23300.adv-swiper{
  
  width: 500px;
}
#LPAdServer-23300.adv-swiper .adv-content {

  height: 236px;
  position: relative;
  left:380px;
  top:100px;
  margin-bottom: 15px;
}
#LPAdServer-23300.adv-swiper .adv-content li:first-child {

  display: block;
}
#LPAdServer-23300.adv-swiper .adv-content li {

  height: 300px;
  overflow: hidden;
  position: absolute;
  left: 0;
  top: 0;
  display: none;
}
#LPAdServer-23300.adv-swiper .adv-content li img {
 
  width: 700px;
  height: 300px;
  display: block;
}
#LPAdServer-23300.adv-swiper .swiper-thumb {
  margin-left: -12px;
}
#LPAdServer-23300.adv-swiper .swiper-thumb li {
  position: relative;
  float: left;
  left: 330px;
  top: 170px;
  width: 170px;
  line-height: 50px;
  margin-left: 80px;
  text-align: center;
  cursor: pointer;
  background-color: #CA8EFF;
  opacity: .8;
  

  
}
#LPAdServer-23300.adv-swiper .swiper-thumb li:last-child {
  margin-right: 0;
}
#LPAdServer-23300.adv-swiper .swiper-thumb li.on {
  opacity: 1;
}
#LPAdServer-23300.adv-swiper .swiper-thumb li img {
  width: 156px;
  height: 76px;
  overflow: hidden;
}
#LPAdServer-23300.adv-swiper .swiper-thumb li a {
  color: #fff;
}
#LPAdServer-23300.adv-swiper .swiper-thumb li a:hover {
  text-decoration: none;
}      
</style>

<style>
#LPAdServer-23302.recommend-company{
  float: right;
  width: 700px;
  margin-right: 20px;
  position: relative;
  left: -350px;
  top: 200px;
}
#LPAdServer-23302.recommend-company a {
  width: 181px;
  height: 88px;
  float: left;
  padding-top: 12px;
  margin-right: 10px;
  margin-bottom: 8px;
  border: 2px dashed #e3e3e3;
  text-align: center;
  background: #fff;
}
#LPAdServer-23302.recommend-company a:hover {
  color: inherit;
  text-decoration: none;
}
#LPAdServer-23302.recommend-company p {
  margin-top: 10px;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="js/homeDesign.js"></script>
<link rel="stylesheet" type="text/css" href="css/homeDesign.css">
<link rel="stylesheet" href="https://concat.lietou-static.com/fe-www-pc/v6/css/pages/search-jobs.fbe2ce14.css" />
<title>首页</title>

<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>



</head>
<body style="backgroup-color:#e6d7d7;">
<div class="l">
<div class='ribbon' id="ribbon">
			<a href='index.jsp'><span>首页</span></a>
			<a href='jobList'><span>招聘职位</span></a>
			<a href='DataSearch.jsp'><span>数据分析</span></a>
			<a href='UserCenter.jsp'><span>我的</span></a>
</div>
<!-- 搜索框 -->
<div class="container" id="container">
    <form action="jobList" method="post" class="parent">
        <input type="text" class="search" name="searchKeyWord" placeholder="搜索职位/职位类别关键词"/>
        <input type="submit" value=" " name="" id="" class="btn"/>
    </form>
</div>


<div id="LPAdServer-23300" class="adv-swiper">
<ul data-selector="adv-swiper" class="adv-content">
        <li><img src="images/salary.png"></li>     
        <li><img src="images/city.png"></li>     
        <li><img src="images/type.png"></li>
    </ul>
    <ul data-selector="swiper-thumb" class="swiper-thumb clearfix">
        <li class="on" data-bgcolor="#CA8EFF">平均薪资</li>  
        <li class="" data-bgcolor="#CA8EFF">热门城市</li>  
        <li class="" data-bgcolor="#CA8EFF">热门职位</li>  
        
    </ul>
</div>

<div id="sideBox"  align="left">
		<div class="sideLi">
			<h5 class="sideLih">后端开发</h5>
			<ul class="sideLiUl">
				<li><a href="javascript:void(0);" onClick="SelectText(event)">Java</a></li>		
				<li><a href="javascript:void(0);" onClick="SelectText(event)">Python</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">C</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">C++</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">.Net</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">PHP</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">Golang</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">Erlang</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">Node.JS</a></li>
			</ul>
		</div>
		<div class="sideLi">
			<h5 class="sideLih">前端开发</h5>
			<ul class="sideLiUl">
				<li><a href="javascript:void(0);" onClick="SelectText(event)">Android开发工程师</a></li>		
				<li><a href="javascript:void(0);" onClick="SelectText(event)">移动开发工程师</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">Javascript</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">WEB前端开发</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">小程序开发工程师</a></li>
			</ul>
		</div>
		<div class="sideLi">
			<h5 class="sideLih">产品经理</h5>
			<ul class="sideLiUl">
				<li><a href="javascript:void(0);" onClick="SelectText(event)">产品经理</a></li>		
				<li><a href="javascript:void(0);" onClick="SelectText(event)">产品专员</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">产品助理</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">数据产品经理</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">网页产品经理</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">电商产品经理</a></li>
			</ul>
		</div>
		<div class="sideLi">
			<h5 class="sideLih">测试</h5>
			<ul class="sideLiUl">
				<li><a href="javascript:void(0);" onClick="SelectText(event)">测试工程师</a></li>		
				<li><a href="javascript:void(0);" onClick="SelectText(event)">产品测试</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">功能测试</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">性能测试</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">测试开发</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">硬件测试</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">自动化测试</a></li>
			</ul>
		</div>
		<div class="sideLi">
			<h5 class="sideLih sidebottom">运维</h5>
			<ul class="sideLiUl">
				<li><a href="javascript:void(0);" onClick="SelectText(event)">网络工程师</a></li>		
				<li><a href="javascript:void(0);" onClick="SelectText(event)">系统工程师</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">运维工程师</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">运维开发</a></li>
				<li><a href="javascript:void(0);" onClick="SelectText(event)">DBA</a></li>
			</ul>
		</div>
</div>

</div>



<!-- 推荐 -->

<div id="LPAdServer-23302" class="recommend-company">
  <a href="//ad.liepin.com/adremote/forward2/?adPositionId=23302&adInstanceId=12535&sign=f7609629f7f07e2ec4aee787500d6846&nextUrl=https%3A%2F%2Fwww.liepin.com%2Fcompany%2F1072424%2F" data-promid="" target="_blank"><img class="tinyELogo" src="https://image0.lietou-static.com/small_/550ad2e70cf21f9a348608b302c.png" alt="">
 <p>阿里巴巴集团</p>
</a>
  <a href="//ad.liepin.com/adremote/forward2/?adPositionId=23302&adInstanceId=23987&sign=c9b3b4cb5bb04b81b8b283e3bcbf1ed7&nextUrl=https%3A%2F%2Fwww.liepin.com%2Fcompany%2F947003%2F" data-promid="" target="_blank"><img class="tinyELogo" src="https://image0.lietou-static.com/small_/5bfea0bc74719d2aa34c058b03a.png" alt="">
 <p>畅游天下</p>
</a>
  <a href="//ad.liepin.com/adremote/forward2/?adPositionId=23302&adInstanceId=34577&sign=39cafa11fc8a52a608dd6f6c86142528&nextUrl=https%3A%2F%2Fwww.liepin.com%2Fcompany%2F2051657%2F" data-promid="" target="_blank"><img class="tinyELogo" src="https://image0.lietou-static.com/small_/5bfe9b2d74719df0ac99f87403a.png" alt="">
 <p>苏宁易购</p>
</a>
  <a href="//ad.liepin.com/adremote/forward2/?adPositionId=23302&adInstanceId=45689&sign=0642aded6177395c8a21cc4f213715d8&nextUrl=https%3A%2F%2Fwww.liepin.com%2Fcompany%2F7012417%2F" data-promid="" target="_blank"><img class="tinyELogo" src="https://image0.lietou-static.com/small_/5c9888e1261c454598f4b30c01u.jpg" alt="">
 <p>UCloud</p>
</a>
  <a href="//ad.liepin.com/adremote/forward2/?adPositionId=23302&adInstanceId=46535&sign=42cf589ca4c00b2be92ffa638cb5ee47&nextUrl=https%3A%2F%2Fwww.liepin.com%2Fcompany%2F8379720%2F" data-promid="" target="_blank"><img class="tinyELogo" src="https://image0.lietou-static.com/small_/60ed3a9b5f663c43343b71c202u.png" alt="">
 <p>有赞</p>
</a>
  <a href="//ad.liepin.com/adremote/forward2/?adPositionId=23302&adInstanceId=53125&sign=6ef71606ddf8e2b7a1dc952598d57f5a&nextUrl=https%3A%2F%2Fwww.liepin.com%2Fcompany%2F8836020%2F" data-promid="" target="_blank"><img class="tinyELogo" src="https://image0.lietou-static.com/small_/593e6d0c7032aee81b7a4ab006a.jpg" alt="">
 <p>广州探迹科技有限公司</p>
</a>
</div>


    


<script type="text/javascript">
function SelectText(event)
{
	var obj=event.srcElement;  //event在ie中自带有，可以不用传入，其他少数浏览器需要传入
	var s;
	var selecter=obj.innerHTML;
	//var selecter="Java";
	//selecter=window.getSelection().toString();
    //if(selecter!=null&&selecter.trim()!=""){
    //      alert(selecter);
    //}
    s="职位类别:"+selecter+"!";
    document.getElementById("sideBox").style.visibility="hidden";
    document.getElementById("container").style.visibility="hidden";
    document.getElementById("ribbon").style.visibility="hidden";
    $(".l").load("jobList",{"sel":s});
   
}

(function(){
    // 广告图
    var root = $('#LPAdServer-23300'),
      advMain = $('[data-selector="adv-swiper"]', root),
      advThumb = $('[data-selector="swiper-thumb"]', root),
      advIndex = 0,
      advTimer = null,
      advLen = 4;
    $('li', advThumb).each(function() {
      var bgcolor = (!$(this).attr('data-bgcolor') || $(this).attr('data-bgcolor') === '') ? '#CA8EFF' : $(this).attr('data-bgcolor');
      $(this).css('background-color', bgcolor);
    });

    function advMove() {
      advMain.find('li').stop(true, true).fadeOut();
      advMain.find('li:eq(' + advIndex + ')').fadeIn();
      advThumb.find('li').removeClass('on');
      advThumb.find('li:eq(' + advIndex + ')').addClass('on');
    }

    function autoPlay() {
      clearInterval(advTimer);
      advTimer = setInterval(function() {
        advIndex++;
        advIndex >= advLen && (advIndex = 0);
        advMove();
      }, 3000);
    }
    autoPlay();
    advMain.add(advThumb).bind('mouseenter', function() {
      clearInterval(advTimer);
    }).bind('mouseleave', function() {
      autoPlay();
    });
    advThumb.find('li').bind('mouseenter', function() {
      advIndex = $(this).index();
      advMove();
    });
  })();

</script>
</body>
</html>