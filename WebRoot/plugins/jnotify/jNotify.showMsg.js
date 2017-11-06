/*create by lj*/
/*操作提示*/
	function showMsg_jSuccess(){
			jSuccess("操作成功！",{
				    autoHide : true,       // 是否自动隐藏提示条 
					clickOverlay : false,  // 是否单击遮罩层才关闭提示条 
					MinWidth : 80,        // 最小宽度 
					TimeShown : 1500,      // 显示时间：毫秒 
					ShowTimeEffect : 200,  // 显示到页面上所需时间：毫秒 
					HideTimeEffect : 500,  // 从页面上消失所需时间：毫秒 
					LongTrip : 15,         // 当提示条显示和隐藏时的位移 
					HorizontalPosition : "center",// 水平位置:left, center, right 
					VerticalPosition : "top",// 垂直位置：top, center, bottom 
					ShowOverlay : false,     // 是否显示遮罩层 
					ColorOverlay : "#000",  // 设置遮罩层的颜色 
					OpacityOverlay : 0.3,   // 设置遮罩层的透明度 

				});
		}
	
	/*操作之后延迟1.8s,刷新页面*/
	function refreshPage(page){
		setTimeout(function abc(){
			nextPage(page);
		},1800);
	}
	
	
	/*操作提醒*/
	function showMsg_jNotify(){
		jNotify("操作提醒!",{
			HorizontalPosition : "center",
			VerticalPosition : "center",

		});
	}
	
	/*多元提示*/
	function twoMiaoChufa(){
		jSuccess("操作成功，2秒后显示下一个提示框!",{
			TimeShown : 2000,
			//2秒后触发以下方法
			onClosed:function(){
				jNotify("注意：点击这里显示下一个提示框",{
					VerticalPosition : 'top',
					autoHide : false,
				});

			},

			//同时触发消息框
			// onCompleted:function(){
			// 	jNotify("测试",{
			// 		VerticalPosition : 'top',
			// 		autoHide : false,
			// 	});
			// }


		});
	}
	
	/*操作失败提示*/
	function showMsg_jError(){
		jError("操作失败",{

			HorizontalPosition : "center",

			VerticalPosition : "center",

		});
	}
	