//自启动有时会有问题，没有发现问题出在哪里
$(function(){
    //$('#scrollimg').find('li:not(.one)').hide();
    var auto;
    var $temp=$('#scrollimg span');
    var page=1;
    var len=-630*4+20;
    var len2=630*3+20;
    var isclickab=false;
    var nindex=3;
    var startflag=false;
    var $dots=$('.nums span');
    var timer=null;
    var roll_mid_icon_timer=null;
    var $musictemp=$('.rollmusic');
    $(".mlist_content").mCustomScrollbar(
        {theme:"dark-thin"}
    );
    var $timed=$(".deadline");
    var $audio=$("audio");
    var audio=$audio.get(0);
    var $musicplaybuttom=$(".play-control-up").children("a").eq(1);
    var $music_name=$(".rollmid_main_tittle");
    var $musicplayer_name=$(".rollmid_main_singer");
    var $gaus=$(".gaus");
    var $rollmidpic=$(".rollmid_image_middle");
    /* $.getScript( "js/jquery.mCustomScrollbar.concat.min.js" )
          .done(function( script, textStatus ) {
              alert("yes");
            console.log( textStatus );
          })
           .fail(function( jqxhr, settings, exception ) {
               alert("no");
            $( "div.log" ).text( "Triggered ajaxError handler." );
        }); */
    function picleft(){
        if(parseInt($musictemp.css('left'))>=-740)
        {
            $musictemp.animate({left:"-=10"},10);
        }
        else clearInterval(timer);
    }
    function picright(){
        if(parseInt($musictemp.css('left'))<=-10)
        {
            $musictemp.animate({left:"+=10"},10);
        }
        else clearInterval(timer);
    }
    function musicrollplayleft(){
        timer=setInterval(picleft,15);
    }
    function musicrollplayright(){
        timer=setInterval(picright,15);
    }
    $musictemp.hover(function () {
        clearInterval(timer);
        musicrollplayright();
    },function () {
        clearInterval(timer);
        musicrollplayleft()
    })
    $('.main_r_img_box').hover(function(){
            clearInterval(auto);
        },function(){
            clearInterval(auto);
            autoplay();}
    )
    //左滚动
    function scrollRight() {
        isclickab=false;
        nindex++;
        if(nindex>3)nindex=1;
        showcurrentdots();
        if(parseInt($('#scrollimg').css('left'))<=len)
        {
            $('#scrollimg').css('left','-630px');
        }
        $('#scrollimg').animate({left:"-=630"},1000,function(){isclickab=true;});
    }
    //右滚动
    function scrollLeft(){
        nindex--;
        if(nindex==0)nindex=3;
        isclickab=false;
        showcurrentdots();
        if(parseInt($('#scrollimg').css('left'))>=20)
        {
            $('#scrollimg').css('left','-'+len2+'px');
        }
        $('#scrollimg').animate({left:"+=630"},1000,function(){isclickab=true;});
    }
    //显示dots
    function showcurrentdots(){
        $dots.each(function(){
            $(this).removeClass();
        })
        $dots.eq(nindex-1).addClass('on')
    }
    function autoplay()
    {
        auto=setInterval(scrollRight,2500);
    }
    /*if(!startflag)
    {autoplay();
    startflag=true;
}*/autoplay();
    $('.item').children().mouseenter(function(){
        //$(this).children('#sildemenu').css('display','inline-block');
        $(this).children('#sildemenu').slideDown(300);
    })
    $('.item').children().mouseleave(function(){
        $(this).children('#sildemenu').stop();
        $(this).children('#sildemenu').css('display','none');
    })
    $('#main_r_left').on('click',function(){
        if(isclickab)
            scrollLeft();
    })
    $('#main_r_right').on('click',function(){
        if(isclickab)
            scrollRight();
    })
    //遍历节点（不知道为什么，第二个函数传入继续传入index会导致无法使用，没有找到解释)
    $dots.each(
        function(index){
            $(this).bind('mousedown',function(){
                //	console.log(index);
                nindex=parseInt(index)+1;
                $('#scrollimg').animate({left:((parseInt(index)+1)*(-630))+"px"},100,function(){isclickab=true;});
                showcurrentdots();
            })
        });
    var angle=0;
    function rotate(index) {
        $rollmidpic.css("transform","rotate("+index+"deg)");
    }
    function roll_mid_icon_roll() {
        roll_mid_icon_timer=setInterval(function () {
            //console.log($rollmidpic,angle);
            angle+=3;
            angle%=360;
            rotate(angle);
        },10);
    }
    //获取歌曲的json文件
    function getmusiclist()
    {
        $.ajax(
            {
                url:"./src/package.json",
                dataType:"json",
                success:function (data) {
                    $(".mlist_content").mCustomScrollbar(
                        "destroy"
                    );
                    $now=$(".mlist_content");
                    $.each(data,function(index,ele){
                        //console.log(ele);
                        var $itme=createmusiclist(index,ele);
                        $now.append($itme);
                    })
                    $(".mlist_content").mCustomScrollbar(
                        {theme:"dark-thin"}
                    )
                },
                error:function (e1) {
                    console.log(e1);
                }
            }
        )
    }
    var nowlist=-1;
    //托管歌曲目录
    $(".mlist_content").delegate(".content","mouseenter",function () {
        //console.log($(this).get(0).music);
        $(this).find(".musicname").fadeTo(10,0.3);
    });
    $(".mlist_content").delegate(".content","mouseleave",function () {
        $(this).find(".musicname").fadeTo(10,1);
    });
    $(".mlist_content").delegate(".content","click",function () {
        var temp=$(this).get(0);
        //console.log(temp);
        if(nowlist===temp.index)
        {
            //同一首音乐
            if(audio.paused)
            {
                $musicplaybuttom.addClass("muscipaly2");
                audio.play();
                //console.log($music_name);
                $music_name.html(temp.music.audio_name);
                $musicplayer_name.html(temp.music.author_name);
                $rollmidpic.css("transform-origin","50% 50%");
                angle=0;
                clearInterval(roll_mid_icon_timer);
                roll_mid_icon_roll();
            }
            else
            {
                $musicplaybuttom.removeClass("muscipaly2");
                audio.pause();
                angle=0;
                clearInterval(roll_mid_icon_timer);
            }
        }
        else
        {
            //console.log("url(../" + temp.music.img + ")");
            $gaus.css("background-image","url("+temp.music.img+")");
            $gaus.css("background-size","100% 100%");
            $rollmidpic.css("background","url("+temp.music.img+")");
            $rollmidpic.css("background-size","100% 100%");
            angle=0;
            clearInterval(roll_mid_icon_timer);
            roll_mid_icon_roll();
            nowlist=temp.index;
            //不是同一首音乐
            $music_name.html(temp.music.audio_name);
            $musicplayer_name.html(temp.music.author_name);
            $audio.attr("src",temp.music.play_url);
            $musicplaybuttom.addClass("muscipaly2");
            $timed.html(temp.music.timelength);

            audio.play();
        }
    });
    //创建歌曲
    function createmusiclist(index,ele) {
        var $tempitme=$("<li class=\"content\">\n" +
            "\t\t\t\t\t<span>"+(index+1)+"</span>\n" +
            "\t\t\t\t\t<div class=\"musicname\">"+ele.audio_name+"</div>\n" +
            "\t\t\t\t\t<div class=\"musictime\">"+ele.timelength+"</div>\n" +
            "\t\t\t\t</li>")
        $tempitme.get(0).index=index;
        $tempitme.get(0).music=ele;
        return $tempitme;
    }

    //音乐控制暂停和开始
    $musicplaybuttom.click(function () {
        if(nowlist===-1) {
            $(".content").eq(0).trigger("click");
        }
        else {
            $(".content").eq(nowlist).trigger("click");
        }
    });
    getmusiclist();
});
