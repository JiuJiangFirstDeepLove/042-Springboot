<%@ page language="java" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="com.spring.util.*" %>
 <%@page import="com.jntoo.db.*" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="head.jsp" %>

<script src="js/jquery.validate.js"></script>

<div style="padding: 10px" class="admin-content">
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑题目:</div>
            <div class="panel-body">
                <form action="timuupdate.do" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <input type="hidden" name="wenjuanid" value="${mmm.wenjuanid}" />
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">问卷主题</label>
                            <div class="col-sm-10">${mmm.wenjuanzhuti}<input type="hidden" id="wenjuanzhuti" name="wenjuanzhuti" value="${Info.html(mmm.wenjuanzhuti)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">发布人</label>
                            <div class="col-sm-10">${mmm.faburen}<input type="hidden" id="faburen" name="faburen" value="${Info.html(mmm.faburen)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">题目<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <textarea
                                    style="width: 80%; height: 120px"
                                    class="form-control"
                                    placeholder="输入题目"
                                    data-rule-required="true"
                                    data-msg-required="请填写题目"
                                    id="timu"
                                    name="timu"
                                >
${Info.html(mmm.timu)}</textarea
                                >
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">类型</label>
                            <div class="col-sm-10">
                                <select class="form-control class_leixing9" data-value="${Info.html(mmm.leixing)}" id="leixing" name="leixing" style="width: 250px">
                                    <option value="单选题">单选题</option>
                                    <option value="多选题">多选题</option>
                                </select>
                                <script>
                                    $(".class_leixing9").val($(".class_leixing9").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">答案</label>
                            <div class="col-sm-10">
                                <div id="TypeFieldabc">
                                    <div style="border: 1px solid #ededed; border-radius: 5px; padding: 10px; background: #F2F2F2">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th width="80"> </th>
                                                    <th>答案</th>
                                                    <!--<th width="80">跳转序号</th>-->
                                                    <th width="60">得分</th>
                                                </tr>
                                            </thead>
                                            <tbody id="field_box"></tbody>
                                        </table>
                                    </div>
                                    <button type="button" class="btn btn-default btn-sm" id="add_btn">增加答案</button>
                                </div>
                                <input type="hidden" id="daan" name="daan" />
                                <script>
                                    function selectType(obj)
                                    {
                                        var v = $(obj).val();
                                        if(v=='单选题' || v=='多选题'){
                                            $('#TypeFieldabc').show();
                                        }else{
                                            $('#TypeFieldabc').hide();
                                        }
                                    }

                                    function updateZimu()
                                    {
                                        var zimu = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
                                        var index = $("#field_box").find("tr").each(function(index){
                                            $(this).find('td:eq(0)').find('input').val(zimu.substr(index,1));
                                        });
                                    }

                                    function addFieldItem(wx){
                                        wx=wx||{};
                                        var str = [];
                                        str.push('<tr><td align="center" valign="middle">');
                                        str.push('<input type="text" readonly="readonly" style="width: 40px;" data-id="zimu" class="form-control" value="" />');
                                        str.push('</td><td>');
                                        str.push('<input type="text" style="width:100%" onblur="updateData()" data-id="title" class="form-control" value="'+(wx.title||'')+'" />');
                                        str.push('</td><td>');

                                        str.push('<input type="number" step="1" style="width: 60px;" onblur="updateData()" data-id="point" class="form-control" value="'+(wx.point||'0')+'" />');
                                        str.push('</td><td>');

                                        str.push('<button onclick="delItem(this);" type="button" class="btn btn-default">删除</button>');
                                        str.push('</td></tr>');
                                        var html = str.join('');
                                        $('#field_box').append(html);
                                        updateZimu();
                                    }

                                    function delItem(obj){
                                        if(confirm('此操作将不可恢复，您确定删除？')){
                                            $(obj).parent().parent().remove();
                                        }
                                        updateZimu();
                                    }
                                    $(function(){
                                        var __fields = ${mmm.daan};
                                        if(__fields.length>0){
                                            $.each(__fields , function(){
                                                addFieldItem(this);
                                            });
                                        }else{
                                            addFieldItem();
                                        }
                                    });

                                    function updateData()
                                    {
                                        var result = [];
                                        $('#field_box').find('tr').each(function () {
                                            var obj = {};
                                            $(this).find('[data-id]').each(function () {
                                                if($(this).attr('type') == 'checkbox') {
                                                    obj[$(this).attr('data-id')] = $(this).attr('checked')
                                                }else{
                                                    obj[$(this).attr('data-id')] = $.trim($(this).val());
                                                }
                                            });
                                            if(obj.title != '' && obj.point != ''){
                                                result.push(obj);
                                            }
                                        });
                                        $('#daan').val(JSON.stringify(result));
                                    }

                                    $('#TypeFieldabc').on('input,checkbox' , 'blur,change' , function (e) {
                                        console.log(e);
                                    })

                                    $('#add_btn').click(addFieldItem);
                                    $('#form1').submit(function () {
                                        updateData();
                                        return true;
                                    })
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <input name="id" value="${mmm.id}" type="hidden" />
                                <input name="referer" value="<%=request.getHeader("referer") %>" type="hidden" />
                                <input name="updtself" value="${updtself}" type="hidden" />

                                <button type="submit" class="btn btn-primary" name="Submit">提交</button>
                                <button type="reset" class="btn btn-default" name="Submit2">重置</button>
                            </div>
                        </div>
                    </div>

                    <!--form标签结束-->
                </form>
            </div>
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>

    <script>
        $(function () {
            $("#form1").validate();
        });
    </script>
</div>
<%@ include file="foot.jsp" %>

