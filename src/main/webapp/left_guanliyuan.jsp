<%@ page language="java" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="com.spring.util.*" %>
 <%@page import="com.jntoo.db.*" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<li>
    <a href="javascript:;" class="nav-top-item">
        <i class="icon ti-home"></i>
        <span>管理员账号管理</span>
    </a>
    <ul>
        <li>
            <a target="main" href="admins_add.do"> 管理员账号添加 </a>
        </li>
        <li>
            <a target="main" href="admins_list.do"> 管理员账号管理 </a>
        </li>
        <li>
            <a target="main" href="mod.do"> 密码修改 </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;" class="nav-top-item">
        <i class="icon ti-home"></i>
        <span>问卷管理</span>
    </a>
    <ul>
        <li>
            <a target="main" href="wenjuan_add.do"> 问卷添加 </a>
        </li>
        <li>
            <a target="main" href="wenjuan_list.do"> 问卷查询 </a>
        </li>
        <li>
            <a target="main" href="timu_list.do"> 题目查询 </a>
        </li>
        <li>
            <a target="main" href="dati_list.do"> 答题查询 </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;" class="nav-top-item">
        <i class="icon ti-home"></i>
        <span>公告管理</span>
    </a>
    <ul>
        <li>
            <a target="main" href="gonggao_add.do"> 公告添加 </a>
        </li>
        <li>
            <a target="main" href="gonggao_list.do"> 公告查询 </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;" class="nav-top-item">
        <i class="icon ti-home"></i>
        <span>投票信息管理</span>
    </a>
    <ul>
        <li>
            <a target="main" href="toupiaoxinxi_add.do"> 投票信息添加 </a>
        </li>
        <li>
            <a target="main" href="toupiaoxinxi_list.do"> 投票信息查询 </a>
        </li>
        <li>
            <a target="main" href="toupiao_list.do"> 投票查询 </a>
        </li>
        <li>
            <a target="main" href="shenhe_list.do"> 审核查询 </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;" class="nav-top-item">
        <i class="icon ti-home"></i>
        <span>统计管理</span>
    </a>
    <ul>
        <li>
            <a target="main" href="tongji1.jsp"> 问卷统计 </a>
        </li>
        <li>
            <a target="main" href="tongji2.jsp"> 投票统计 </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;" class="nav-top-item">
        <i class="icon ti-home"></i>
        <span>系统管理</span>
    </a>
    <ul>
        <li>
            <a target="main" href="lunbotu_add.do"> 轮播图添加 </a>
        </li>
        <li>
            <a target="main" href="lunbotu_list.do"> 轮播图查询 </a>
        </li>
    </ul>
</li>
