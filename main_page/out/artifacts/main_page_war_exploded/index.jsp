<%--
  Created by IntelliJ IDEA.
  User: Think
  Date: 2019/11/27
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.lang.*,java.util.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="黄伟轩"/>
  <meta name="keywords" content="网络信息系统基础课程 第一次作业"/>
  <link rel="icon" href="img/timg.jfif"/>
  <link rel="stylesheet" href="css/jquery.mCustomScrollbar.css"/>
  <link rel="sytlesheet" href="css/jquery.mCustomScrollbar.min.css"/>
  <link rel="stylesheet" href="css/style.css"/>
  <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
  <!--<script src="js/musicpaly.js"></script>-->
  <script src="js/1.js"></script>
  <title>第一次网页设计</title>
</head>
<body>
<%
  response.setHeader("refresh","1000");//自动刷新
  String username="";
  int visitTimes=0;
  if(session.getAttribute("judge")!=null)//session提取表单
  {
    if (session.getAttribute("judge").equals("ok"))
    {
      out.print("<script>alert('"+"欢迎"+session.getAttribute("username")+"')</script>");
    }
  }
  Cookie[] cookies=request.getCookies();

  if(cookies==null)
  {
    out.print("<script>alert('尚未登陆')</script>");
    %>
    <jsp:forward page="log.jsp"></jsp:forward>//forward跳转
  <%}
  else
  {
    for(int i=0; cookies!=null&&i<cookies.length; i++){//cookies 检测
      Cookie cookie = cookies[i];
      if("username".equals(cookie.getName())){
        username = cookie.getValue();
      }
      else if("visitTimes".equals(cookie.getName())){
        visitTimes = Integer.parseInt(cookie.getValue());
      }
      Cookie visitTimesCookie = new Cookie("visitTimes", Integer.toString(++visitTimes));
      response.addCookie(visitTimesCookie);
    }
  }
  %>
<%
  //aplication
  if(application.getAttribute("counter")==null)
  {
    application.setAttribute("counter","1");
  }
  else
  {
    String counter=null;
    counter=application.getAttribute("counter").toString();
    int icount=0;
    icount=Integer.parseInt(counter);
    icount++;
    application.setAttribute("counter",Integer.toString(icount));
  }
  out.print("<script>alert('"+"您是第"+application.getAttribute("counter").toString()+"个"+"')</script>");
%>
<!--头部-->
<div id="title">
  <div class="titlepic clearfix">
    <a id="logo"><img src="img/ti.jpg"/></a>
    <div class="main_search">
      <form class="search">
        <input type="text" class="text" name="q" defaultval="请输入菜谱/食材/菜单/作者" x-webkit-speech=""
               value="请输入菜谱/食材/菜单/作者" autocomplete="off"
               id="inputString">
        <input type="submit" class="submit"  value="搜索" />
      </form>
    </div>
    <div class="login">
      <div class="loginimg">
        <div class="loginimgl">
        </div>
      </div>
      <div class="hello">
        <a><strong>第<%=visitTimes%>次访问</strong></a>
      </div>
      <div class="loginbt">
        <form action="log.jsp">
          <input type="submit" class="submit"  value="登录" />
          <input type="submit" class="submit"  value="注册" />
        </form>
      </div>
    </div>
  </div>
