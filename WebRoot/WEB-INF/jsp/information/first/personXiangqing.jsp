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
    <title>${pd.xingming }</title>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="static/css/aqgs/commen.css"/>
    <link rel="stylesheet" href="static/css/aqgs/style.css">
    <link rel="stylesheet" href="static/css/aqgs/personXiangqing.css">
    <link rel="stylesheet" href="static/PhotoSwipe-master/dist/photoswipe.css">
    <link rel="stylesheet" href="static/PhotoSwipe-master/dist/default-skin/default-skin.css">
    <script src="static/js/aqgs/jquery-2.1.4.js"></script>
    <script src="static/js/aqgs/fastclick.js"></script>
    <script src="static/PhotoSwipe-master/dist/photoswipe.min.js"></script>
    <script src="static/PhotoSwipe-master/dist/photoswipe-ui-default.min.js"></script>
	<script type="text/javascript" src="static/js/aqgs/navbarscroll.js"></script>
    <style>
        .my-gallery img {
				position: absolute;
				top: 50%;
				left: 50%;
				min-height: 100%;
				margin-top: -44px;
				margin-left: -44px;
			}
			
			.my-gallery figcaption {
				display: none;
			}
			
			.my-gallery figure {
				width: 88px;
				height: 88px;
				margin: 0;
				display: inline-block;
				overflow: hidden;
				position: relative;
			}
			
			.my-gallery {
				height: 88px;
				width: 100%;
				white-space: nowrap;
			}
			
			.wrapper {
				width: 100%;
				overflow-x: auto;
			}
			
			 ::-webkit-scrollbar {
				width: 0;
				height: 0;
			}
    </style>
    <script type="text/javascript">
			window.onload = function() {
				var bgPicx2 = document.getElementsByClassName("bgPicx2");
				for(var bgPicx2num1 = 0;bgPicx2num1<bgPicx2.length;bgPicx2num1++){
					var bgPicx2num1warr = new Array();
					bgPicx2num1warr.push(bgPicx2[bgPicx2num1].width);
					
					var bgPicx2num1harr = new Array();
					bgPicx2num1harr.push(bgPicx2[bgPicx2num1].height);
	
					if(bgPicx2num1warr[0] <= bgPicx2num1harr[0]) {
						bgPicx2[bgPicx2num1].style.width = 100 + "%";
						bgPicx2[bgPicx2num1].style.height = "auto";
					} else {
						bgPicx2[bgPicx2num1].style.width = "auto";   
						bgPicx2[bgPicx2num1].style.height = 100 + "%"; 
						bgPicx2[bgPicx2num1].style.left = 50 + "%";
						bgPicx2[bgPicx2num1].style.marginLeft = -bgPicx2[bgPicx2num1].width / 2 + "px"
					}
				}


				var wrapperpic = document.getElementsByClassName("wrapperpic");
				for(var wrapperpicnum1 = 0;wrapperpicnum1<wrapperpic.length;wrapperpicnum1++){
					var wrapperpicnum1warr = new Array();
					wrapperpicnum1warr.push(wrapperpic[wrapperpicnum1].width);
					
					var wrapperpicnum1harr = new Array();
					wrapperpicnum1harr.push(wrapperpic[wrapperpicnum1].height);
	
					if(wrapperpicnum1warr[0] <= wrapperpicnum1harr[0]) {
						wrapperpic[wrapperpicnum1].style.width = 100 + "%";
						wrapperpic[wrapperpicnum1].style.height = "auto";
					} else {
						wrapperpic[wrapperpicnum1].style.width = "auto";   
						wrapperpic[wrapperpicnum1].style.height = 100 + "%"; 
						wrapperpic[wrapperpicnum1].style.left = 50 + "%";
						wrapperpic[wrapperpicnum1].style.marginLeft = -wrapperpic[wrapperpicnum1].width / 2 + "px"
					}
				}



			}
		</script>
</head>
<body ontouchstart>
<div class="wy-header header">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"></a></div>
    <div class="wy-header-title">${pd.xingming }</div>
</div>
<div class="bgPic">
	<div class="bgPicx">
    <c:choose>
		<c:when test="${pd.headImg=='' || pd.headImg==null }">
			<c:if test="${pd.sex=='1' }"><img src="static/images/aqgs/nan1-1.png" alt=""/></c:if>
			<c:if test="${pd.sex=='2' }"><img src="static/images/aqgs/nv1-1.png" alt=""/></c:if>
		</c:when>
		<c:otherwise><img src="<%=basePath %>${pd.headImg }" alt="" class="bgPicx2" /></c:otherwise>
	</c:choose>
	</div>
    <p>${pd.xingming }</p>
</div>
<div class="wrapper">
    <div class="scroller" style="width:100%;height:88px;">
        <div class="clearfix my-gallery"  itemscope itemtype="http://schema.org/ImageGallery">
            <c:forEach items="${pd.imgPathList }" var="va">
            	<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
            		<a href="<%=basePath %>${va.imgPath}"  itemprop="contentUrl" data-size="1024x1024">
            			<img src="<%=basePath %>${va.imgPath}" alt=""  itemprop="thumbnail" alt="Image description"  class="wrapperpic"/>
            		</a>
            	</figure>
        	</c:forEach>
        </div>
        <!-- Root element of PhotoSwipe. Must have class pswp. -->
    </div>
</div>
<div class="baseBox">
    <p>基本信息</p>
    <div>
        <a href="javascript:void(0)"><c:if test="${pd.sex=='1' }">男</c:if><c:if test="${pd.sex=='2' }">女</c:if>/${pd.age }岁</a>
        <a href="javascript:void(0)">${pd.shengao }cm</a>
        <a href="javascript:void(0)">${pd.tizhong }kg</a>
        <a href="javascript:void(0)">${pd.xueli }</a>
        <a href="javascript:void(0)">${pd.isHun }</a>
    </div>
