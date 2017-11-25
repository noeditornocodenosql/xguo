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
    <script src="${pageContext.request.contextPath}/templets/Scripts/inner.min.js"></script>
</head>

<body>
<header  style="height: 632px;">
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
        <div class="btnList">
            <div class="link btn-group ml">
        	    <a href="${pageContext.request.contextPath}/cases/1" class="btn btn-default" title="合肥新果文化传播有限公司">作品集</a>
            </div>
             <div class="link btn-group">
            <c:if test="${page.pageNow == 1}">
 				  <a class="btn btn-default"><span class="glyphicon glyphicon-arrow-left"></span>FIRST</a>
				</c:if>
           	<c:if test="${page.pageNow != 1}">
 				  <a href="${pageContext.request.contextPath}/cases/detail/next/${example.eChildType}/${page.pageNow-1}" class="btn btn-default"><span class="glyphicon glyphicon-arrow-left"></span>PREV</a>
				</c:if>
            </div>
           <div class="link btn-group">
  		 <c:if test="${page.pageNow != page.totalCount}">
  		 	    <a href="${pageContext.request.contextPath}/cases/detail/next/${example.eChildType}/${page.pageNow+1}" class="btn btn-default">NEXT<span class="glyphicon glyphicon-arrow-right"></span></a>
  		 </c:if>
  		  <c:if test="${page.pageNow == page.totalCount}">
  		 	    <a class="btn btn-default">END<span class="glyphicon glyphicon-arrow-right"></span></a>
  		 </c:if>
            </div> 
        </div>
    </section>
    
    <section class="caseshow content">
        
        <div class="caption">项目介绍</div>
        <div class="words">
        	<h1>[ ${example.eProjectName } ]</h1>
        	<span class="rel">${example.eLabel }<u>•</u>${example.eLabel1 }</span>
            
            <dl class="tags">
              <dt>案例标签<span class="glyphicon glyphicon-tag"></span></dt>
              <dd><a>${example.eLabel1 }</a></dd>
              <dd><a>${example.eLabel2 }</a></dd>
            </dl>
        </div>
        <div class="caption">设计欣赏</div>
     <div class="demo">
        <iframe height=498 width=1000 src="${example.eURL }" frameborder=0 allowfullscreen></iframe>
	 </div>

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