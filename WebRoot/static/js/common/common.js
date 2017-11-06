// JavaScript Document
//判断是否是EMAIL地址
function isMail(eMail) {
	return(new RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(eMail));
}

//判断是否是数字
function fucCheckNUM(NUM) {
	var i,j,strTemp;
	strTemp="0123456789";
	if (NUM.length == 0)
	return false;
	for (i = 0;i < NUM.length;i ++) {
		j = strTemp.indexOf(NUM.charAt(i)); 
		if (j == -1) {
			//说明有字符不是数字
			return false;
		}
	}
	//说明是数字
	return true;
}

function onUser(str) {
	return (/^([a-zA-z_]{1})([\w]*)$/g.test(str));
}
//校验是否全由数字组成 (.[0-9]{2})?$
//^[0-9]+(.[0-9]{2})?$ 
//(?!0+(?:\.0+)?$)(?:[1-9]\d*|0)(?:\.\d{1,2})?$
//
function isDigit(s) {
	//var patrn=/^\d{1,10}|\d{1,10}+(\.\d{1,2})?$/;
	//var patrn= /^(?!0(\\d|\\.0+$|$))\\d+(\\.\\d{1,2})?$/;
	var patrn = /^\d|(\d{1,10}+(\.\d{1,2}))$/;
	if (!patrn.test(s)){
		return false
	}
	return true
}
//校验密码：只能输入6-20个字母、数字、下划线
function isPasswd(s) {
	var patrn=/^(\w){6,20}$/;
	if (!patrn.exec(s)) return false
	return true
}
//校验普通电话、传真号码：可以“+”开头，除数字外，可含有“-”
function isTel(s) {
	//var patrn=/^[+]{0,1}(\d){1,3}[ ]?([-]?(\d){1,12})+$/;
	var patrn=/^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;
	if (!patrn.exec(s)) return false
	return true
}
//校验手机号码：必须以数字开头，除数字外，可含有“-”
function isMobil(s) {
	var patrn=/^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;
	if (!patrn.exec(s)) return false
	return true
}
//校验邮政编码
function isPostalCode(s) {
	//var patrn=/^[a-zA-Z0-9]{3,12}$/;
	var patrn=/^[a-zA-Z0-9 ]{3,12}$/;
	if (!patrn.exec(s)) return false
	return true
}
function setIframeHeight(carentWindow,iframeId){
	var iframe = null,height = 0;
	if(carentWindow == window){
		height = 50;
	}else{
		height = 0;
	}
	if(iframeId){
		iframe = carentWindow.parent.document.getElementById(iframeId);
	} else {
		iframe = carentWindow.parent.document.getElementsByTagName("iframe")[0];
	}
	if(iframe && iframe.name == 'endIframe'){
		$(iframe).height($(carentWindow.document).height()+height);
	}else if(iframe && carentWindow.parent != carentWindow){
		$(iframe).height($(carentWindow.document).height()+height);
		setIframeHeight(carentWindow.parent,iframeId);
	}
}
$(function(){
	$(".stopReleave").click(function(e){
         if ( e && e.stopPropagation ){
	        e.stopPropagation();    
         } else {
	        window.event.cancelBubble = true; 
         }
	});
	// 如果浏览器版本不为IE
	if (!isIE()) {
		$(".selectStaffBtn").css("display", "inline-block");
		$(".selectStaffBtn").css("margin-left", "1px");
		$(".multiSelect").css("display", "inline-block");
		$(".multiSelect").css("margin-left", "1px");
		$(".radioSelect").css("display", "inline-block");
		$(".radioSelect").css("margin-left", "1px");
		$(".mapSelector").css("display", "inline-block");
        $(".mutiBtn").css("display", "inline-block");
	}
});


function isIE() {
    if (!!window.ActiveXObject || "ActiveXObject" in window) {
        return true;
    }
    else {
        return false;
    }
}