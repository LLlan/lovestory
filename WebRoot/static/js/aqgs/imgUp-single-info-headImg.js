$(function(){
	var delParent;
	var defaults = {
		fileType         : ["jpg","png","bmp","jpeg"],   // 上传文件的类型
		fileSize         : 1024 * 1024 * 20                  // 上传文件的大小 2M
	};
		/*点击图片的文本框*/
	$(".file").change(function(){	 
		var idFile = $(this).attr("id");
		var file = document.getElementById(idFile);
		
		//获取宽高
		var _URL = window.URL || window.webkitURL;
        var img;
        img = new Image();
        img.onload = function () {
        	var width=this.width;
        	var height=this.height;
        	abc(width,height);
            //alert(this.width + " " + this.height);
        };
        img.src = _URL.createObjectURL(file.files[0]);
		
        function abc(a,b){
        	 var num=a/b;
             //if(parseFloat(num)<=1.4 && parseFloat(num)>=1){
             	var imgContainer = $(this).parents(".z_photo"); //存放图片的父亲元素
         		var fileList = file.files; //获取的图片文件
         		var input = $(this).parent();//文本框的父亲元素
         		var imgArr = [];
         		//遍历得到的图片文件
         		var numUp = imgContainer.find(".up-section").length;
         		var totalNum = numUp + fileList.length;  //总的数量
         		//console.log("fileList111:"+fileList.length)
         		if(fileList.length > 1|| totalNum > 1 ){
         			alert("上传图片数目不可以超过1个，请重新选择");  //一次选择上传超过5个 或者是已经上传和这次上传的到的总数也不可以超过5个
         		}
         		else if(numUp < 1){
         			fileList = validateUp(fileList);
         			for(var i = 0;i<fileList.length;i++){
         			 var imgUrl = window.URL.createObjectURL(fileList[i]);
         			     imgArr.push(imgUrl);
         		
         		     var $img = $(".add-img11");
         		         $img.attr("src",imgArr[i]);
         		   
         		   }
         		}
         		setTimeout(function(){
                      $(".up-section").removeClass("loading");
         		 	 $(".up-img").removeClass("up-opcity");
         		 },450);
         		 numUp = imgContainer.find(".up-section").length;
         		if(numUp >= 1){
         			$(this).parent().hide();
         		}
         		
         		 //自己定义的方法
         		 var form = new FormData(document.getElementById("headImgForm"));
         	     $.ajax({
         	         url:"api/member/saveHeadImg.do",
         	         type:"post",
         	         data:form,
         	         dataType:"json",
         	         processData:false,
         	         contentType:false,
         	         success:function(data){
         	        	 console.log("保存头像成功")
         	         }
         	    });
             	
             	
     		/*}else{
     			alert("上传照片的宽高比例应为1-1.4之间,请重新选择符合规格的照片")
     		}*/
        }
        
       

		
        
		
		
	     
	});
	
	
   
   /* $(".z_photo").delegate(".close-upimg","click",function(){
     	  $(".works-mask").show();
     	  delParent = $(this).parent();
	});*/
		
	$(".wsdel-ok").click(function(){
		$(".works-mask").hide();
		/*var numUp = delParent.siblings().length;
		if(numUp < 2){
			delParent.parent().find(".z_file").show();
		}
		 delParent.remove();*/
	});
	
	$(".wsdel-no").click(function(){
		$(".works-mask").hide();
	});
		
		function validateUp(files){
			var arrFiles = [];//替换的文件数组
			for(var i = 0, file; file = files[i]; i++){
				//获取文件上传的后缀名
				var newStr = file.name.split("").reverse().join("");
				if(newStr.split(".")[0] != null){
						var type = newStr.split(".")[0].split("").reverse().join("");
						type = type.toLowerCase();
						console.log(type+"===type===");
						if(jQuery.inArray(type, defaults.fileType) > -1){
							// 类型符合，可以上传
							if (file.size >= defaults.fileSize) {
								//alert(file.size);
								alert('您这个"'+ file.name +'"文件尺寸过大无法上传');	
							} else {
								// 在这里需要判断当前所有文件中
								arrFiles.push(file);	
								
							}
						}else{
							alert('您这个"'+ file.name +'"上传类型不符合');	
						}
					}else{
						alert('您这个"'+ file.name +'"没有类型, 无法识别');	
					}
			}
			return arrFiles;
		}
		
	
	
})
