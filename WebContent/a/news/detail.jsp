<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8" />
	 <title>合肥新果文化传播有限公司</title>
    <meta name="keywords" content="合肥新果文化传播有限公司" />
    <meta name="description" content="安徽省内影视制作,平面广告,视频设计制作,动画漫画设计,电脑图文设计,企业策划咨询,会展服务,国内广告设计、制作、发布代理" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
    <meta name="copyright" content="Copyright www.xinguotv.com 版权所有" />
    
    <link href="${pageContext.request.contextPath}/templets/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/templets/Content/inner.min.css" rel="stylesheet" />
    <!--[if lt IE 9]>
    <script src="/templets/Scripts/html5shiv.min.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/templets/Scripts/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/templets/Scripts/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/templets/Scripts/inner.min.js"></script>
</head>

<body>
<header>
     <div class="box">
	    <a href="${pageContext.request.contextPath}/initialization"target="blank" title="www.xinguotv.com"><img src="${pageContext.request.contextPath}/templets/Picture/logo_cases.png" alt="www.xinguotv.com" style="width:255px;height: 180px; "/></a>
        <div class="wechat">
    	    <img src="${pageContext.request.contextPath}/templets/Picture/wechat_code.jpg" alt="扫描关注合肥新果文化传播有限公司微信账号" class="wechat" /><p>扫一扫微信二维码<i></i></p>
        </div>
        <nav>
          <ul>
             <li><a href="${pageContext.request.contextPath}/initialization"target="blank">${staticText.headerUlL1 }</a></li>
            <li class='active'><a href='${pageContext.request.contextPath}/cases/1'>${staticText.headerUlL2 }</a></li>
            <li><a href="${pageContext.request.contextPath}/news/1" style='color:white;'>${staticText.headerUlL3 }</a></li>
          </ul>
        </nav>
    </div>
    <footer>
	   ${staticText.footerName }<a href="http://www.xinguotv.com/" target="_blank">${staticText.footerUrlName }</a>
    </footer>
</header>
    
    <section class="toolbar">
    	<a href="/" title="返回首页" class="homelink"><span class="glyphicon glyphicon-chevron-left"></span></a>
    	<span class="switch glyphicon glyphicon-th-list"></span>
        <div class="btnList">
            <div class="link btn-group">
        	    <a href="${pageContext.request.contextPath}/news/1" class="btn btn-default">动态列表</a>
            </div>
            <div class="link btn-group">
            <c:if test="${page.pageNow == 1}">
 				  <a class="btn btn-default"><span class="glyphicon glyphicon-arrow-left"></span>FIRST</a>
				</c:if>
           	<c:if test="${page.pageNow != 1}">
 				  <a href="${pageContext.request.contextPath}/news/detail/next/${news.nChildType}/${page.pageNow-1}" class="btn btn-default"><span class="glyphicon glyphicon-arrow-left"></span>PREV</a>
				</c:if>
            </div>
            <div class="link btn-group">
  		 <c:if test="${page.pageNow != page.totalCount}">
  		 	    <a href="${pageContext.request.contextPath}/news/detail/next/${news.nChildType}/${page.pageNow+1}" class="btn btn-default">NEXT<span class="glyphicon glyphicon-arrow-right"></span></a>
  		 </c:if>
  		  <c:if test="${page.pageNow == page.totalCount}">
  		 	    <a class="btn btn-default">END<span class="glyphicon glyphicon-arrow-right"></span></a>
  		 </c:if>
            </div> 
        </div>
    </section>
    
    <section class="artshow content">
        <div class="box">
        	<h1>${news.nTitle }</h1>
            <span class="rel">
            	 合肥新果文化传播有限公司<u>•</u><fmt:formatDate type="time" value="${news.nCreateTime }" pattern="yyyy-MM-dd hh:mm:ss" /><u>•</u>${news.nType }<u>•</u><span class="glyphicon glyphicon-eye-open" title="浏览次数"></span> ${news.nOnlookerNum}</script>
            </span>
            <div class="words">
             <p>${news.nContent }</p>
            </div>
            <dl class="tags">
              <dt>文章关键词<span class="glyphicon glyphicon-tag"></span></dt>
              
              <dd>
              	 <c:if test="${news.nLabel1!='' && news.nLabel1!=null}">
	            	  <a>${news.nLabel1}</a>
	              </c:if>
              </dd>
              
              <dd>
	              <c:if test="${news.nLabel2!=''&& news.nLabel2!=null}">
	            	  <a>${news.nLabel2}</a>
	              </c:if>
              </dd>
              
            </dl>
            <div class="bdsharebuttonbox">
            	<a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
            </div>
        </div>
        <aside>
        	<div class="ad"><a href="#" title="影视后期，找新果文化" target="_blank"><img src="${pageContext.request.contextPath}/templets/Picture/ad.jpg" alt="视频设计制作，动画漫画设计,找新果，视频，影视品牌设计企业" /></a></div>
            <div class="caption"><h3>推荐阅读</h3></div>
            <c:forEach items="${newsList }" var="nl">
            <ul class="items">
               <li>
                  <a href="${pageContext.request.contextPath}/news/detail/${nl.nId}" target="_blank" class="thumb"><img src="${pageContext.request.contextPath}/${nl.nThumbnail }"style="width: 101px;height: 70px;"/></a>
                  <span class="title"><a href="${pageContext.request.contextPath}/news/detail/${nChildType}/${nl.nId}" target="_blank" title="${nl.nTitle }">${nl.nTitle }</a></span>
                  <span class="rel"><fmt:formatDate type="time" value="${nl.nCreateTime }" pattern="yyyy-MM-dd" /><span class="glyphicon glyphicon-eye-open" title="浏览次数"></span>${nl.nOnlookerNum }</span>
                </li>
            </ul>
            </c:forEach>
        </aside>
    </section>
    
     <div class="dock">
        <ul class="icons">
        	<li class="up"><i></i></li>
            <li class="tel">
            	<i></i><p>咨询热线<br />${sessionScope.constant.cExtra2 }</p>
            </li>
            <li class="im">
            	<i></i><p><a href="http://wpa.qq.com/msgrd?v=3&uin=${constant.cExtra3 }&site=qq&menu=yes" target="_blank">在线咨询</a></p>
            </li>
        </ul>
    </div>
</body>
</html>