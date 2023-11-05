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
                <div>
                    <div class="common-title" style="margin-top: 4em">
                        <p>
                            <i></i>
                            <i></i>
                        </p>
                    </div>
                    <div class="news_show">
                        <span class="show_t"> ${map.biaoti} </span>
                        <span class="fa_time"> 编号:${map.bianhao}    发布人:${map.faburen}    添加时间:${map.addtime}    </span>

                        <div>${map.xiangqing}</div>
                        <div class="s_x clearfix">
                            <ssm:sql var="prev" type="find"> SELECT * FROM gonggao WHERE id<'${map.id}' ORDER BY id desc </ssm:sql>
                            <c:choose>
                                <c:when test="${prev.id != null}">
                                    <a href="gonggaodetail.do?id=${prev.id}" class="s_prev">上一篇：${prev.biaoti}</a> </c:when
                                ><c:otherwise>
                                    <a href="javascript:;" class="s_prev">上一篇：没有了</a>
                                </c:otherwise></c:choose
                            >
                            <ssm:sql var="next" type="find"> SELECT * FROM gonggao WHERE id>'${map.id}' ORDER BY id asc </ssm:sql>
                            <c:choose>
                                <c:when test="${next.id != null}">
                                    <a href="gonggaodetail.do?id=${next.id}">下一篇：${next.biaoti}</a> </c:when
                                ><c:otherwise>
                                    <a href="javascript:;">下一篇：没有了</a>
                                </c:otherwise></c:choose
                            >
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.sidebar-widget-body -->
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<%@ include file="footer.jsp" %>
 <%@ include file="foot.jsp" %>

