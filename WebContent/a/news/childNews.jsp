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
    <meta name="copyright" content="Copyright www.xg.com 版权所有" />
    
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
        <div class="category btn-group">
       	    <c:choose>
	              <c:when test="${nChildType==0 }">
	             	 <a href="${pageContext.request.contextPath}/news/1" class="btn btn-default btn-primary">全部</a>
	              </c:when>
	              <c:otherwise>
	            	 <a href="${pageContext.request.contextPath}/news/1" class="btn btn-default">全部</a>
	              </c:otherwise>
              </c:choose>
            
            <c:choose>
	              <c:when test="${nChildType==1 }">
	             	 <a href="${pageContext.request.contextPath}/childNews/1/1" class="btn btn-default btn-primary">新果新闻</a>
	              </c:when>
	              <c:otherwise>
	            	 <a href="${pageContext.request.contextPath}/childNews/1/1" class="btn btn-default">新果新闻</a>
	              </c:otherwise>
              </c:choose>
              
              <c:choose>
	              <c:when test="${nChildType==2 }">
	             	 <a href="${pageContext.request.contextPath}/childNews/1/2" class="btn btn-default btn-primary">新果动态</a>
	              </c:when>
	              <c:otherwise>
	            	<a href="${pageContext.request.contextPath}/childNews/1/2" class="btn btn-default">新果动态</a>
	              </c:otherwise>
              </c:choose>
              
               <c:choose>
	              <c:when test="${nChildType==3 }">
	             	 <a href="${pageContext.request.contextPath}/childNews/1/3" class="btn btn-default btn-primary">新果生活</a>
	              </c:when>
	              <c:otherwise>
	            	<a href="${pageContext.request.contextPath}/childNews/1/3" class="btn btn-default">新果生活</a>
	              </c:otherwise>
              </c:choose>
        </div>
    </section>
    
    <section class="artlist content">
        <ul class="items">
        <c:forEach items="${newsList }" var="news">
            <li>
              <p class="left">
                 <span class="date"><fmt:formatDate type="time" value="${news.nCreateTime }" pattern="MM" /><u><fmt:formatDate type="time" value="${news.nCreateTime }" pattern="yyyy" /></u></span>
                <a href="${pageContext.request.contextPath}/news/detail/${news.nChildType}/${news.nId}" target="_blank" class="thumb"><img src="${pageContext.request.contextPath}/${news.nThumbnail}" alt="${news.nTitle}" style="width: 240px;height: 170px;"/></a>
              </p>
              <p class="right">
                <span class="title"><a href="${pageContext.request.contextPath}/news/detail/${news.nChildType}/${news.nId}" target="_blank">${news.nTitle}</a></span>
                <span class="rel"><fmt:formatDate type="time" value="${news.nCreateTime }" pattern="yyyy-MM-dd hh:mm:ss" /><u>•</u>围观热度 ${news.nOnlookerNum}<u>•</u><a href='/a/news/experience/'>${news.nType}</a></span>
                <span class="summary">${news.nOutline}</span>
                <span class="tags">
                	<span class="glyphicon glyphicon-tag"></span>
                    <a>${news.nLabel1}</a> <a>${news.nLabel2}</a>  
                </span>
              </p>
            </li>
            </c:forEach>
        </ul>
        <c:if test="${page.totalCount != 0}">
        <div id="Paging" class="paging">
   <div class="qzPagination">
		<c:if test="${page.pageNow != 1}">
 		<a class="disabled prev" href="${pageContext.request.contextPath}/childNews/${page.pageNow-1}/${nChildType}">«</a>
		<a  class="current" href="${pageContext.request.contextPath}/childNews/1/${nChildType}" >1</a>
	<c:if test="${page.pageNow-1 != 1}">
		<a href="${pageContext.request.contextPath}/childNews/${page.pageNow-1}/${nChildType}">${page.pageNow-1}</a>
	</c:if>
	</c:if>
		<a href="javascript:;" style="color:#6CF;text-decoration:none;">${page.pageNow}</a>
	<c:if test="${page.pageNow != page.totalPageCount}">
	<c:if test="${page.pageNow+1 != page.totalPageCount}">
			<a href="${pageContext.request.contextPath}/childNews/${page.pageNow+1}/${nChildType}">${page.pageNow+1}</a>
	</c:if>
		<a href="${pageContext.request.contextPath}/childNews/${page.totalPageCount}/${nChildType}">${page.totalPageCount}</a>
	    <a  class="next" href="${pageContext.request.contextPath}/childNews/${page.pageNow+1}/${nChildType}">»</a>
   </c:if>
             </div>
         </div>
         </c:if>
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