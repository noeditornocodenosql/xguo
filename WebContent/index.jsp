<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	 <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>新果文化合肥影视制作公司，合肥宣传片制作公司，合肥影视广告公司，安徽影视制作，安徽影视制作公司，合肥广告片制作，安徽宣传片制作，安徽影视广告公司，安徽广告片制作公司</title>
        <meta name="keywords" content="合肥影视制作公司，合肥宣传片制作公司，合肥影视广告公司，安徽影视制作，安徽影视制作公司，合肥广告片制作，安徽宣传片制作，安徽影视广告公司，安徽广告片制作公司">
        <meta name="description" content="合肥新果文化传播有限公司是省内影视制作、平面广告界的一支新兴力量，在合肥影视制作、合肥宣传片制作、合肥影视广告制作、安徽影视制作、合肥广告片制作、安徽宣传片制作、安徽影视广告制作、安徽广告片制作等领域拥有丰富经验，新果文化设备齐全，拥有专业、一流的各类设备，是具备整体、综合能力的创新型企业，秉承着不断创新、精益求精的宗旨和客户服务至上的理念，自成立以来承接了多个政府企业宣传片制作和政府大型活动宣传项目，获得一致好评 !服务热线：0551-68992884">
    <link href="${pageContext.request.contextPath}/templets/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/templets/Content/index.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/front/we/css/we.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/templets/Scripts/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/templets/Scripts/index.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/front/team/js/team.js"></script>
    <link type="text/css" href="${pageContext.request.contextPath}/resources/front/team/css/team.css" rel="stylesheet" media="all" />
	<script src="${pageContext.request.contextPath}/resources/front/team/js/jquery.carouFredSel-6.2.0-packed.js" type="text/javascript"></script>
</head>

