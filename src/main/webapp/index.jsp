<%@ page language="java" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="com.spring.util.*" %>
 <%@page import="com.jntoo.db.*" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="head.jsp" %>
 <%@ include file="header.jsp" %>


<link rel="stylesheet" href="js/swiper/swiper.css" />
<script src="js/swiper/swiper.js"></script>
<link href="js/owl/owl.carousel.min.css" rel="stylesheet" />
<script src="js/owl/owl.carousel.min.js"></script>

<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        ${bhtList = Query.make("lunbotu").order("id desc").limit(5).select();""}

        <div class="swiper-container" id="base/banner35">
            <div class="swiper-wrapper">
                <c:forEach items="${bhtList}" var="bht"
                    ><c:set var="bht" value="${bht}" scope="request" />
                    <div class="swiper-slide">
                        <div class="decoimg_b2">
                            <a class="btn btn-" href="${bht.url}" style="background-image: url('${bht.image}'); height: 360px"></a>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!-- 如果需要分页器 -->
            <div class="swiper-pagination"></div>
            <!-- 如果需要导航按钮 -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>

        <script>
            var mySwiper = new Swiper("#base/banner35", {
                loop: true, // 循环模式选项
                autoplay: {
                    delay: 3000,
                    disableOnInteraction: false,
                },
                // 如果需要分页器
                pagination: {
                    el: ".swiper-pagination",
                },
                // 如果需要前进后退按钮
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
                // 如果需要滚动条
                /*scrollbar: {
            el: '.swiper-scrollbar',
        },*/
            });
        </script>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="title-modelbox-widget" style="margin: 10px 0px 10px 0px; box-shadow: 0px 0px 2px 2px #EEEEEE">
            <h3 class="section-title">投票列表</h3>
            <div class="sidebar-widget-body">
                <div class="shop-product-xz">
                    ${toupiaoxinxilist40 = Query.make("toupiaoxinxi").limit(8).order("id desc").select();""}
                    <div class="row clearfix owl-carousel" data-items="4" data-autoplay="true" data-autoplay-time="8000">
                        <c:forEach items="${toupiaoxinxilist40}" var="r"
                            ><c:set var="r" value="${r}" scope="request" />
                            <div class="col-xs-12 col-md-3 products-col">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                            <a class="primary_img img-box pb100 img-scale" href="toupiaoxinxidetail.do?id=${r.id}">
                                                <div class="img" style="background-image: url('${r.tupian}')">
                                                    <img src="${r.tupian}" alt="" />
                                                </div>
                                            </a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                <a href="toupiaoxinxidetail.do?id=${r.id}"> ${r.mingcheng} </a>
                                            </h4>
                                            <div class="price_box">
                                                <span class="current_price">票数：${r.piaoshu}</span>
                                            </div>
                                            <div class="add_to_cart">
                                                <a href="toupiaoxinxidetail.do?id=${r.id}" title="查看详情">查看详情</a>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </article>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- /.sidebar-widget-body -->
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">
            <div class="col-md-6">
                <div class="title-modelbox-widget" style="margin: 10px 0px 10px 0px; box-shadow: 0px 0px 2px 2px #EEEEEE">
                    <h3 class="section-title">问卷信息</h3>
                    <div class="sidebar-widget-body">
                        <div class="">
                            ${wenjuanlist45 = Query.make("wenjuan").limit(4).order("id desc").select();""}
                            <div class="news-list">
                                <ul>
                                    <c:forEach items="${wenjuanlist45}" var="r"
                                        ><c:set var="r" value="${r}" scope="request" />
                                        <li class="clearfix">
                                            <a href="wenjuandetail.do?id=${r.id}">
                                                <div class="thumb">
                                                    <div class="img-box pb100">
                                                        <div class="img" style="background-image: url('${r.tupian}')"></div>
                                                    </div>
                                                </div>
                                            </a>

                                            <div class="news-content-text">
                                                <a href="wenjuandetail.do?id=${r.id}">
                                                    <h3>${r.wenjuanzhuti}</h3>
                                                </a>
                                                <div class="description">${Info.subStr(r.shuoming, 80)}</div>
                                                <div class="other-content">
                                                    <span>发布人：${r.faburen}</span>
                                                    <span>添加时间：${Info.subStr(r.addtime , 19 , "")}</span>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /.sidebar-widget-body -->
                </div>
            </div>
            <div class="col-md-6">
                <div class="title-modelbox-widget" style="margin: 10px 0px 10px 0px; box-shadow: 0px 0px 2px 2px #EEEEEE">
                    <h3 class="section-title">公告信息</h3>
                    <div class="sidebar-widget-body">
                        <div class="">
                            ${gonggaolist48 = Query.make("gonggao").limit(4).order("id desc").select();""}
                            <div class="news-list">
                                <ul>
                                    <c:forEach items="${gonggaolist48}" var="r"
                                        ><c:set var="r" value="${r}" scope="request" />
                                        <li class="clearfix">
                                            <a href="gonggaodetail.do?id=${r.id}">
                                                <div class="thumb">
                                                    <div class="img-box pb100">
                                                        <div class="img" style="background-image: url('${r.tupian}')"></div>
                                                    </div>
                                                </div>
                                            </a>

                                            <div class="news-content-text">
                                                <a href="gonggaodetail.do?id=${r.id}">
                                                    <h3>${r.biaoti}</h3>
                                                </a>
                                                <div class="description">${Info.subStr(r.xiangqing, 80)}</div>
                                                <div class="other-content">
                                                    <span>发布人：${r.faburen}</span>
                                                    <span>添加时间：${Info.subStr(r.addtime , 19 , "")}</span>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /.sidebar-widget-body -->
                </div>
            </div>
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<%@ include file="footer.jsp" %>
 <%@ include file="foot.jsp" %>

