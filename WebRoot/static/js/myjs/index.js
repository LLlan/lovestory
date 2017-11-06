	$(function() {
			if (typeof ($.cookie('menusf')) == "undefined") {
				$("#menusf").attr("checked", true);
				$("#sidebar").attr("class", "menu-min");
			} else {
				$("#sidebar").attr("class", "");
			}
			
			$("#sidebar-collapse").click(function(){
				//获取当前窗口的宽度(包含滚动条)
				//alert(window.innerWidth);
				
			});
		});
		function cmainFrame(){
			var hmain = document.getElementById("mainFrame");
			//获取整个网页窗口的高度
			var bheight = document.documentElement.clientHeight;
			hmain .style.width = '100%';
			hmain .style.height = (bheight  - 51) + 'px';
			var bkbgjz = document.getElementById("bkbgjz");
			bkbgjz.style.height = (bheight  - 41) + 'px';
			
		}
		cmainFrame();
		window.onresize=function(){  
			cmainFrame();
		};
		jzts();
		
		