<body>
    <header>
        <div class="logo">
          <img src="${pageContext.request.contextPath}/templets/Picture/logo.png" alt="www.xinguotv.com" class="img-responsive" />
        </div>
           <c:forEach items="${constantList }" var="constant">
        <strong class="words">${constant.cExtra1 }</strong>
        </c:forEach>
        <nav class="menu">
          <ul class="list-inline">
          <c:forEach items="${categoryList }" var="category">
            <li class="active"><a>${category.cName }</a></li>
          </c:forEach>
          </ul>
        </nav>
        <div class="hotline">
          <a href="#" title="影视后期制作免费咨询热线"><span>${constant.cExtra4 }</span></a><u></u>
        </div>
    </header>
    <div class="welcome" style="background: url(${pageContext.request.contextPath}/${constant.cExtra5 }) 50% 80%;"><p><u>Loading . . .</u></p></div>
    
    <section class="video">
    	<div class="swiper-container">
            <div class="swiper-wrapper">
              <div class="swiper-slide nth1">
                <div class="box">
                  <div class="left"></div>
                  <div class="right">
                	<span>${staticText.carouselSpan1 }</span><i></i>
                    <p>${staticText.carouselP1 }</p>
                  </div>
                </div>
              </div>
              <div class="swiper-slide nth2">
              	<div class="box">
                	<span>${staticText.carouselSpan2 }</span><i></i>
                    <p>${staticText.carouselP2 }</p>
                </div>
              </div>
              <div class="swiper-slide nth3">
              	<div class="box">
                  <div class="top">${staticText.carouselSpan3 }</div>
                  <div class="mid"></div>
                  <div class="bottom">${staticText.carouselP3 }</div>
                </div>
              </div>
              <div class="swiper-slide nth4">
              	<div class="box">
                  <div class="top"><span>${staticText.carouselSpan4 }</span><i></i></div>
                  <div class="bottom">${staticText.carouselP4 }</div>
                </div>
              </div>
            </div>
        </div>
        <div class="innerBox">
        	<div class="news">
        	  <c:if test="${newsList != null }">
            	<span>NEWS :</span>
                <a href="${pageContext.request.contextPath}/news/1" title="更多动态" class="more" target="_blank">more</a>
                <ul>
                 <c:forEach items="${newsList }" var="news">
                   <li><a href="${pageContext.request.contextPath}/news/detail/${news.nChildType}/${news.nId}" target="_blank" title="${news.nTitle }">${news.nTitle }</a></li>
                  </c:forEach>
                </ul>
                    </c:if>
            </div>
            <div class="guide"></div>
            <a class="movedown"></a>
        </div>
    </section>
    
    <!-- 业务 -->
    <section class="business">
      <div class="box">
        <div class="caption">
        	<i></i><span>${staticText.businessSpan }</span>
            <br class="clear" />
        </div>
        <ul class="items list-inline">
        	<li class="pc">
            	<i></i><strong>${staticText.businessStrong1 }</strong>
            </li>
            <li class="mobi">
            	<i></i><strong>${staticText.businessStrong2 }</strong>
            </li>
            <li class="sys">
            	<i></i><strong>${staticText.businessStrong3 }</strong>
            </li>
            <li class="app">
            	<i></i><strong>${staticText.businessStrong4 }</strong>
            </li>
            <li class="host">
            	<i></i><strong>${staticText.businessStrong5 }</strong>
            </li>
        </ul>
      </div>
    </section>
    
    <!-- 案例 -->
    <section class="cases">
    <div class="box">
    	<div class="caption">
        	<i></i><span>${staticText.casesSpan }</span>
            <br class="clear" />
        </div>
        <div class="swiper-container items">
        <c:forEach items="${exampleList }" var="example">
           <div class="swiper-wrapper">
                 <div class="swiper-slide">
                    <a href="${pageContext.request.contextPath}/cases/detail/${example.eChildType }/${example.eId}" target="_blank">
                    <img src="${pageContext.request.contextPath}/${example.eThumbnail}" alt="${example.eProjectName}" />
                    <p>${example.eLabel}<br /><strong>${example.eProjectName}</strong><br />${example.eLabel1},${example.eLabel2}</p></a>
                  </div>
           </div>
           </c:forEach>
        </div>
        <a href="${pageContext.request.contextPath}/cases/1" title="欣赏更多案例" class="more" target="_blank">MORE</a>
      </div>
    </section>
    
    <!-- 客户 -->
    <section class="clients">
   	  <div class="box">
    	<div class="caption">
        	<i></i><span>${staticText.clientsCaption }</span>
            <br class="clear" />
        </div>
        <ul class="items list-inline">
        	<li class="cctv"><span>CCTV影响力视频影视后期制作</span></li>
            <li class="unicom"><span>中国联通电信卡网站制作</span></li>
            <li class="tsinghua"><span>清华大学国际预科学院影视后期制作</span></li>
            <li class="cas"><span>中科院力学研究所网站设计</span></li>
            <li class="sipo"><span>国家知识产权局影视后期制作</span></li>
            <li class="apple"><span>中航苹果官方网站设计</span></li>
            <li class="das"><span>一汽大众汽车门户影视后期制作</span></li>
            <li class="hunantv"><span>湖南卫视全媒体影视后期制作</span></li>
            <li class="sino"><span>中环球船务官方网站制作</span></li>
            <li class="report"><span>中国报道信息门户影视后期制作</span></li>
            <li class="gedu"><span>环球雅思教育门户网站制作</span></li>
            <li class="bgg"><span>京粮集团影视后期制作</span></li>
            <li class="bsec"><span>北赛电工官方网站设计</span></li>
            <li class="huadan"><span>华丹乳业官方影视后期制作</span></li>
            <li class="zd"><span>中东集团网站制作</span></li>
        </ul>
      </div>
    </section>
    
    <!-- 团队 -->
    <section class="quality">
      <div class="box">
    	<div class="caption">
        	<i></i><span>${staticText.teamCaption }</span>
        </div>
     <div class="swiper-container items">
            <div class="swiper-wrapper">
             <div id="wrapper">
			<div id="slider">
			<c:forEach items="${teamList }" var="team">
		  <c:if test="${not empty team.tThumbnail}">
			<div class="slide">
			<img  src="${pageContext.request.contextPath}/${team.tThumbnail}"/>
					<div class="slide-block">
						<h4>${team.tTitle }</h4>
						<p>${team.tContent }</p>
					</div>
				</div>
				</c:if>
		</c:forEach>
			</div>
		</div>
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/teamMore/1" class="lookall" target="_blank">更多关于团队内容请点击</a>
      </div>
    </section>

    <!-- 动态 -->