</div>
<!--头部左 -->
<div id="title2">
  <ul class="item clearfix">
    <li class="list firstblock">
      <a href=""><strong>川菜</strong></a>
      <div id="sildemenu">
        <ul>
          <li><strong>鱼香肉丝</strong></li>
          <li><strong>夫妻肺片</strong></li>
          <li><strong>宫保鸡丁</strong></li>
          <li><strong>辣子鸡丁</strong></li>
          <li><strong>水煮肉片</strong></li>
        </ul>
        <ul>
          <li><strong>白切鸡</strong></li>
          <li><strong>烧鹅</strong></li>
          <li><strong>蜜汁叉烧</strong></li>
          <li><strong>猪肠粉</strong></li>
          <li><strong>煲仔饭</strong></li>
        </ul>
        <ul>
          <li><strong>锅包肉</strong></li>
          <li><strong>烧鹅</strong></li>
          <li><strong>蜜汁叉烧</strong></li>
          <li><strong>猪肠粉</strong></li>
          <li><strong>煲仔饭</strong></li>
        </ul>
        <ul>
          <li><strong>通心粉素菜汤</strong></li>
          <li><strong>焗馄饨</strong></li>
          <li><strong>奶酪焗通心粉</strong></li>
          <li><strong>比萨饼</strong></li>
        </ul>
        <ul>
          <li><strong>玉子烧</strong></li>
          <li><strong>明太子</strong></li>
          <li><strong>乌冬面</strong></li>
          <li><strong>刺身</strong></li>
          <li><strong>定食</strong></li>
        </ul>
      </div>
    </li>
    <li class="list">
      <a href=""><strong>粤菜</strong></a>
      <div id="sildemenu">
        <ul>
          <li><strong>鱼香肉丝</strong></li>
          <li><strong>夫妻肺片</strong></li>
          <li><strong>宫保鸡丁</strong></li>
          <li><strong>辣子鸡丁</strong></li>
          <li><strong>水煮肉片</strong></li>
        </ul>
        <ul>
          <li><strong>白切鸡</strong></li>
          <li><strong>烧鹅</strong></li>
          <li><strong>蜜汁叉烧</strong></li>
          <li><strong>猪肠粉</strong></li>
          <li><strong>煲仔饭</strong></li>
        </ul>
        <ul>
          <li><strong>锅包肉</strong></li>
          <li><strong>烧鹅</strong></li>
          <li><strong>蜜汁叉烧</strong></li>
          <li><strong>猪肠粉</strong></li>
          <li><strong>煲仔饭</strong></li>
        </ul>
        <ul>
          <li><strong>通心粉素菜汤</strong></li>
          <li><strong>焗馄饨</strong></li>
          <li><strong>奶酪焗通心粉</strong></li>
          <li><strong>比萨饼</strong></li>
        </ul>
        <ul>
          <li><strong>玉子烧</strong></li>
          <li><strong>明太子</strong></li>
          <li><strong>乌冬面</strong></li>
          <li><strong>刺身</strong></li>
          <li><strong>定食</strong></li>
        </ul>
      </div>
    </li>
    <li class="list">
      <a href=""><strong>东北菜</strong></a>
      <div id="sildemenu">
        <ul>
          <li><strong>鱼香肉丝</strong></li>
          <li><strong>夫妻肺片</strong></li>
          <li><strong>宫保鸡丁</strong></li>
          <li><strong>辣子鸡丁</strong></li>
          <li><strong>水煮肉片</strong></li>
        </ul>
        <ul>
          <li><strong>白切鸡</strong></li>
          <li><strong>烧鹅</strong></li>
          <li><strong>蜜汁叉烧</strong></li>
          <li><strong>猪肠粉</strong></li>
          <li><strong>煲仔饭</strong></li>
        </ul>
        <ul>
          <li><strong>锅包肉</strong></li>
          <li><strong>烧鹅</strong></li>
          <li><strong>蜜汁叉烧</strong></li>
          <li><strong>猪肠粉</strong></li>
          <li><strong>煲仔饭</strong></li>
        </ul>
        <ul>
          <li><strong>通心粉素菜汤</strong></li>
          <li><strong>焗馄饨</strong></li>
          <li><strong>奶酪焗通心粉</strong></li>
          <li><strong>比萨饼</strong></li>
        </ul>
        <ul>
          <li><strong>玉子烧</strong></li>
          <li><strong>明太子</strong></li>
          <li><strong>乌冬面</strong></li>
          <li><strong>刺身</strong></li>
          <li><strong>定食</strong></li>
        </ul>
      </div>
    </li>
    <li class="list">
      <a href=""><strong>意大利菜</strong></a>
      <div id="sildemenu">
        <ul>
          <li><strong>鱼香肉丝</strong></li>
          <li><strong>夫妻肺片</strong></li>
          <li><strong>宫保鸡丁</strong></li>
          <li><strong>辣子鸡丁</strong></li>
          <li><strong>水煮肉片</strong></li>
        </ul>
        <ul>
          <li><strong>白切鸡</strong></li>
          <li><strong>烧鹅</strong></li>
          <li><strong>蜜汁叉烧</strong></li>
          <li><strong>猪肠粉</strong></li>
          <li><strong>煲仔饭</strong></li>
        </ul>
        <ul>
          <li><strong>锅包肉</strong></li>
          <li><strong>烧鹅</strong></li>
          <li><strong>蜜汁叉烧</strong></li>
          <li><strong>猪肠粉</strong></li>
          <li><strong>煲仔饭</strong></li>
        </ul>
        <ul>
          <li><strong>通心粉素菜汤</strong></li>
          <li><strong>焗馄饨</strong></li>
          <li><strong>奶酪焗通心粉</strong></li>
          <li><strong>比萨饼</strong></li>
        </ul>
        <ul>
          <li><strong>玉子烧</strong></li>
          <li><strong>明太子</strong></li>
          <li><strong>乌冬面</strong></li>
          <li><strong>刺身</strong></li>
          <li><strong>定食</strong></li>
        </ul>
      </div>
    </li>
    <li class="list">
      <a href=""><strong>日料</strong></a>
      <div id="sildemenu">
        <ul>
          <li><strong>鱼香肉丝</strong></li>
          <li><strong>夫妻肺片</strong></li>
          <li><strong>宫保鸡丁</strong></li>
          <li><strong>辣子鸡丁</strong></li>
          <li><strong>水煮肉片</strong></li>
        </ul>
        <ul>
          <li><strong>白切鸡</strong></li>
          <li><strong>烧鹅</strong></li>
          <li><strong>蜜汁叉烧</strong></li>
          <li><strong>猪肠粉</strong></li>
          <li><strong>煲仔饭</strong></li>
        </ul>
        <ul>
          <li><strong>锅包肉</strong></li>
          <li><strong>烧鹅</strong></li>
          <li><strong>蜜汁叉烧</strong></li>
          <li><strong>猪肠粉</strong></li>
          <li><strong>煲仔饭</strong></li>
        </ul>
        <ul>
          <li><strong>通心粉素菜汤</strong></li>
          <li><strong>焗馄饨</strong></li>
          <li><strong>奶酪焗通心粉</strong></li>
          <li><strong>比萨饼</strong></li>
        </ul>
        <ul>
          <li><strong>玉子烧</strong></li>
          <li><strong>明太子</strong></li>
          <li><strong>乌冬面</strong></li>
          <li><strong>刺身</strong></li>
          <li><strong>定食</strong></li>
        </ul>
      </div>
    </li>
  </ul>
