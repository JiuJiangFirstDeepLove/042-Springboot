<%@ page language="java" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="com.spring.util.*" %>
 <%@page import="com.jntoo.db.*" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">审核详情</div>
        <div class="panel-body">
            <div class="admin-detail clearfix">
                <div class="detail detail-readmodule">
                    <div class="detail-title">投票id：</div>
                    <div class="detail-content">${map.toupiaoid}</div>
                </div>
                <div class="detail detail-readmodule">
                    <div class="detail-title">投票信息id：</div>
                    <div class="detail-content">${map.toupiaoxinxiid}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">编号：</div>
                    <div class="detail-content">${map.bianhao}</div>
                </div>
                <div class="detail detail-longtext">
                    <div class="detail-title">名称：</div>
                    <div class="detail-content">${map.mingcheng}</div>
                </div>
                <div class="detail detail-textuser">
                    <div class="detail-title">投票人：</div>
                    <div class="detail-content">${map.toupiaoren}</div>
                </div>
                <div class="detail detail-textuser">
                    <div class="detail-title">审核人：</div>
                    <div class="detail-content">${map.shenheren}</div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">审核：</div>
                    <div class="detail-content">${map.shenhe}</div>
                </div>
                <div class="detail detail-textarea">
                    <div class="detail-title">备注：</div>
                    <div class="detail-content">${map.beizhu}</div>
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

