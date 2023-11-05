<%@ page language="java" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="com.spring.util.*" %>
 <%@page import="com.jntoo.db.*" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<li>
    <a href="javascript:;" class="nav-top-item">
        <i class="icon ti-home"></i>
        <span>投票管理</span>
    </a>
    <ul>
        <li>
            <a target="main" href="toupiao_list_toupiaoren.do"> 投票查询 </a>
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
            <a target="main" href="dati_list_tijiaoren.do"> 答题查询 </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;" class="nav-top-item">
        <i class="icon ti-home"></i>
        <span>个人中心</span>
    </a>
    <ul>
        <li>
            <a target="main" href="yonghu_updtself.do"> 修改个人资料 </a>
        </li>
        <li>
            <a target="main" href="mod.do"> 修改密码 </a>
        </li>
    </ul>
</li>
