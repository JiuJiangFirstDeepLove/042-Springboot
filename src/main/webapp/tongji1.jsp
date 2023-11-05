<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="head.jsp" %>

<head>
    <title>Title</title>
    <%--<link rel="stylesheet" href="css/style.css"/>--%>
    <script src="js/datepicker/WdatePicker.js"></script>

    <script src="js/highcharts/highcharts.js"></script>
    <script src="js/highcharts/modules/exporting.js"></script>
    <script src="js/highcharts/modules/series-label.js"></script>
    <script src="js/highcharts/modules/oldie.js"></script>

</head>

<style scoped type="text/scss" lang="scss">//统计表样式
.iframe {
    position: absolute;
    width: 100%;
    height: 100vh;
    padding: 20px;
    overflow: hidden;
}

</style>


<style>
    div.container
    {
        width: 100%;
    }
    div.box
    {
        box-sizing:border-box;
        -moz-box-sizing:border-box; /* Firefox */
        width:50%;
        border:1em solid #f0f0f0;
        float:left;
    }
</style>


<div style="padding: 10px">

    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name">
                综合分析
            </span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form action="?" method="get" id="formSearch">
                    开始时间：<input type="text" readonly name="kaishiriqi" value="<%=Request.get("kaishiriqi")%>"
                                onclick="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})">
                    结束时间：<input type="text" readonly name="jieshuriqi" value="<%=Request.get("jieshuriqi")%>"
                                onclick="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})">
                    <button type="submit" class="btn btn-success">提交</button>
                    <button type="button" class="btn btn-success" onclick="window.print()">打印
                    </button>
                </form>
            </div>
            <%
                String where = "1=1";
                if (!Request.get("kaishiriqi").equals("")) {
                    where += " AND addtime>='" + Request.get("kaishiriqi") + " 00:00:00' ";
                }
                if (!Request.get("jieshuriqi").equals("")) {
                    where += " AND addtime<='" + Request.get("jieshuriqi") + " 23:59:59' ";
                }
                List<HashMap> list = Query.make("dati").where(where).field("count(*) count,wenjuanzhuti")

                        .group("wenjuanzhuti")
                        .order("count desc").select();

            %>

            <style>
                th {
                    text-align: center;
                }
            </style>

            <table class="table">
                <thead>
                <tr>

                    <th>问卷主题</th>
                    <th>数量</th>

                </tr>
                </thead>
                <tbody>
                <% for (HashMap map : list) { %>
                <tr align="center">

                    <td>
                        <%= map.get("wenjuanzhuti") %>
                    </td>

                    <td><%= map.get("count") %>
                    </td>

                </tr>
                <%}%>



                </tbody>
            </table>
        </div>

        <div class="container">
            <div id="container" class="box"></div>
            <div id="container1" class="box"></div>
        </div>

        <tr>

            <script>
                Highcharts.chart('container', {
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie'
                    },
                    title: {
                        text: '占比数据'
                    },
                    tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: true,
                                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                style: {
                                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                }
                            }
                        }
                    },
                    series: [{
                        name: 'Brands',
                        colorByPoint: true,
                        data: [


                            <%  for (HashMap map : list) { %>
                            {
                                name: '<%= map.get("wenjuanzhuti") %>',
                                y: <%=map.get("count") %>
                            },


                            <%}%>
                        ]
                    }]
                });
            </script>

            <script>
                var chart = Highcharts.chart('container1', {
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: '总数'
                    },
                    subtitle: {
                        text: '数据来源: 答题记录表'
                    },
                    xAxis: {
                        categories: [

                            ''

                        ],
                        crosshair: true
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: '条'
                        }
                    },
                    tooltip: {
                        // head + 每个 point + footer 拼接成完整的 table
                        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                            '<td style="padding:0"><b>{point.y:.1f} 条</b></td></tr>',
                        footerFormat: '</table>',
                        shared: true,
                        useHTML: true
                    },
                    plotOptions: {
                        column: {
                            borderWidth: 0
                        }
                    },
                    series: [
                        <%  for (HashMap map : list) { %>
                        {
                            name: '<%= map.get("wenjuanzhuti") %>',
                            data: [<%=map.get("count")%>]
                        },
                        <%}%>
                    ]
                });
            </script>
        </tr>

    </div>
</div>