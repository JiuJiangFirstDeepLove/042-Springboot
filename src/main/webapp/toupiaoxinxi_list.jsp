<%@ page language="java" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="com.spring.util.*" %>
 <%@page import="com.jntoo.db.*" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 投票信息 </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" id="formSearch" action="?">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <i class="glyphicon glyphicon-search"></i>
                    </div>

                    <div class="form-group">
                        编号

                        <input type="text" class="form-control" style="" name="bianhao" value="${param.bianhao}" />
                    </div>
                    <div class="form-group">
                        名称

                        <input type="text" class="form-control" style="" name="mingcheng" value="${param.mingcheng}" />
                    </div>
                    <div class="form-group">
                        分类

                        <select class="form-control class_fenlei10" data-value="${param.fenlei}" id="fenlei" name="fenlei">
                            <option value="">请选择</option>
                            <ssm:sql var="select" type="select"> SELECT * FROM fenlei ORDER BY id desc </ssm:sql>
                            <c:forEach items="${select}" var="m"
                                ><c:set var="m" value="${m}" scope="request" />
                                <option value="${m.id}">${m.fenlei}</option>
                            </c:forEach>
                        </select>
                        <script>
                            $(".class_fenlei10").val($(".class_fenlei10").attr("data-value"));
                        </script>
                    </div>
                    <select class="form-control" name="order" id="orderby">
                        <option value="id">按发布时间</option>
                        <option value="piaoshu">按票数</option>
                    </select>
                    <select class="form-control" name="sort" id="sort">
                        <option value="desc">倒序</option>
                        <option value="asc">升序</option>
                    </select>
                    <script>
                        $("#orderby").val("${orderby}");
                        $("#sort").val("${sort}");
                    </script>
                    <button type="submit" class="btn btn-default">搜索</button>

                    <!--form标签结束-->
                </form>
            </div>

            <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                        <tr align="center">
                            <th width="60" data-field="item">序号</th>
                            <th>编号</th>
                            <th>名称</th>
                            <th>分类</th>
                            <th>票数</th>
                            <th>图片</th>
                            <th>发布人</th>
                            <th>添加时间</th>
                            <th width="220" data-field="handler">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="i" value="0" /><c:forEach items="${list}" var="map"
                            ><c:set var="i" value="${i+1}" /><c:set var="map" value="${map}" scope="request" />
                            <tr id="${map.id}" pid="">
                                <td width="30" align="center">
                                    <label> ${i} </label>
                                </td>
                                <td>${map.bianhao}</td>
                                <td>${map.mingcheng}</td>
                                <td><ssm:sql var="mapfenlei2" type="find"> SELECT fenlei,id FROM fenlei where id='${map.fenlei}' </ssm:sql>${mapfenlei2.fenlei}</td>
                                <td>${map.piaoshu}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${'' == map.tupian }"> -</c:when><c:otherwise><img width="100" src="${map.tupian}" /></c:otherwise
                                    ></c:choose>
                                </td>
                                <td>${map.faburen}</td>
                                <td>${Info.subStr(map.addtime , 19 , "")}</td>
                                <td align="center">
                                    <a href="toupiaoxinxi_detail.do?id=${map.id}">详情</a>

                                    <a href="toupiaoxinxi_updt.do?id=${map.id}">编辑</a>

                                    <a href="toupiaoxinxi_delete.do?id=${map.id}" onclick="return confirm('确定要删除？')">删除</a>
                                    <!--qiatnalijne-->
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <%@include file="/page.jsp" %>

        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>

