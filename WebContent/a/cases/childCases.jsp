<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
            <li class='active'><a href='${pageContext.request.contextPath}/cases/1' style='color:white;'>${staticText.headerUlL2 }</a></li>
            <li><a href="${pageContext.request.contextPath}/news/1">${staticText.headerUlL3 }</a></li>
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
	              <c:when test="${eChildType==0 }">
	             	 <a href="${pageContext.request.contextPath}/cases/1" class="btn btn-default btn-primary">全部</a>
	              </c:when>
	              <c:otherwise>
	            	 <a href="${pageContext.request.contextPath}/cases/1" class="btn btn-default">全部</a>
	              </c:otherwise>
              </c:choose>
              
               <c:choose>
	              <c:when test="${eChildType==1 }">
	             	 <a href="${pageContext.request.contextPath}/childExample/1/1" class="btn btn-default btn-primary">宣传片</a>
	              </c:when>
	              <c:otherwise>
	            	 <a href="${pageContext.request.contextPath}/childExample/1/1" class="btn btn-default">宣传片</a>
	              </c:otherwise>
              </c:choose>
              
              <c:choose>
	              <c:when test="${eChildType==2 }">
	             	 <a href="${pageContext.request.contextPath}/childExample/1/2" class="btn btn-default btn-primary">广告片</a>
	              </c:when>
	              <c:otherwise>
	            	  <a href="${pageContext.request.contextPath}/childExample/1/2" class="btn btn-default">广告片</a>
	              </c:otherwise>
              </c:choose>
              
               <c:choose>
	              <c:when test="${eChildType==3 }">
	             	 <a href="${pageContext.request.contextPath}/childExample/1/3" class="btn btn-default btn-primary">专题片</a>
	              </c:when>
	              <c:otherwise>
	            	  <a href="${pageContext.request.contextPath}/childExample/1/3" class="btn btn-default">专题片</a>
	              </c:otherwise>
              </c:choose>
              
               <c:choose>
	              <c:when test="${eChildType==4 }">
	             	<a href="${pageContext.request.contextPath}/childExample/1/4" class="btn btn-default btn-primary">纪录片</a>
	              </c:when>
	              <c:otherwise>
	            	 <a href="${pageContext.request.contextPath}/childExample/1/4" class="btn btn-default">纪录片</a>
	              </c:otherwise>
              </c:choose>
              
               <c:choose>
	              <c:when test="${eChildType==5 }">
	             	<a href="${pageContext.request.contextPath}/childExample/1/5" class="btn btn-default btn-primary">微电影</a>
	              </c:when>
	              <c:otherwise>
	            	<a href="${pageContext.request.contextPath}/childExample/1/5" class="btn btn-default">微电影</a>
	              </c:otherwise>
              </c:choose>
              
              <c:choose>
	              <c:when test="${eChildType==6 }">
	             	 <a href="${pageContext.request.contextPath}/childExample/1/6" class="btn btn-default btn-primary">平面设计</a>
	              </c:when>
	              <c:otherwise>
	            	 <a href="${pageContext.request.contextPath}/childExample/1/6" class="btn btn-default">平面设计</a>
	              </c:otherwise>
              </c:choose>
              
              <c:choose>
	              <c:when test="${eChildType==7 }">
	             	 <a href="${pageContext.request.contextPath}/childExample/1/7" class="btn btn-default btn-primary">其他</a>
	              </c:when>
	              <c:otherwise>
	            	 <a href="${pageContext.request.contextPath}/childExample/1/7" class="btn btn-default">其他</a>
	              </c:otherwise>
              </c:choose>
        </div>	
    </section>
    
    <section class="caselist content">
        <ul class="items list-inline">
        <c:forEach items="${exampleList }" var="example">
           <li>
              <a href="${pageContext.request.contextPath}/cases/detail/${example.eChildType }/${example.eId }" target="_blank">
              <img src="${pageContext.request.contextPath}/${example.eThumbnail }" alt="${example.eProjectName }" />
              <p>${example.eLabel }<br /><strong>${example.eProjectName }</strong><br />${example.eLabel1 },${example.eLabel2 }</p></a>
            </li>
            </c:forEach>
        </ul>
         <c:if test="${page.totalCount != 0}">
        <div id="Paging" class="paging">
   <div class="qzPagination">
		<c:if test="${page.pageNow != 1}">
 		<a class="disabled prev" href="${pageContext.request.contextPath}/childExample/${page.pageNow-1}/${eChildType}">«</a>
		<a  class="current" href="${pageContext.request.contextPath}/childExample/1/${eChildType}" >1</a>
	<c:if test="${page.pageNow-1 != 1}">
		<a href="${pageContext.request.contextPath}/childExample/${page.pageNow-1}/${eChildType}">${page.pageNow-1}</a>
	</c:if>
	</c:if>
		<a href="javascript:;" style="color:#6CF;text-decoration:none;">${page.pageNow}</a>
	<c:if test="${page.pageNow != page.totalPageCount}">
	<c:if test="${page.pageNow+1 != page.totalPageCount}">
			<a href="${pageContext.request.contextPath}/childExample/${page.pageNow+1}/${eChildType}">${page.pageNow+1}</a>
	</c:if>
		<a href="${pageContext.request.contextPath}/childExample/${page.totalPageCount}/${eChildType}">${page.totalPageCount}</a>
	    <a  class="next" href="${pageContext.request.contextPath}/childExample/${page.pageNow+1}/${eChildType}">»</a>
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