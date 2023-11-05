(function (w,$){


    function paper( target , option ){
        var options = {
            list:[],
            daan:'daan',
            leixing:'leixing',
            danxuanti:'单选题',
            duoxuanti:'多选题',
            isShuxiang:false,
            biaoti:'',
            jiexi:'',
            zhengquedaan:'',
            kaoshishichang:0,
            isPrevTime:false,
            isRequired:false,
            isRight:false,
            submit:null,
            stopTime:'',
            successField:'',
            defen:''
        };


        this.options = $.extend(true,{},options,option);
        if(this.options.list.length == 0){
            return;
        }
        this.target = target;
        this.initKaoshishichang();
        this.initRightXuanfu();
        this.initForm(target);
        this.startTime = Math.floor(new Date().getTime()/1000);
    }

    paper.prototype = {
        options:{},
        target:'',
        $form:null,
        startTime:0,
        $shichang:null,
        initForm:function (target) {
            var form = this.$form = $('<form action="javascript:;"></form>');
            form.append(this.initItems());
            form.append(this.initButton());
            if(this.options.isShuxiang){
                form.addClass('shuxiang');
            }
            $(target).append(form);
            this.initEvent();
        },
        initEvent:function(){
            // 加载事件
            var that = this;
            var options = that.options;
            this.$form.on('submit', function (e){
                // 获取数据
                e.preventDefault();
                e.stopPropagation();
                that.submitForm();
            });
            if(options.jiexi || options.zhengquedaan || options.isRight){
                if(options.isRight){
                    this.$form.find("textarea").on('input' , function () {
                        var val = $(this).val();
                        if(val!= ''){
                            var shitiid = $(this).parents('.zhangjie-list').attr('id');
                            $('#xuhaoList').find('a[shitiid="'+shitiid+'"]').addClass('active');
                        }else{
                            var shitiid = $(this).parents('.zhangjie-list').attr('id');
                            $('#xuhaoList').find('a[shitiid="'+shitiid+'"]').removeClass('active');
                        }
                    });
                }


                this.$form.on('click' , 'input[type="radio"],input[type="checkbox"]' , function (){

                    var name = $(this).attr('name');
                    var type = $(this).attr('type');
                    type = type.toLocaleLowerCase();
                    var isJiexi = false;
                    var isOpenZhengquedaan = false;
                    var isSetRight = false;
                    if(type == 'radio'){
                        if( options.jiexi ){
                            isJiexi = true;
                        }
                        if( options.zhengquedaan ){
                            isOpenZhengquedaan = true;
                        }
                        if(options.jiexi || options.zhengquedaan){
                            $(this).parents('.daan').find('input').prop('disabled',true);
                        }
                        if(options.isRight ){
                            isSetRight = true;
                        }
                    } else {
                        var isZhengquedaan = true;
                        $(this).parents('.daan').find('input').each(function (){
                            if ( isJiexi ) return;
                            if ( this.checked ) {
                                // 已选中
                                if($(this).data('point') <= 0){
                                    isJiexi = true; // 选了个错题
                                }
                            } else {
                                if( $(this).data('point') > 0 ){
                                    isZhengquedaan = false; // 还有正确答案
                                }
                            }
                        });
                        if((isZhengquedaan || isJiexi) && options.zhengquedaan){
                            isOpenZhengquedaan = true;
                            isJiexi = true;
                        }
                        if((options.jiexi || options.zhengquedaan) && (isJiexi || isZhengquedaan))
                        {
                            $(this).parents('.daan').find('input').prop('disabled',true);
                        }
                        if(options.isRight ){
                            isSetRight = true;
                        }
                    }
                    if(isJiexi){
                        $(this).parents('.zhangjie-list').find('.jiexi').slideDown(500);
                    }
                    if(isOpenZhengquedaan){
                        $(this).parents('.zhangjie-list').find('.zhengquedaan').slideDown(500);
                    }
                    if(isSetRight){
                        var shitiid = $(this).parents('.zhangjie-list').attr('id');
                        $('#xuhaoList').find('a[shitiid="'+shitiid+'"]').addClass('active');
                    }

                });
            }
        },
        initKaoshishichang: function(){
            var that = this;
            var options = that.options;
            if(options.kaoshishichang > 0 || options.stopTime){

                var shichang = this.$shichang = $('<div\n' +
                    '             style="position: fixed;right: 10px;top: 10px;padding: 10px;background: #f2f2f2; color: red; text-align: center;"></div>');
                $('body').append(shichang);
                var stopTime;
                if(options.kaoshishichang > 0){
                    var fenshu = options.kaoshishichang;
                    stopTime = (new Date().getTime()) + 60 * fenshu * 1000;
                    stopTime = new Date(Math.floor(stopTime));
                }else{
                    stopTime = new Date(options.stopTime.replace(/\-/ig , '/'));
                }

                function clock() {
                    if (new Date().getTime() > stopTime.getTime()) {
                        that.submitForm(true);
                        return;
                    }
                    var today = new Date(),//当前时间
                        h = today.getHours(),
                        m = today.getMinutes(),
                        s = today.getSeconds();
                    var stopH = stopTime.getHours(),
                        stopM = stopTime.getMinutes(),
                        stopS = stopTime.getSeconds();
                    var shenyu = stopTime.getTime() - today.getTime(),//倒计时毫秒数
                        shengyuD = parseInt(shenyu / (60 * 60 * 24 * 1000)),//转换为天
                        D = parseInt(shenyu) - parseInt(shengyuD * 60 * 60 * 24 * 1000),//除去天的毫秒数
                        shengyuH = parseInt(D / (60 * 60 * 1000)),//除去天的毫秒数转换成小时
                        H = D - shengyuH * 60 * 60 * 1000,//除去天、小时的毫秒数
                        shengyuM = parseInt(H / (60 * 1000)),//除去天的毫秒数转换成分钟
                        M = H - shengyuM * 60 * 1000;//除去天、小时、分的毫秒数
                    var S = parseInt((shenyu - shengyuD * 60 * 60 * 24 * 1000 - shengyuH * 60 * 60 * 1000 - shengyuM * 60 * 1000) / 1000)//除去天、小时、分的毫秒数转化为秒
                    shichang.html('剩余时间：' + (shengyuH + "小时" + shengyuM + "分" + S + "秒" + "<br>"));

                    // setTimeout("clock()",500);
                    setTimeout(clock, 500);
                }
                clock();
            }
        },
        initRightXuanfu: function(){

            if(!this.options.isRight)return;

            var tpl = "<style>\n" +
                "    .xunhao a{\n" +
                "        float: left;\n" +
                "        width: 30px;\n" +
                "        height: 30px;\n" +
                "        line-height: 30px;\n" +
                "        border-radius: 50%;\n" +
                "        border: 1px solid #117cd0;\n" +
                "        text-align: center;\n" +
                "        margin-right: 8px;\n" +
                "        margin-bottom: 8px;\n" +
                "        font-size: 15px;\n" +
                "    }\n" +
                "    .xunhao a.active{\n" +
                "        background: #6bba10;\n" +
                "        color: #eeeeee;\n" +
                "    }\n" +
                "</style>";

            tpl += "<div class=\"\" style=\"position: fixed;height: 200px;padding-top: 8px;padding-left: 8px;margin-top: -100px;right: 0px;top: 50%;bottom: 0px; overflow: auto; /*background: #eeeeee;*/width: 350px;\">\n";
            tpl += "<div class=\"xunhao clearfix\" id='xuhaoList'>";
            var options = this.options;
            $.each(options.list , function(i,o){
                tpl += "<a href=\"#shiti"+o.id+"\" shitiid='shiti"+o.id+"'>";
                tpl += i+1;
                tpl += "</a>";
            });

            tpl += "    </div>\n" +
                "</div>";
            $('body').append(tpl);
        },
        submitForm: function(force){
            var that = this;
            var options = that.options;
            var result = [];
            var zongdiefen = 0;
            var leixingdefen = {};

            for (var j=0;j<options.list.length;j++){
                // 循环获取数据,这些都是试题上的数据
                var o = options.list[j];
                var obj = $.extend(true,{},o);

                var type = o[options.leixing];
                if(options.danxuanti.indexOf(type)!==-1){
                    // 单选提
                    var op = that.$form.find('[name="daan'+j+'"]:checked')
                    if(op.length == 0 && options.isRequired && !force){
                        // 必填项
                        alert('请选择【'+o[options.biaoti]+'】');
                        return;
                    }
                    if(op.length == 0){
                        obj.zimu = '';
                        obj.daan = '';
                        obj.defen = 0;
                    }else{
                        obj.zimu = op.val();
                        obj.daan = op.data('title');

                        if(options.successField){
                            if(obj.zimu == o[options.successField])
                            {
                                if(options.defen){
                                    obj.defen = Math.floor(o[options.defen]);
                                }else{
                                    obj.defen = Math.floor(op.data('point'));
                                }
                            }
                        }else{
                            obj.defen = Math.floor(op.data('point'));
                        }
                    }
                    if (isNaN(obj.defen) || !obj.defen){
                        obj.defen = 0;
                    }
                    zongdiefen+=parseFloat(obj.defen);
                    if( !leixingdefen[type] ){
                        leixingdefen[type] = 0;
                    }
                    leixingdefen[type] += obj.defen;
                }else if(options.duoxuanti.indexOf(type) !== -1){
                    var op = that.$form.find('[name="daan'+j+'"]:checked');
                    if(op.length == 0 && options.isRequired && !force ){
                        // 必填项
                        alert('请选择【'+o[options.biaoti]+'】');
                        return;
                    }

                    var ops = that.$form.find('[name="daan'+j+'"]');
                    var successCount = 0;
                    var zhengquedaanList = {};
                    if(options.successField){
                        var arr = o[options.successField].split(',');
                        for(var cc=0;cc<arr.length;cc++){
                            zhengquedaanList[arr[cc]] = true;
                        }
                        successCount = o[options.successField].split(',').length;
                    }else{
                        ops.each(function (){
                            var point = Math.floor($(this).attr('data-point'));
                            if(point > 0){
                                zhengquedaanList[this.value] = true;
                                successCount++;
                            }
                        });
                    }

                    var defen = 0;
                    var daan = [];
                    var zimu = [];
                    var isCuo = false;
                    var zcs = 0;
                    op.each(function (){
                        daan.push($(this).attr('data-title'));
                        var point = Math.floor($(this).attr('data-point'));
                        defen += point;
                        zimu.push(this.value);
                        if( !zhengquedaanList[this.value] ){
                            isCuo = true;
                        }else{
                            zcs++;
                        }
                    });

                    obj.daan = daan.join(",");
                    if(isCuo){
                        obj.defen = 0;
                    }else{
                        if(options.defen){
                            var f = Math.floor(o[options.defen]);
                            obj.defen = zcs == successCount ? f : f / 2
                        }else{
                            obj.defen = defen;
                        }
                    }
                    console.log(zhengquedaanList , zcs , successCount);
                    obj.zimu = zimu.join(",");
                    obj.success = zcs == successCount ? 1 : 0;

                    zongdiefen+= parseFloat (obj.defen);
                    if( !leixingdefen[type] ){
                        leixingdefen[type] = 0;
                    }
                    leixingdefen[type] += obj.defen;
                }else{
                    obj.daan = that.$form.find('[name="daan' + j + '"]').val();
                    obj.defen = -1;
                    obj.zimu = '';
                }
                result.push(obj);
            }
            if(options.submit){
                var endTime = Math.floor(new Date().getTime()/1000);
                options.submit.call(that , result,zongdiefen,leixingdefen,endTime-this.startTime);
            }
        },
        initButton:function(){
            return '<div style="margin-top: 15px"> <input type="submit" name="Submit" value="提交" class="btn btn-primary"/>\n' +
                '            <input type="reset" name="Submit2" value="重置" class="btn btn-default"/></div>';
        },
        initItems:function(){
            var that = this;
            var options = this.options;
            var result = '<div id="zhangjielianxi">';

            $.each(options.list , function(i,o){
                var type = o[options.leixing];
                result += '<div class="zhangjie-list" id="shiti'+o.id+'" style="margin-bottom: 10px; padding: 10px; background: #fff">' +
                    '<h3>第' + (i+1) + '题：' + o[options.biaoti] + '</h3>' +
                    '<div class="daan">';
                if(options.danxuanti.indexOf(type) !== -1){
                    var daan = eval('('+o[options.daan]+')');
                    $.each(daan,function (index,item){
                        result += that.createRadio(i,item);
                    });
                }else if(options.duoxuanti.indexOf(type) !== -1){
                    var daan = eval('('+o[options.daan]+')');
                    $.each(daan,function (index,item){
                        result += that.createCheckbox(i,item);
                    });
                }else{
                    result += that.createTextarea(i);
                }
                result+="</div>";
                if(options.zhengquedaan && o[options.zhengquedaan]){
                    result += '<div class="zhengquedaan tiku-message-zhengque">' +
                        o[options.zhengquedaan] +
                        '</div>';
                }
                if(options.jiexi && o[options.jiexi]){
                    result += '<div class="jiexi tiku-message-jiexi">' +
                        o[options.jiexi] +
                        '</div>';
                }
                result+="</div>";
            });
            result += '</div>';
            return result;
        },
        createRadio:function (j, obj )
        {
            return '<label><input type="radio" name="daan' + j + '" data-index="'+j+'" data-point="'+obj.point+'" data-title="' + obj.zimu + '、' + obj.title + '" value="' + obj.zimu + '"  /> ' + obj.zimu + ' ' + obj.title + ' </label> ';
        },
        createCheckbox:function (j, obj )
        {
            return '<label><input type="checkbox" name="daan' + j + '" data-index="'+j+'" data-point="'+obj.point+'" data-title="' + obj.zimu + '、' + obj.title + '" value="' + obj.zimu + '" /> ' + obj.zimu + ' ' + obj.title + ' </label>';
        },
        createTextarea:function (j,obj){
            return '<textarea name="daan' + j + '" data-index="'+j+'" style="width: 100%;height: 85px;" placeholder="请填写答案"></textarea>';
        }
    };

    w.paper = paper;
})(window,jQuery);