</div>
<div class="baseBox">
    <p>理想对象</p>
    <div style="font-size: 14px;padding-top:15px;padding-bottom:25px;">${not empty pd.xingqu?pd.xingqu:"无" }</div>
</div>
<div class="baseBox">
    <p>自我介绍</p>
    <div style="font-size: 14px;padding-top:15px;padding-bottom:25px;">${not empty pd.ziwojieshao?pd.ziwojieshao:"无" }</div>
</div>
<div class="baseBox">
    <p>择偶标准</p>
    <div style="font-size: 14px;padding-top:15px;"><span>年　　龄:　</span>${not empty pd.zo_age?pd.zo_age:"无"}</div>
    <div style="font-size: 14px;"><span>身　　高:　</span>${not empty pd.zo_shengao?pd.zo_shengao:"无" }</div>
    <div style="font-size: 14px;"><span>学　　历:　</span>${not empty pd.zo_xueli?pd.zo_xueli:"无" }</div>
    <div style="font-size: 14px;"><span>婚姻状况:　</span>${not empty pd.zo_isHun?pd.zo_isHun:"无" }</div>
</div>
<div class="baseBox">
    <p>其他信息</p>
    <div style="font-size: 14px;padding-top:15px;"><span>民　　　　族:　</span>${not empty pd.minzu?pd.minzu:"无"}</div>
    <div style="font-size: 14px;"><span>户口所在　地:　</span>${not empty pd.hukouszd?pd.hukouszd:"无" }</div> 
    <div style="font-size: 14px;"><span>现　居住　地:　</span>${not empty pd.juzhudi?pd.juzhudi:"无" }</div> 
    <div style="font-size: 14px;"><span>职　　　　业:　</span>${not empty pd.zhiye?pd.zhiye:"无" }</div> 
    <div style="font-size: 14px;"><span>年　　　　薪:　</span>${not empty pd.nianxin?pd.nianxin:"无" }</div> 
    <div style="font-size: 14px;"><span>出　生日　期:　</span>${not empty pd.birthday?pd.birthday:"无" }</div>
    <div style="font-size: 14px;"><span>是否独生子女:　</span>${not empty pd.isOnly?pd.isOnly:"无" }</div>
    <div style="font-size: 14px;"><span>毕　业院　校:　</span>${not empty pd.biyeyx?pd.biyeyx:"无" }</div>
    <div style="font-size: 14px;"><span>房　车情　况:　</span>${not empty pd.isFngCar?pd.isFngCar:"无" }</div>
    <div style="font-size: 14px;"><span>父母健在情况:　</span>${not empty pd.isParent?pd.isParent:"无" }</div>
</div>
<%--
<div class="baseBox">
    <p>联系方式</p>
    <c:choose>
		<c:when test="${member_type=='1' }">
    		<div style="font-size: 14px;padding-top:15px;"><span>手机号:　</span>${not empty pd.link_phone?pd.link_phone:"无" }</div>
    		<div style="font-size: 14px;"><span>微　信:　</span>${not empty pd.weixin?pd.weixin:"无" }</div>
    		<div style="font-size: 14px;"><span>Q　 Q:　 </span>${not empty pd.qq?pd.qq:"无" }</div>
    		<div style="font-size: 14px;"><span>Email :　 </span>${not empty pd.email?pd.email:"无" }</div>
    	</c:when>
		<c:otherwise>
			<div style="font-size: 14px;padding-top:15px;">
				<a href="javascript:void(0)" style="padding: 0;background-color: #ffffff;margin-top: 0;color: #e8275e;font-size: 15px;text-decoration: underline;" class="connect1" onclick="ruhui();">点击我,查看联系方式</a>
			</div>
		</c:otherwise>
	</c:choose>
</div>
--%>
<div class="mask"></div>
<div class="bigImg"></div>
<!--<div class="connectBox">-->
    <!--<p>升级为会员即可和更多异性互动</p>-->
    <!--<p><a href="javascript:void(0)" class="cancel">取消</a><a href="static/contact/contact.html" class="sure">前往</a></p>-->
<!--</div>-->
<div class="bg_k">
    <div class="bg_1">升级为会员即可和更多异性互动</div>
    <div class="bg_2">
        <a class="cancel" href="javascript:void(0);">取消</a>
        <a class="call" href="static/contact/contact.html">前往</a>
    </div>
</div>
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
<script src="static/layer/mobile/layer.js"></script>
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
//缴费部分
function ruhui(){
	var session="${sessionMember.identity}";
	console.log(session);
	if(session!="" && session!=undefined){
		layer.open({
 		      content:'您还未缴过入会费用,点击确定去缴费(一次缴费永久有效)'
 		      ,btn: ['确定', '退出']
		  	  ,shadeClose:false
 		      ,yes: function(index){
 		    	 	var appid = "wx319d00741c369e14";
 		    	 	var backUri = "http://www.0898yzzx.com/lovestory/api/wxpay/pay";
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
		           layer.close(index);
 		      }
		  });
	}else {
		layer.open({
 		      content:'您还没有登录,点击确定去登陆'
 		      ,btn: ['确定', '退出']
		  	  ,shadeClose:false
 		      ,yes: function(index){
 		    	 window.location.href="api/member/toLogin.do";
 		      }
		  	  ,no: function(index){
		           layer.close(index);
 		      }
		  });
	}
}
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