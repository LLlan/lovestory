<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>我的</title>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="static/css/aqgs/commen.css"/>
    <link rel="stylesheet" href="static/css/aqgs/style.css">
    <link rel="stylesheet" href="static/css/aqgs/personXiangqing.css">
    <link rel="stylesheet" href="static/css/aqgs/weui.css">
    <link rel="stylesheet" href="static/css/aqgs/jquery-weui.css">
    <link rel="stylesheet" href="static/css/aqgs/search.css">
    <link rel="stylesheet" href="static/PhotoSwipe-master/dist/photoswipe.css">
    <link rel="stylesheet" href="static/PhotoSwipe-master/dist/default-skin/default-skin.css">
    <script src="static/js/aqgs/jquery-2.1.4.js"></script>
    <script src="static/js/aqgs/fastclick.js"></script>
     <script src="static/PhotoSwipe-master/dist/photoswipe.min.js"></script>
    <script src="static/PhotoSwipe-master/dist/photoswipe-ui-default.min.js"></script>
	<script type="text/javascript" src="static/js/aqgs/navbarscroll.js"></script>
	
	<script type="text/javascript" src="static/js/aqgs/navbarscroll.js"></script>
	<script src="static/layer/mobile/layer.js"></script>
    <style>
        .weui-tabbar__item.weui-bar__item--on .weui-tabbar__label {
            color: #E8275E;
        }
        .wy-header-title{
            position: relative;
        }
        .wy-header-title>a{
            position: absolute;right:-30px;;top:0;color:#fff;font-size: 16px;;
        }
        img{padding:0;}
        .weui-tabbar__item.weui-bar__item--on .weui-tabbar__label {
            color: #E8275E;
        }
        .abcde {
		    width: 100%;
		    height: 32px;
		    line-height: 32px;
		    font-size: 16px;
		    color: #fff;
		    text-align: center;
		    position: absolute;
		    left: 2px;
		}
		.my-gallery img {
            width: 100%;
            height: 88px;
        }
        .my-gallery figcaption {
            display: none;
        }
        .my-gallery figure{
            width:88px;height:88px;margin:0;display:inline-block;
        }
        .my-gallery{
            height:88px;
            width:100%;
            white-space: nowrap;
        }
        .wrapper{
            width:100%;
            overflow-x: auto;
        }
        ::-webkit-scrollbar{width:0;height: 0;}
    </style>
</head>
<body ontouchstart>
<div class="wy-header header">
    <div class="wy-header-title">我的</div>
</div>
<div class="bgPic">
	<c:choose>
		<c:when test="${pd.headImg=='' || pd.headImg==null }">
			<%--
			<c:if test="${pd.sex=='1' }"><img src="static/images/aqgs/nan1-1.png" alt=""/></c:if>
			<c:if test="${pd.sex=='2' }"><img src="static/images/aqgs/nv1-1.png" alt=""/></c:if>
			 --%>
			<img src="static/images/aqgs/nv1-1.png" alt=""/>
		</c:when>
		<c:otherwise><img src="<%=basePath %>${pd.headImg }" alt=""/></c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${pd.identity=='1' }">
			<c:choose>
		    	<c:when test="${pd.xingming=='' || pd.xingming==null  }"><p><a class="abcde" href="api/member/gerenziliao.do">点击去完善信息</a></p></c:when>
		    	<c:otherwise><p>${pd.xingming}</p></c:otherwise>
		    </c:choose>
		</c:when>
		<c:otherwise>
			<c:choose>
		    	<c:when test="${pd.nicheng=='' || pd.nicheng==null  }"><p><a class="abcde" href="api/member/gerenziliao.do">点击去完善信息</a></p></c:when>
		    	<c:otherwise><p>${pd.nicheng}</p></c:otherwise>
		    </c:choose>
		</c:otherwise>
	</c:choose>
    
