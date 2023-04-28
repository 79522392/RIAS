<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>招聘信息数据分析</title>
    <style>

        /* 样式表 */
        .v-align {
            margin: 0 auto;
            width: 100%;
            height: 80px;
            text-align: center;
            line-height: 80px;
            border: 1px solid #ddd;
            font-size: 25px;
        }
        .name {
            font-weight: bold;
            height: 50%;
            font-size: 25px;
            text-decoration: none;
        }

        .jobother {
            font-weight: bold;
            height: 50%;
            font-size: 20px;
        }

        .jobsalary {
            font-weight: bold;
            height: 50%;
            color: #ff6000;
            font-size: 20px;
        }

        .card {
            margin-bottom: 20px;
            cursor: pointer;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            /*background: #525581;*/
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

    </style>
</head>
<script src="js/echarts.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
      integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-7ymO4nGrkm372HoSbq1OY2DP4pEZnMiA+E0F3zPr+JQQtQ82gQ1HPY3QIVtztVua"
        crossorigin="anonymous"></script>

<body>
<header>
    <h1>求职详情</h1>
</header>
<div id="box">
    地区：<input type="area" id="input_1">工作：<input type="name" id="input_2">公司：<input type="comName" id="input_3">
    <button id="check" class="btn btn-primary">搜索</button>
    <%--                    <span class="flex-item" v-for="job in jobs" :key="job.id" class="card" style="width: 18rem;">--%>
    <%--                        <div class="card-body">--%>
    <%--                            <h5 class="card-title">{{job.jobName}}</h5>--%>
    <%--                            <p class="card-text">{{job.salary}}</p>--%>
    <%--                            <a :href=job.companyHref target="_blank" class="btn btn-primary">{{job.companyName}}</a>--%>
    <%--                        </div>--%>
    <%--                    </span>--%>
    <div class="v-align">招聘信息</div>
    <div class="card" v-for="job in jobs" :key="job.id">
        <div class="card-body">
            <div class="row">
                <div class="col-9">
                    <div class="name"><a :href=job.jobHref target="_blank">{{ job.jobName }}</a></div>
                </div>
                <div class="col-2">
                    <div class="name"><a :href=job.companyHref target="_blank">{{ job.companyName}}</a></div>
                </div>
                <%--                <div class="col-2">--%>
                <%--                            <div>--%>
                <%--                                <p>{{job.salary}}</p>--%>
                <%--                            </div>--%>
                <%--                            <!-- <button type="button" class="btn btn-danger btn-sm">--%>
                <%--                              删除--%>
                <%--                            </button> -->--%>
                <%--                </div>--%>

                <%--                <div class="col-2">--%>
                <%--                    <div>--%>
                <%--                        <a :href=job.jobHref target="_blank" class="btn btn-primary">工作详情</a>--%>
                <%--                        <a :href=job.companyHref target="_blank" class="btn btn-primary">公司详情</a>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
            </div>
            <div class="row">
                <div class="col-2">
                    <div>
                        <p class="jobsalary">{{job.salary}}</p>
                    </div>
                </div>
                <div class="col-7">
                    <div class="jobother">{{job.jobArea}}||{{job.degree}}||{{job.workYear}}</div>
                </div>
                <div class="col-2">
                    <div>
                        <p class="jobsalary">{{job.companySize}}</p>
                    </div>
                </div>
                <%--                <div class="col-2">--%>
                <%--                    <div>--%>
                <%--                        <a :href=job.jobHref target="_blank" class="btn btn-primary">工作详情</a>--%>
                <%--                        <a :href=job.companyHref target="_blank" class="btn btn-primary">公司详情</a>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
            </div>
        </div>
    </div>

</div>
</body>
<script type="text/javascript">
    var box = new Vue({
        el: "#box",
        data: {
            jobs: [{}]
        },
        mounted() {
            $.ajax({
                url: 'http://103.228.170.64:7777/job/all',
                type: 'get',
                data: {},
                success(resp) {
                    box.jobs = resp
                    // console.log(box.jobs.length)
                }
            })
            var btn = document.getElementById("check");
            btn.onclick = function () {
                $.ajax({
                    url: 'http://103.228.170.64:7777/job/some',
                    type: 'get',
                    data: {
                        "area": $('#input_1').val(),
                        "name": $('#input_2').val(),
                        "comName": $('#input_3').val()
                    },
                    success(resp) {
                        box.jobs = resp
                    }
                })
            }

        },
        method: {},

    })
</script>
</html>