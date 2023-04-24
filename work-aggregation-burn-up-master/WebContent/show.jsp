<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title></title>
<script src="https://cdn.bootcdn.net/ajax/libs/echarts/5.1.2/echarts.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/jqrery/3.5.1/jquery.js"></script>
<title>Insert title here</title>
</head>
    <body>
        <div id="main" style="width: 590px; height: 450px; background: white;"></div>
        <script type="text/javascript">
            var main=echarts.init(document.getElementById("main"))
  		    var xdata=[{"name": "自然语言处理（NLP）高端算法", "value": 165.0}, {"name": "首席技术官CTO（激光雷达 )", "value": 125.0}, {"name": "首席技术官CTO", "value": 110.3125}, {"name": "测试开发leader", "value": 110.0}, {"name": "CTO首席技术官", "value": 110.0}, {"name": "燃料电池技术总监 （薪资open，可谈）", "value": 105.0}, {"name": "（#225906技术总监）", "value": 105.0}, {"name": "数据挖掘/机器学习算法专家", "value": 95.0}, {"name": "首席技术官/CTO", "value": 90.0}, {"name": "推荐系统负责人(J10656)", "value": 85.0}]
            //fso = new ActiveXObject("Scripting.FileSystemObject");
            //ts = fso.OpenTextFile("D:\\VSCode\\projects\\WorkAggregation\\price.txt", ForReading);
            //xdata = ts.ReadLine();
            //console.log(xdata);
            //配置echarts
            var option = {
                backgroundColor: '#2c343c',
                title: {
                    text: 'Customized Pie',
                    left: 'center',
                    top: 20,
                    textStyle: {
                    color: '#ccc'
                    }
                },
                tooltip: {
                    trigger: 'item'
                },
                visualMap: {
                    show: false,
                    min: 80,
                    max: 300,
                    inRange: {
                    colorLightness: [0, 1]
                    }
                },
                series: [
                    {
                    name: 'Access From',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '50%'],
                    data:xdata.sort(function (a, b) {
                        return a.value - b.value;
                    }),
                    roseType: 'radius',
                    label: {
                        color: 'rgba(255, 255, 255, 0.3)'
                    },
                    labelLine: {
                        lineStyle: {
                        color: 'rgba(255, 255, 255, 0.3)'
                        },
                        smooth: 0.2,
                        length: 10,
                        length2: 20
                    },
                    itemStyle: {
                        color: '#c23531',
                        shadowBlur: 200,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    },
                    animationType: 'scale',
                    animationEasing: 'elasticOut',
                    animationDelay: function (idx) {
                        return Math.random() * 200;
                    }
                    }
                ]
                };

                main.setOption(option)


        </script>
    </body>
</html>