</div>
<c:if test="${pd.identity=='1' }">
	<div class="wrapper">
	<c:choose>
		<c:when test="${empty pd.imgPathList }">
			<div>
				<a href="<%=basePath %>api/member/toZpq.do?member_id=${pd.member_id}" style="margin-left: 33%;color: #e80d0d;font-size: 16px;border-bottom: 1px solid red;">点击去设置照片墙</a>
			</div>
		</c:when>
		<c:otherwise>
			<div class="wrapper wrapper01" id="wrapper01">
				<div class="scroller" style="width:100%;height:88px;">
			        <div class="clearfix my-gallery"  itemscope itemtype="http://schema.org/ImageGallery">
			            <c:forEach items="${pd.imgPathList }" var="va">
			            	<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
			            		<a href="<%=basePath %>${va.imgPath}"  itemprop="contentUrl" data-size="1024x1024">
			            			<img src="<%=basePath %>${va.imgPath}" alt=""  itemprop="thumbnail" alt="Image description" />
			            		</a>
			            	</figure>
			        	</c:forEach>
			        </div>
			        <!-- Root element of PhotoSwipe. Must have class pswp. -->
			    </div>
			</div>
		</c:otherwise>
	</c:choose>
	</div>
</c:if>
<div class="searchBox">
    <a href="api/member/gerenziliao.do"><p>个人资料<span class="per"></span></p></a>
    <a href="api/member/myerweima.do?member_id=${pd.member_id }"><p>我的二维码<span class="two"></span></p></a>
    <a href="api/member/toTuiJian.do?tuijian_user_id=${pd.member_id }&state=0"><p>推荐人数<span class="tuijian"></span></p></a>
    <a href="api/member/toMainYongJin.do?member_id=${pd.member_id }"><p>我的佣金<span class="yongjin"></span></p></a>
</div>
<a href="api/member/logout.do" class="tuichu">退出账号</a>

<!--底部导航-->
<%@ include file="../buttom.jsp"%>
<div class="mask"></div>
<div class="bigImg"></div>
<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">

    <!-- Background of PhotoSwipe.
         It's a separate element, as animating opacity is faster than rgba(). -->
    <div class="pswp__bg"></div>

    <!-- Slides wrapper with overflow:hidden. -->
    <div class="pswp__scroll-wrap">

        <!-- Container that holds slides. PhotoSwipe keeps only 3 slides in DOM to save memory. -->
        <!-- don't modify these 3 pswp__item elements, data is added later on. -->
        <div class="pswp__container">
            <div class="pswp__item"></div>
            <div class="pswp__item"></div>
            <div class="pswp__item"></div>
        </div>

        <!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
        <div class="pswp__ui pswp__ui--hidden">

            <div class="pswp__top-bar">

                <!--  Controls are self-explanatory. Order can be changed. -->

                <div class="pswp__counter"></div>

                <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>

                <!--<button class="pswp__button pswp__button--share" title="Share"></button>-->

                <!--<button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>-->

                <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>

                <!-- Preloader demo https://codepen.io/dimsemenov/pen/yyBWoR -->
                <!-- element will get class pswp__preloader--active when preloader is running -->
                <div class="pswp__preloader">
                    <div class="pswp__preloader__icn">
                        <div class="pswp__preloader__cut">
                            <div class="pswp__preloader__donut"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                <div class="pswp__share-tooltip"></div>
            </div>

            <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)">
            </button>

            <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)">
            </button>

            <div class="pswp__caption">
                <div class="pswp__caption__center"></div>
            </div>

        </div>

    </div>

