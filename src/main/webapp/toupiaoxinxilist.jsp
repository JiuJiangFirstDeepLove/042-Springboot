<%@ page language="java" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="com.spring.util.*" %>
 <%@page import="com.jntoo.db.*" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="head.jsp" %>
 <%@ include file="header.jsp" %>


<link href="js/owl/owl.carousel.min.css" rel="stylesheet" />
<script src="js/owl/owl.carousel.min.js"></script>

<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="title-modelbox-widget" style="margin: 10px 0px 10px 0px; box-shadow: 0px 0px 2px 2px #EEEEEE">
            <h3 class="section-title">投票列表</h3>
            <div class="sidebar-widget-body">
                <div class="shop-product-xz">
                    <div style="margin-bottom: 20px">
                        <form action="?" class="search">
                            <table class="jd-search">
                                <tbody>
                                    <tr>
                                        <td class="label1">名称</td>
                                        <td class="form-inline">
                                            <input type="text" class="form-control" style="width: 150px" name="mingcheng" value="${param.mingcheng}" placeholder="请输入关键词" />
                                            <button type="submit" class="btn btn-default">搜索</button>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="label1">分类</td>
                                        <td class="form-inline">
                                            <p class="search-radio">
                                                <input type="hidden" name="fenlei" value="${param.fenlei}" />
                                                <a href="javascript:;" data-value="" onclick="selectRadio(this)">全部</a>
                                                <ssm:sql var="mapfenlei4" type="select"> SELECT id,fenlei FROM fenlei </ssm:sql>
                                                <c:forEach items="${mapfenlei4}" var="r"
                                                    ><c:set var="r" value="${r}" scope="request" />
                                                    <a href="javascript:;" data-value="${r.id}" onclick="selectRadio(this)">${r.fenlei}</a>
                                                </c:forEach>
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>

                    <div class="row clearfix">
                        <c:forEach items="${list}" var="r"
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
                    <%@include file="/page.jsp" %>

                </div>
            </div>
            <!-- /.sidebar-widget-body -->
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<%@ include file="footer.jsp" %>
 <%@ include file="foot.jsp" %>

