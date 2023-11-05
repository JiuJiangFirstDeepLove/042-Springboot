<%@ page language="java" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="com.spring.util.*" %>
 <%@page import="com.jntoo.db.*" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="head.jsp" %>
 <%@ include file="header.jsp" %>


<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="title-modelbox-widget" style="margin: 10px 0px 10px 0px; box-shadow: 0px 0px 2px 2px #EEEEEE">
            <h3 class="section-title">投票详情</h3>
            <div class="sidebar-widget-body">
                <div class="row4 hjlgf">
                    <div class="row clearfix">
                        <div class="row1">
                            <div class="product-preview">
                                <div class="big-image">
                                    <div class="img-box pb140">
                                        <div id="imageBig" class="img"></div>
                                    </div>
                                </div>
                                <ul class="thumbs unstyled clearfix" id="imagesJS"></ul>
                            </div>
                        </div>
                        <div class="row2">
                            <section class="product-details add-cart">
                                <header class="entry-header">
                                    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
                                    <h1 class="entry-title uppercase">${map.mingcheng}</h1>
                                </header>
                                <article class="entry-content">
                                    <figure>
                                        <span class="entry-price inline-middle">票数：${map.piaoshu}</span>
                                        <ul class="entry-meta unstyled">
                                            <li>
                                                <span class="key">编号:</span>
                                                <span class="value">${map.bianhao}</span>
                                            </li>
                                        </ul>
                                        <ul class="entry-meta unstyled">
                                            <li>
                                                <span class="key">分类:</span>
                                                <span class="value"
                                                    ><ssm:sql var="mapfenlei6" type="find"> SELECT fenlei,id FROM fenlei where id='${map.fenlei}' </ssm:sql
                                                    >${mapfenlei6.fenlei}</span
                                                >
                                            </li>
                                        </ul>
                                        <ul class="entry-meta unstyled">
                                            <li>
                                                <span class="key">发布人:</span>
                                                <span class="value">${map.faburen}</span>
                                            </li>
                                        </ul>
                                        <ul class="entry-meta unstyled">
                                            <li>
                                                <span class="key">添加时间:</span>
                                                <span class="value">${map.addtime}</span>
                                            </li>
                                        </ul>
                                        <div class="rate-bar inline-middle">
                                            <div
                                                class="rateit"
                                                data-rateit-backingfld="#backing0"
                                                data-rateit-starwidth="12"
                                                data-rateit-starheight="12"
                                                data-rateit-resetable="false"
                                                data-rateit-ispreset="true"
                                                data-rateit-min="0"
                                                data-rateit-max="5"
                                            ></div>
                                        </div>
                                        <a href="toupiaoadd.do?id=${map.id}"  class="btn btn-default">投票</a>
                                    </figure>
                                </article>
                            </section>
                        </div>
                    </div>
                    <div class="row3">
                        <div>
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="javascript:;" data-toggle="tab">Description</a></li>
                            </ul>
                        </div>

                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="product-description">
                                <p>${map.xiangqing}</p>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    $(function () {
                        var images = "${map.tupian}".split(",");
                        for (var i in images) {
                            var html =
                                "<li>\n" +
                                '                            <div class="img-box pb140" data-image="' +
                                images[i] +
                                '">\n' +
                                '                                <div class="img" style="background-image: url(' +
                                images[i] +
                                ')"></div>\n' +
                                "                            </div>\n" +
                                "                        </li>";

                            $("#imagesJS").append(html);
                        }
                        $("#imagesJS").on("click", ".img-box", function (e) {
                            $("#imageBig").css("background-image", "url(" + $(this).data("image") + ")");
                        });
                        $("#imagesJS li:eq(0)>.img-box").click();
                    });
                </script>
            </div>
            <!-- /.sidebar-widget-body -->
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="title-modelbox-widget" style="margin: 10px 0px 10px 0px; box-shadow: 0px 0px 2px 2px #EEEEEE">
            <h3 class="section-title">投票信息</h3>
            <div class="sidebar-widget-body">
                <div class="list-table">
                    ${toupiaolist32 = Query.make("toupiao").where("bianhao",map.bianhao).limit(20).order("id desc").select();""}

                    <table width="100%" border="1" class="table table-list table-bordered table-hover">
                        <thead>
                            <tr align="center">
                                <th width="60" align="center" bgcolor="CCFFFF">序号</th>
                                <th>名称</th>
                                <th>姓名</th>
                                <th>电话</th>
                                <th>状态</th>
                                <th>投票人</th>
                                <th>添加时间</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="i" value="0" /><c:forEach items="${toupiaolist32}" var="r"
                                ><c:set var="i" value="${i+1}" /><c:set var="r" value="${r}" scope="request" />
                                <tr>
                                    <td width="30" align="center">${i}</td>
                                    <td>${r.mingcheng}</td>
                                    <td>${r.xingming}</td>
                                    <td>${r.dianhua}</td>
                                    <td>${r.zhuangtai}</td>
                                    <td>${r.toupiaoren}</td>
                                    <td>${Info.subStr(r.addtime , 19 , "")}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- /.sidebar-widget-body -->
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<%@ include file="footer.jsp" %>
 <%@ include file="foot.jsp" %>

