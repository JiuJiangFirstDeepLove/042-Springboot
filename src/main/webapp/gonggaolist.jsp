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
            <h3 class="section-title">公告信息</h3>
            <div class="sidebar-widget-body">
                <div class="">
                    <div style="margin-bottom: 20px">
                        <form action="?" class="search">
                            <table class="jd-search">
                                <tbody>
                                    <tr>
                                        <td class="label1">标题</td>
                                        <td class="form-inline">
                                            <input type="text" class="form-control" style="width: 150px" name="biaoti" value="${param.biaoti}" placeholder="请输入关键词" />
                                            <button type="submit" class="btn btn-default">搜索</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="news-list">
                        <ul>
                            <c:forEach items="${list}" var="r"
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

