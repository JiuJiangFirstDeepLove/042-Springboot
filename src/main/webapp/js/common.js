(function(){

    (function () {
        var path =location.pathname.substr(1);
        var search = location.search;
        if(search!=''){
            path += decodeURIComponent(search);
        }
        if(path == '')
        {
            $('#navbar-str>li:eq(0)').addClass('active');
        }else{
            $('#navbar-str>li').each(function () {
                var href = $(this).find('>a').attr('href');
                if(href == path)
                {
                    $(this).addClass('active');
                }
                if($(this).hasClass('nav-child'))
                {
                    var that = this;
                    $(this).find('li').each(function () {
                        var href = $(this).find('>a').attr('href');
                        if(href == path)
                        {
                            $(this).addClass('active');
                            $(that).addClass('active');
                        }
                    })
                }
            })
        }
        console.log(path)
    })();

})();
(function(){
(function () {
    function selectRadio(obj) {
        var form = $(obj).parents('form');
        var div = $(obj).parent();
        div.find('input').val($(obj).attr('data-value'));
        var isSeach = false;
        $('.search-radio-tree').each(function (i) {
            if(isSeach){
                $(this).remove();
            }
            if(this == div[0])
            {
                isSeach=true
            }
        });
        form.submit();
    }
    window.selectRadio = selectRadio;
    $('.search-radio').each(function () {

        var val = $(this).find('input').val();
        $(this).find('a[data-value="'+val+'"]').addClass('active');

    })
})();

})();