<style>
	.box .dynamic{width:980px; overflow:hidden;margin:30px auto;}
	.box .dynamic ul li{width:297px;height:198px;float:left;margin:0 15px 15px 0;position:relative;overflow:hidden;cursor:pointer;}
	.box .dynamic .txt{width:297px;height:45px; background:url(${pageContext.request.contextPath}/resources/front/dynamic/images/1px.png) repeat;position:absolute;left:0;bottom:0;color:#fff;font-family:"微软雅黑";}
	.box .dynamic .txt h3{font-size:20px;font-weight:100;height:45px;text-align:center;line-height:25px;}
	.box .dynamic .txt p{font-size:14px;text-align:center;}
</style>
 <section class="marketing">
      <div class="box">
        <div class="caption">
        	<i></i><span>${staticText.dynamicCaption }</span>
        </div>
        <div class="dynamic">
        <ul class="items list-inline">
        <c:forEach items="${dynamicCirculateList }" var="dynamic">
    <a href="${pageContext.request.contextPath}/childNews/1/${dynamic.dId}" target="_blank"> <li><img src="${pageContext.request.contextPath}/${dynamic.bigPictureThumbnail}"/><div class="txt"><h3>${dynamic.bigPictureTitle}</h3><p>${dynamic.bigPictureContent}</p></div></li></a>   
        </c:forEach>
        </ul>
        <a href="${pageContext.request.contextPath}/news/1" class="lookall" target="_blank">更多关于新果动态内容请点击</a>
        </div>
<script>
$(".box ul li").hover(function(){
	$(this).find(".txt").stop().animate({height:"198px"},400);
	$(this).find(".txt h3").stop().animate({paddingTop:"60px"},400);
},function(){
	$(this).find(".txt").stop().animate({height:"45px"},400);
	$(this).find(".txt h3").stop().animate({paddingTop:"0px"},400);
})
</script>

      </div>
    </section>

	<!-- 我们 -->
     <section class="aboutus">
    	<ul class="menu"><li>${staticText.aboutusMenuLi1 }</li><li>${staticText.aboutusMenuLi2 }</li><li>${staticText.aboutusMenuLi3 }</li></ul>
        <div class="swiper-container items">
            <div class="swiper-wrapper">
              <div class="swiper-slide nth1">
                <strong>${staticText.aboutusDivStrong1 }</strong>
                <p>${staticText.aboutusDivP1 }</p>
                <u>${staticText.aboutusDivU1 }</u>
              </div>
              <div class="swiper-slide nth2">
              	<strong>${staticText.aboutusDivStrong2 }</strong>
                <p>${staticText.aboutusDivP2_1 }</p>
                <p>${staticText.aboutusDivP2_2 }</p>
              </div>
              <div class="swiper-slide nth3">
              	<strong>${staticText.aboutusDivStrong3 }</strong>
                <ul>
                  <li>${staticText.aboutusUlL1 }</li>
                  <li>${staticText.aboutusUlL2 }</li>
                  <li>${staticText.aboutusUlL3 }</li>
                  <li>${staticText.aboutusUlL4 }</li>
                  <li>${staticText.aboutusUlL5 }</li>
                </ul>
              </div>
            </div>
        </div>
        <table class="exp">
        	<tr>
              <td>${staticText.aboutusTableTd1 }</td>
              <td>${staticText.aboutusTableTd2 }</td>
              <td>${staticText.aboutusTableTd3 }</td>
              <td>${staticText.aboutusTableTd4 }</td>
              <td>${staticText.aboutusTableTd5 }</td>
            </tr>
        </table>
    </section>
    
    <section class="contact">
    	<div class="box">
        	<div class="above">
            	<div class="wechat"><img src="${pageContext.request.contextPath}/templets/Picture/wechat_code.jpg" alt="扫描关注合肥新果文化传播有限公司微信账号" style="width: 150px;height: 150px;"/></div>
            	<div class="wechat"><img src="${pageContext.request.contextPath}/templets/Picture/wechat_code2.jpg" alt="扫描关注合肥新果文化传播有限公司微信账号" style="width: 150px;height: 150px;"/></div>
                <div class="left">
                	<a title="合肥新果文化传播有限公司" class="tel"></a>
                    <p>中国<u>·</u>${constant.cAddress}<br />联系电话：${constant.cPhone}<br />固话：${constant.cTelephone}<br />邮箱：${constant.cEmail}<br />网址：${constant.cWebsite}<br />邮编：${constant.cPostcode}&nbsp;&nbsp;&nbsp;&nbsp;备案号:<a href="http://icp.chinaz.com/" target="blank" style="color: red;font-size: 13px;">&nbsp;&nbsp;皖ICP备16005498</a></p>
                </div>
            </div>
        </div>
    </section>
    <div class="dock">
        <ul class="icons">
        	<li class="up"><i></i></li>
            <li class="im">
            	<i></i><p>影视后期咨询,<br/>请点击<a href="http://wpa.qq.com/msgrd?v=3&uin=${constant.cExtra3 }&site=qq&menu=yes" target="_blank">在线咨询</a></p>
            </li>
            <li class="tel">
            	<i></i><p>咨询热线：<br />${constant.cExtra2 }</p>
            </li>
            <li class="wechat">
            	<i></i><p><img src="${pageContext.request.contextPath}/templets/Picture/wechat_code.jpg" alt="扫描关注影视后期制作微信公众账号" /></p>
            </li>
            <li class="down"><i></i></li>
        </ul>
        <a class="switch"></a>
    </div>
</body>    
</html>
