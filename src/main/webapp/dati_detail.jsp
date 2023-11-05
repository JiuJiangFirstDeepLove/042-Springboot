<%@ page language="java" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="com.spring.util.*" %>
 <%@page import="com.jntoo.db.*" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">答题详情</div>
        <div class="panel-body">
            <div class="admin-detail clearfix">
                <div class="detail detail-readmodule">
                    <div class="detail-title">问卷id：</div>
                    <div class="detail-content">${map.wenjuanid}</div>
                </div>
                <div class="detail detail-longtext">
                    <div class="detail-title">问卷主题：</div>
                    <div class="detail-content">${map.wenjuanzhuti}</div>
                </div>
                <div class="detail detail-textuser">
                    <div class="detail-title">发布人：</div>
                    <div class="detail-content">${map.faburen}</div>
                </div>
                <div class="detail detail-textuser">
                    <div class="detail-title">提交人：</div>
                    <div class="detail-content">${map.tijiaoren}</div>
                </div>
                <div class="detail detail-textarea">
                    <div class="detail-title">题目：</div>
                    <div class="detail-content">${map.timu}</div>
                </div>
                <div class="detail detail-textarea">
                    <div class="detail-title">答案：</div>
                    <div class="detail-content">${map.daan}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">选项：</div>
                    <div class="detail-content">${map.zimu}</div>
                </div>
                <div class="detail detail-autotime">
                    <div class="detail-title">添加时间：</div>
                    <div class="detail-content">${map.addtime}</div>
                </div>
            </div>

            <div class="button-list mt10">
                <div class="">
                    <button type="button" class="btn btn-default" onclick="history.go(-1);">返回</button>
                    <button type="button" class="btn btn-default" onclick="window.print()">打印本页</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>