</div>
<script type="text/javascript" src="static/js/aqgs/iscroll.js"></script>
<script type="text/javascript">
var id="${pd.member_id}";
		$(function(){
			
			abc();
			//判断信息是否完善
			$.post('api/member/isCompleteInfo.do',{},function(data){
	        	if(data.respCode=="00"){
		            layer.open({
        	 		      content:'您的信息还未完善,点击确定去完善信息'
        	 		      ,btn: ['确定', '退出']
        			  	  ,shadeClose:false
        			  	  ,closeBtn:0
        	 		      ,yes: function(index){
        	 		    	 window.location.href="api/member/gerenziliao.do";	
        	 		      }
			              ,no: function(index){
	     			           //window.location.href="api/member/index.do";
	     			           layer.close(index);
   		      	  		  }
        			});
	        	}else if(data.respCode=="02"){
	        		layer.open({
      	 		      content:data.respMsg
      	 		      ,btn: ['确定', '退出']
      			  	  ,shadeClose:false
      			  	  ,closeBtn:0
      	 		      ,yes: function(index){
      	 		    	 window.location.href="api/member/gerenziliao.do";	
      	 		      }
	        		 ,no: function(index){
     			          //window.location.href="api/member/index.do";
     			          layer.close(index);
   		      	     }
      			});
	        	}else if(data.respCode=="03"){
	        		layer.open({
      	 		      content:data.respMsg
      	 		      ,btn: ['确定', '退出']
      			  	  ,shadeClose:false
      			  	  ,closeBtn:0
      	 		      ,yes: function(index){
      	 		    	 window.location.href="api/member/gerenziliao.do";	
      	 		      }
	        		  ,no: function(index){
        			       //window.location.href="api/member/index.do";
        			       layer.close(index);
      		      	  }
      			});
	        	}else{
	        		var member_type="${pd.member_type}";
	        		var identity="${pd.identity}";
	        		if(member_type!="1" && identity=="1"){	
	        			layer.open({
	        	 		      content:'您还未缴过入会费用,点击确定去缴费(一次缴费永久有效)'
	        	 		      ,btn: ['确定', '退出']
	        	 		      //,btn: '确定'
	        			  	  ,shadeClose:false
	        			  	  ,closeBtn:0
	        	 		      ,yes: function(index){
	        	 		    	 	var appid = "wx319d00741c369e14";
	        	 		    	 	var backUri = "http://www.bjaqgshlw.com/lovestory/api/wxpay/pay?id="+id;
	        	 		    	 	//var backUri = "http://192.168.1.88:8080/lovestory/api/wxpay/pay?WIDtotal_fee=0.01";
	        						backUri = encodeURIComponent(backUri);
	        						console.log(backUri);
	        						
	        						var url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=" 
	        								+ appid +"&redirect_uri=" + backUri 
	        								+ "&response_type=code&scope=snsapi_base&state=123#wechat_redirect";
	        						//scope 参数视各自需求而定，这里用scope=snsapi_base 不弹出授权页面直接授权目的只获取统一支付接口的openid,scope=snsapi_userinfo弹出授权页面
	        						window.location.href=url;
	        	 		      }
			        		  ,no: function(index){
			        			    //window.location.href="api/member/index.do";
			        			    layer.close(index);
			      		      }
	        			});
	        		}
	        	}
	        });
		});
		//by yym
		function abc(e1){
			$("#t4").addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
		}
</script>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
    $(function(){

        //demo示例一到四 通过lass调取，一句可以搞定，用于页面中可能有多个导航的情况
        $('.wrapper').navbarscroll();

        //demo示例五 通过id调取
        $('#demo05').navbarscroll({
            defaultSelect:6,
            endClickScroll:function(obj){
                console.log(obj.text())
            }
        });
    });