</div>
<!--body部分-->
<div class="inner clearfix">
  <div class="inner_main">
    <div class="main_l">
      <ul class="service-bd">
        <li class="service_head">
          <id class="head"><strong>今日推荐</strong></a>
        </li>
        <li class="all">
          <a href="">火锅</a>
          /
          <a href="">水煮肉片</a>
          /
          <a href="">烧烤</a>
        </li>
        <li class="all">
          <a href="">回锅肉</a>
          /
          <a href="">鱼香肉丝</a>
          /
          <a href="">豆腐</a>
        </li>
        <li class="all">
          <a href="">柠檬水</a>
          /
          <a href="">披萨</a>
          /
          <a href="">意大利面</a>
        </li>
        <li class="all">
          <a href="">鹅肝</a>
          /
          <a href="">鱼籽</a>
          /
          <a href="">松露</a>
        </li>
        <li class="all">
          <a href="">薯条</a>
          /
          <a href="">炸鸡</a>
          /
          <a href="">汉堡</a>
        </li>
        <li class="all">
          <a href="">炸酱面</a>
          /
          <a href="">爆肚</a>
          /
          <a href="">豆汁儿</a>
        </li>
        <li class="all">
          <a href="">蛋炒饭</a>
          /
          <a href="">兰州拉面</a>
          /
          <a href="">香锅</a>
        </li>
        <li class="all">
          <a href="">土豆丝</a>
          /
          <a href="">炖茄子</a>
          /
          <a href="">油麦菜</a>
        </li>
        <li class="all">
          <a href="">寿司</a>
          /
          <a href="">军舰</a>
          /
          <a href="">手握</a>
        </li>
        <li class="all">
          <a href="">章鱼小丸子</a>
          /
          <a href="">可丽饼</a>
          /
          <a href="">可乐饼</a>
        </li>
      </ul>
    </div>
    <div class="main_r clearfix">
      <button type="button" id="main_r_left"><</button>
      <button type="button" id="main_r_right">></button>
      <div class="nums">
        <span></span>
        <span></span>
        <span class="on"></span>
      </div>
      <div class="main_r_img">
        <div class="main_r_img_box">
          <ul id="scrollimg" class="clearfix">
            <span></span>
            <li class="three">
              <a href=""><img src="img/15.jpg"/></a>
            </li>
            <li class="one">
              <a href=""><img src="img/3.png"/></a>
            </li>
            <li class="two">
              <a href=""><img src="img/13.png"/></a>
            </li>
            <li class="three">
              <a href=""><img src="img/15.jpg"/></a>
            </li>
            <li class="one">
              <a href=""><img src="img/3.png"/></a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="inner_right">
    <div class="clock" id="clock">
      <canvas width="270" height="200" style="position: absolute;"></canvas>
      <canvas width="270" height="200" style="position: absolute;"></canvas>
    </div>
  </div>
