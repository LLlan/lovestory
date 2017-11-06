/*
 * 页面消息框
 */

/**
 * 增加一个右下角弹出消息
 * @param title 消息标题
 * @param msgContent 消息内容
 */
function msg_AddMsg(title,msgContent){
	var msgBoxPanel=$("#msgBoxPanel",$(window.top.document.body));
	if(title==""){title="操作信息";}
	var messageStr="<div class=\"newnotice\">\n"
					+"    <p>\n"
					+"  	  <span class=\"msgImg\"></span>\n"
					+"        <span class=\"title\">"+title+"</span>\n"
		    		+"    </p>\n"
					+"    <div class=\"noticecon\">"+msgContent+"</div>\n"
					+"</div>\n";
	msgBoxPanel.append(messageStr);
	$(".newnotice:last",msgBoxPanel).slideDown("slow",function(){
		window.setTimeout(function(){
			$("input:first",msgBoxPanel).trigger("change");
		},2000);
	});
}

/**
 * 在主页右框架 显示提示消息
 * @param tips 提示信息
 * @param topx 距框架顶部的高度
 * @param time 延时几秒隐藏
 */
function showTips(tips,topx,time){
  var windowWidth  = $(document).width();
  var tipsDiv = '<div class="tipsClass">' + tips + '</div>';
  $("body").append( tipsDiv );
  $("div.tipsClass").css({
      'top'       : topx + 'px',
      'left'      : (windowWidth/2) - ((tips.length*16+20)/2)+'px',
      'position'  : 'absolute',
      'padding'   : '10px 10px',
      'background': '#00a600',
      'font-size' : 16 + 'px',
      'margin'    : '0 auto',
      'text-align': 'center',
      'width'     : 'auto',
      'color'     : '#fff',
      'font-weight' : 'bold',
      'z-index' : '999',
      'opacity'   : '0.9'
  }).fadeIn().delay(time*1000).fadeOut(function(){$(this).remove();});
}

$(document).ready(function(){
	var divTipsTop = 0;
	$(window).scroll(function(){
		var scrollT = $(this).scrollTop();
		var divTips = $("div.tipsClass");
		if(divTipsTop==0){divTipsTop=parseInt(divTips.css("top"));}
        divTips.css({'top':(divTipsTop+scrollT)+'px'});
    }).resize(function(){    
        var divTips = $("div.tipsClass");
    	divTips.css({'left': ($(document).width()/2) - (divTips.width()/2)+'px'});
    });
});