</script>
<script>
    var initPhotoSwipeFromDOM = function(gallerySelector) {

        // parse slide data (url, title, size ...) from DOM elements
        // (children of gallerySelector)
        var parseThumbnailElements = function(el) {
            var thumbElements = el.childNodes,
                    numNodes = thumbElements.length,
                    items = [],
                    figureEl,
                    linkEl,
                    size,
                    item;

            for(var i = 0; i < numNodes; i++) {

                figureEl = thumbElements[i]; // <figure> element

                // include only element nodes
                if(figureEl.nodeType !== 1) {
                    continue;
                }

                linkEl = figureEl.children[0]; // <a> element

                size = linkEl.getAttribute('data-size').split('x');

                // create slide object
                item = {
                    src: linkEl.getAttribute('href'),
                    w: parseInt(size[0], 10),
                    h: parseInt(size[1], 10)
                };



                if(figureEl.children.length > 1) {
                    // <figcaption> content
                    item.title = figureEl.children[1].innerHTML;
                }

                if(linkEl.children.length > 0) {
                    // <img> thumbnail element, retrieving thumbnail url
                    item.msrc = linkEl.children[0].getAttribute('src');
                }

                item.el = figureEl; // save link to element for getThumbBoundsFn
                items.push(item);
            }

            return items;
        };

        // find nearest parent element
        var closest = function closest(el, fn) {
            return el && ( fn(el) ? el : closest(el.parentNode, fn) );
        };

        // triggers when user clicks on thumbnail
        var onThumbnailsClick = function(e) {
            e = e || window.event;
            e.preventDefault ? e.preventDefault() : e.returnValue = false;

            var eTarget = e.target || e.srcElement;

            // find root element of slide
            var clickedListItem = closest(eTarget, function(el) {
                return (el.tagName && el.tagName.toUpperCase() === 'FIGURE');
            });

            if(!clickedListItem) {
                return;
            }

            // find index of clicked item by looping through all child nodes
            // alternatively, you may define index via data- attribute
            var clickedGallery = clickedListItem.parentNode,
                    childNodes = clickedListItem.parentNode.childNodes,
                    numChildNodes = childNodes.length,
                    nodeIndex = 0,
                    index;

            for (var i = 0; i < numChildNodes; i++) {
                if(childNodes[i].nodeType !== 1) {
                    continue;
                }

                if(childNodes[i] === clickedListItem) {
                    index = nodeIndex;
                    break;
                }
                nodeIndex++;
            }



            if(index >= 0) {
                // open PhotoSwipe if valid index found
                openPhotoSwipe( index, clickedGallery );
            }
            return false;
        };

        // parse picture index and gallery index from URL (#&pid=1&gid=2)
        var photoswipeParseHash = function() {
            var hash = window.location.hash.substring(1),
                    params = {};

            if(hash.length < 5) {
                return params;
            }

            var vars = hash.split('&');
            for (var i = 0; i < vars.length; i++) {
                if(!vars[i]) {
                    continue;
                }
                var pair = vars[i].split('=');
                if(pair.length < 2) {
                    continue;
                }
                params[pair[0]] = pair[1];
            }

            if(params.gid) {
                params.gid = parseInt(params.gid, 10);
            }

            return params;
        };

        var openPhotoSwipe = function(index, galleryElement, disableAnimation, fromURL) {
            var pswpElement = document.querySelectorAll('.pswp')[0],
                    gallery,
                    options,
                    items;

            items = parseThumbnailElements(galleryElement);

            // define options (if needed)
            options = {

                // define gallery index (for URL)
                galleryUID: galleryElement.getAttribute('data-pswp-uid'),

                getThumbBoundsFn: function(index) {
                    // See Options -> getThumbBoundsFn section of documentation for more info
                    var thumbnail = items[index].el.getElementsByTagName('img')[0], // find thumbnail
                            pageYScroll = window.pageYOffset || document.documentElement.scrollTop,
                            rect = thumbnail.getBoundingClientRect();

                    return {x:rect.left, y:rect.top + pageYScroll, w:rect.width};
                }

            };

            // PhotoSwipe opened from URL
            if(fromURL) {
                if(options.galleryPIDs) {
                    // parse real index when custom PIDs are used
                    // http://photoswipe.com/documentation/faq.html#custom-pid-in-url
                    for(var j = 0; j < items.length; j++) {
                        if(items[j].pid == index) {
                            options.index = j;
                            break;
                        }
                    }
                } else {
                    // in URL indexes start from 1
                    options.index = parseInt(index, 10) - 1;
                }
            } else {
                options.index = parseInt(index, 10);
            }

            // exit if index not found
            if( isNaN(options.index) ) {
                return;
            }

            if(disableAnimation) {
                options.showAnimationDuration = 0;
            }

            // Pass data to PhotoSwipe and initialize it
            gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
            gallery.init();
        };

        // loop through all gallery elements and bind events
        var galleryElements = document.querySelectorAll( gallerySelector );

        for(var i = 0, l = galleryElements.length; i < l; i++) {
            galleryElements[i].setAttribute('data-pswp-uid', i+1);
            galleryElements[i].onclick = onThumbnailsClick;
        }

        // Parse URL and open gallery if it contains #&pid=3&gid=1
        var hashData = photoswipeParseHash();
        if(hashData.pid && hashData.gid) {
            openPhotoSwipe( hashData.pid ,  galleryElements[ hashData.gid - 1 ], true, true );
        }
    };

    // execute above function
    initPhotoSwipeFromDOM('.my-gallery');
</script>
</body>
</html>