</div>
<!--尾部-->
<div class="foot clearfix">
  <div class="rollmusic">
    <div class="gaus"></div>
    <div class="mask"></div>
    <audio src="" ></audio>
    <div class="rollmid">
      <div class="rollmid_image">
        <div class="rollmid_image_middle"></div>
        <div class="roll_mid_icon">
          <img src="img/rollimicon.png" height="100%"/>
        </div>
      </div>
      <div class="rollmid_main">
        <div class="music_info">
          <h3 class="rollmid_main_tittle">歌名字</h3>
          <p class="rollmid_main_singer">歌手</p>
        </div>
        <div class="play-control">
          <div class="play-control-up">
            <a class="musicbefore"></a>
            <a class="musicplay"></a>
            <a class="musicafter"></a>
            <div class="jindt">
              <div class="music_line_time clearfix">00:00 / <span class="deadline">05:30</span></div>
              <div class="music_line_main">
                <div class="music_line_now">
                  <div class="music_line_dot"></div>
                </div>
              </div>
            </div>
          </div>
          <div class="play-control-down">
            <ul class="music_lyrics">
              <li class="music_lyrics_one cur">第一条</li>
              <li class="music_lyrics_tow">第二条</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="music_list">
      <ul class="mlist_content" data-mcs-theme="dark">
        <li class="mlctittle">
          <span></span>
          <div class="musicname">歌名</div>
          <div class="musictime">时间</div>
        </li>
      </ul>
    </div>
    <div class="rollright">
    </div>
  </div>
  <div class="main_foot clearfix">
    <div class="main_foot_mid">
      <div class="foot_l clearfix">
        <div class=" foot_l_img">
          <a href=""><img src="img/4.jpg"/></a>
        </div>
        <div class="word">
          <div class="word_p">
            <div id="words">
              <a>开心的时候吃好吃的更开心，不开心的时候吃好吃的会变得开心</a>
            </div>
          </div>
        </div>
      </div>
      <div class="foot_r clearfix">
        <div class="foot_list">
          <ul>
            <h4><strong>联系我们</strong></h4>
            <li><img src="img/7.1.png"/> qq</li>
            <li><img src="img/9.1.png"/> 微信</li>
            <li><img src="img/6.png"/> twitter</li>
          </ul>
        </div>
        <div class="rela" clearfixr>
          <div class="relabox">
            <dl class="relalist">
              <dt>友情链接</dt>
              <dd class=""><a target="_blank" href="">美食</a></dd>
              <dd><a target="_blank" href="">百度</a></dd>
              <dd><a target="_blank" href="">github</a></dd>
              <dd><a target="_blank" href="">美食天下</a></dd>
              <dd><a target="_blank" href="">搜狐美食</a></dd>
              <dd><a target="_blank" href="">中华美食网</a></dd>
              <dd><a target="_blank" href="">更多友情链接</a></dd>
            </dl>
          </div>
          <div class="corp">
            <a href="">公司简介</a>
            <a href="mailto:hwxhwx990519@163.com">关于我们</a>
            <a href="">加入我们</a>
            <span class="last">京ICP备xxxxxxxx号/京公网安备xxxxxxxxxxxxxx Copyright © 2003-2019 MEISHIJ CO.,LTD.</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="src/clock-1.1.0.min.js"></script>
<script>
  var clock=$(".clock").clock({
    width:300,
    height:320,
    theme:"t2",
    date:new Date()
  });data=clock.data('clock');
</script>
</body>
</html>
