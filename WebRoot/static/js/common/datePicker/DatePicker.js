/**
 * 引入日期控件JS
 */

$(document).ready(function() {
	var date=$(".date");//普通日期控件
	if(date.size()>0){	
		date.focus(function(){
			WdatePicker({
				onpicked:function(){this.blur();},
				oncleared:function(){this.blur();},
				errDealMode:1
			});
		});
	}
	
	var yyyyMMddDate=$(".yyyyMMddDate");//yyyyMMdd普通日期控件
	if(yyyyMMddDate.size()>0){	
		yyyyMMddDate.focus(function(){
			WdatePicker({
				onpicked:function(){this.blur();},
				oncleared:function(){this.blur();},
				errDealMode:1, 
				dateFmt:'yyyyMMdd'
			});
		});
	}
	
	var dateTime=$(".dateTime");//普通时间控件
	if(dateTime.size()>0){
		dateTime.focus(function(){
			WdatePicker({
				onpicked:function(){this.blur();},
				oncleared:function(){this.blur();},
				errDealMode:1,
				dateFmt:'yyyy-MM-dd HH:mm:ss'
			});
		});
	}
	
	var historyDateTime=$(".historyDateTime");//历史日期空间
	if(historyDateTime.size()>0){
		historyDateTime.focus(function(){
			WdatePicker({
				onpicked:function(){this.blur();
					if(window.onpicked){
						onpicked();
					}
				},
				oncleared:function(){this.blur();},
				errDealMode:1,
				maxDate: '%y-%M-%d %H:%m:%s', 
				dateFmt:'yyyy-MM-dd HH:mm:ss' 
			});
		});
	}
	
	var dateYear=$(".dateYear");//普通年控件
	if(dateYear.size()>0){
		dateYear.focus(function(){
			WdatePicker({
				onpicked:function(){this.blur();},
				oncleared:function(){this.blur();},
				errDealMode:1,
				dateFmt:'yyyy'
			});
		});
	}
	var dateMonth=$(".dateMonth");//普通月控件
	if(dateMonth.size()>0){
		dateMonth.focus(function(){
			WdatePicker({
				onpicked:function(){this.blur();},
				oncleared:function(){this.blur();},
				errDealMode:1,
				dateFmt:'yyyy-MM',
				maxDate:'%y-%M'
			});
		});
	}
	
	var dateMonthOnly=$(".dateMonthOnly");//只显示月控件
	if(dateMonthOnly.size()>0){
		dateMonthOnly.focus(function(){
			WdatePicker({
				onpicked:function(){this.blur();},
				oncleared:function(){this.blur();},
				errDealMode:1,
				dateFmt:'MM'
			});
		});
	}
	
	var dateDayOnly=$(".dateDayOnly");//只显示日控件
	if(dateDayOnly.size()>0){
		dateDayOnly.focus(function(){
			WdatePicker({
				onpicked:function(){this.blur();},
				oncleared:function(){this.blur();},
				errDealMode:1,
				dateFmt:'dd'
			});
		});
	}
	
	var dateFroms=$(".dateFrom");//日期段开始控件
	if(dateFroms.size()>0){
		dateFroms.each(function(index){
			var dateFrom = $(this);
			var dateToID="dateTo"+index;
			dateFrom.attr("id","dateFrom"+index);
			dateFrom.focus(function(){
				WdatePicker({
					onpicked:function(){this.blur();},
					oncleared:function(){this.blur();},
					errDealMode:1,
					maxDate:'#F{$dp.$D(\''+dateToID+'\')||\'%y-%M-%d\'}'
				});
			});
		});		
	}
	var dateTos=$(".dateTo");//日期段结束控件
	if(dateTos.size()>0){
		dateTos.each(function(index){
			var dateTo = $(this);
			var dateFromID="dateFrom"+index;
			dateTo.attr("id","dateTo"+index);
			dateTo.focus(function(){
				WdatePicker({
					onpicked:function(){this.blur();},
					oncleared:function(){this.blur();},
					errDealMode:1,
					minDate:'#F{$dp.$D(\''+dateFromID+'\')}',
					maxDate:'%y-%M-%d'
				});
			});
		});		
	}
	
	var nolineDateFroms=$(".nolineDateFrom");//日期段开始控件
	if(nolineDateFroms.size()>0){
		nolineDateFroms.each(function(index){
			var dateFrom = $(this);
			var dateToID="nolineDateTo"+index;
			nolineDateFroms.attr("id","nolineDateFrom"+index);
			nolineDateFroms.focus(function(){
				WdatePicker({
					onpicked:function(){this.blur();},
					oncleared:function(){this.blur();},
					errDealMode:1,
					dateFmt:'yyyyMMdd',
					maxDate:'#F{$dp.$D(\''+dateToID+'\')||\'%y%M%d\'}'
				});
			});
		});		
	}
	
	var nolineDateTos=$(".nolineDateTo");//日期段结束控件
	if(nolineDateTos.size()>0){
		nolineDateTos.each(function(index){
			var dateTo = $(this);
			var dateFromID="nolineDateFrom"+index;
			nolineDateTos.attr("id","nolineDateTo"+index);
			nolineDateTos.focus(function(){
				WdatePicker({
					onpicked:function(){this.blur();},
					oncleared:function(){this.blur();},
					errDealMode:1,
					dateFmt:'yyyyMMdd',
					minDate:'#F{$dp.$D(\''+dateFromID+'\')}',
					maxDate:'%y%M%d'
				});
			});
		});		
	}
	
	var dateTimeFroms=$(".dateTimeFrom");//时间段开始控件
	if(dateTimeFroms.size()>0){
		dateTimeFroms.each(function(index){
			var dateTimeFrom = $(this);
			var dateTimeToID="dateTimeTo"+index;
			dateTimeFrom.attr("id","dateTimeFrom"+index);
			dateTimeFrom.focus(function(){
				WdatePicker({
					onpicked:function(){this.blur();},
					oncleared:function(){this.blur();},
					errDealMode:1,
					dateFmt:'yyyy-MM-dd HH:mm:ss',
					maxDate:'#F{$dp.$D(\''+dateTimeToID+'\')||\'%y-%M-%d %H:%m:%s\'}'
				});
			});
		});		
	}
	var dateTimeTos=$(".dateTimeTo");//时间段结束控件
	if(dateTimeTos.size()>0){
		dateTimeTos.each(function(index){
			var dateTimeTo = $(this);
			var dateTimeFromID="dateTimeFrom"+index;
			dateTimeTo.attr("id","dateTimeTo"+index);
			dateTimeTo.focus(function(){
				WdatePicker({
					onpicked:function(){this.blur();},
					oncleared:function(){this.blur();},
					errDealMode:1,
					dateFmt:'yyyy-MM-dd HH:mm:ss',
					minDate:'#F{$dp.$D(\''+dateTimeFromID+'\')}',
					maxDate:'%y-%M-%d %H:%m:%s'
				});
			});
		});		
	}
	
	var dateMinuteFroms=$(".dateMinuteFrom");//时间段开始控件(精确到分钟)
	if(dateMinuteFroms.size()>0){
		dateMinuteFroms.each(function(index){
			var dateTimeFrom = $(this);
			var dateTimeToID="dateMinuteTo"+index;
			dateTimeFrom.attr("id","dateMinuteFrom"+index);
			dateTimeFrom.focus(function(){
				WdatePicker({
					onpicked:function(){this.blur();},
					oncleared:function(){this.blur();},
					errDealMode:1,
					dateFmt:'yyyy-MM-dd HH:mm',
					maxDate:'#F{$dp.$D(\''+dateTimeToID+'\')||\'%y-%M-%d %H:%m\'}'
				});
			});
		});		
	}
	
	var dateMinuteTos=$(".dateMinuteTo");//时间段结束控件
	if(dateMinuteTos.size()>0){
		dateMinuteTos.each(function(index){
			var dateTimeTo = $(this);
			var dateTimeFromID="dateMinuteFrom"+index;
			dateTimeTo.attr("id","dateMinuteTo"+index);
			dateTimeTo.focus(function(){
				WdatePicker({
					onpicked:function(){this.blur();},
					oncleared:function(){this.blur();},
					errDealMode:1,
					dateFmt:'yyyy-MM-dd HH:mm',
					minDate:'#F{$dp.$D(\''+dateTimeFromID+'\')}',
					maxDate:'%y-%M-%d %H:%m'
				});
			});
		});		
	}
	
	//可选择今天以后的日期控件
	var futureDateMinuteFroms=$(".futureDateMinuteFrom");//时间段开始控件(精确到分钟)
	if(futureDateMinuteFroms.size()>0){
		futureDateMinuteFroms.each(function(index){
			var futureDateMinuteFrom = $(this);
			var dateTimeToID="futureDateMinuteTo"+index;
			futureDateMinuteFrom.attr("id","futureDateMinuteFrom"+index);
			futureDateMinuteFrom.focus(function(){
				WdatePicker({
					onpicked:function(){this.blur();},
					oncleared:function(){this.blur();},
					errDealMode:1,
					dateFmt:'yyyy-MM-dd HH:mm',
					maxDate:'#F{$dp.$D(\''+dateTimeToID+'\')}'
				});
			});
		});		
	}
	
	var futureDateMinuteTos=$(".futureDateMinuteTo");//时间段结束控件
	if(futureDateMinuteTos.size()>0){
		futureDateMinuteTos.each(function(index){
			var futureDateMinuteTo = $(this);
			var dateTimeFromID="futureDateMinuteFrom"+index;
			futureDateMinuteTo.attr("id","futureDateMinuteTo"+index);
			futureDateMinuteTo.focus(function(){
				WdatePicker({
					onpicked:function(){this.blur();},
					oncleared:function(){this.blur();},
					errDealMode:1,
					dateFmt:'yyyy-MM-dd HH:mm',
					minDate:'#F{$dp.$D(\''+dateTimeFromID+'\')}'
				});
			});
		});		
	}
	
	//add by hzy
	var dateTimeFroms2=$(".dateTimeFrom2");//时间段开始控件
	if(dateTimeFroms2.size()>0){
		dateTimeFroms2.each(function(index){
			var dateTimeFrom = $(this);
			var dateTimeToID="dateTimeTo2"+index;
			dateTimeFrom.attr("id","dateTimeFrom2"+index);
			dateTimeFrom.focus(function(){
				WdatePicker({
					onpicked:function(){this.blur();},
					oncleared:function(){this.blur();},
					errDealMode:1,
					dateFmt:dateTimeFrom.data('format')
				});
			});
		});		
	}
	var dateTimeTos2=$(".dateTimeTo2");//时间段结束控件
	if(dateTimeTos2.size()>0){
		dateTimeTos2.each(function(index){
			var dateTimeTo = $(this);
			var dateTimeFromID="dateTimeFrom2"+index;
			dateTimeTo.attr("id","dateTimeTo2"+index);
			dateTimeTo.focus(function(){
				WdatePicker({
					onpicked:function(){this.blur();},
					oncleared:function(){this.blur();},
					errDealMode:1,
					dateFmt:dateTimeTo.data('format'),
					minDate:'#F{$dp.$D(\''+dateTimeFromID+'\')}'
				});
			});
		});		
	}
	
	
	
	
	var dateYearFroms=$(".dateYearFrom");//年开始控件
	if(dateYearFroms.size()>0){
		dateYearFroms.each(function(index){
			var dateYearFrom = $(this);
			var dateYearToID="dateYearTo"+index;
			dateYearFrom.attr("id","dateYearFrom"+index);
			dateYearFrom.focus(function(){
				WdatePicker({
					onpicked:function(){this.blur();},
					oncleared:function(){this.blur();},
					errDealMode:1,
					dateFmt:'yyyy',
					maxDate:'#F{$dp.$D(\''+dateYearToID+'\')||\'%y\'}'
				});
			});
		});		
	}
	var dateYearTos=$(".dateYearTo");//年结束控件
	if(dateYearTos.size()>0){
		dateYearTos.each(function(index){
			var dateYearTo = $(this);
			var dateYearFromID="dateYearFrom"+index;
			dateYearTo.attr("id","dateYearTo"+index);
			dateYearTo.focus(function(){
				WdatePicker({
					onpicked:function(){this.blur();},
					oncleared:function(){this.blur();},
					errDealMode:1,
					dateFmt:'yyyy',
					minDate:'#F{$dp.$D(\''+dateYearFromID+'\')}',
					maxDate:'%y'
				});
			});
		});		
	}
	
	var dateMonthFroms=$(".dateMonthFrom");//月份开始控件
	if(dateMonthFroms.size()>0){
		dateMonthFroms.each(function(index){
			var dateMonthFrom = $(this);
			var dateMonthToID="dateMonthTo"+index;
			dateMonthFrom.attr("id","dateMonthFrom"+index);
			dateMonthFrom.focus(function(){
				WdatePicker({
					onpicked:function(){this.blur();},
					oncleared:function(){this.blur();},
					errDealMode:1,
					dateFmt:'yyyy-MM',
					maxDate:'#F{$dp.$D(\''+dateMonthToID+'\')||\'%y-%M\'}'
				});
			});
		});		
	}
	var dateMonthTos=$(".dateMonthTo");//月份结束控件
	if(dateMonthTos.size()>0){
		dateMonthTos.each(function(index){
			var dateMonthTo = $(this);
			var dateMonthFromID="dateMonthFrom"+index;
			dateMonthTo.attr("id","dateMonthTo"+index);
			dateMonthTo.focus(function(){
				WdatePicker({
					onpicked:function(){this.blur();},
					oncleared:function(){this.blur();},
					errDealMode:1,
					dateFmt:'yyyy-MM',
					minDate:'#F{$dp.$D(\''+dateMonthFromID+'\')}',
					maxDate:'%y-%M'
				});
			});
		});		
	}
	
	var annualDateFroms=$(".annualDateFrom");//日期段开始控件
	if(annualDateFroms.size()>0){
		annualDateFroms.each(function(index){
			var dateFrom = $(this);
			var dateToID="annualDateTo"+index;
			dateFrom.attr("id","annualDateFrom"+index);
			dateFrom.focus(function(){
				WdatePicker({
					onpicked:function(){this.blur();},
					oncleared:function(){this.blur();},
					errDealMode:1,
					minDate: '#F{annualFromDateValidator(\'' + dateToID + '\')}', 
					maxDate:'#F{$dp.$D(\''+dateToID+'\')||\'%y-%M-%d\'}'
				});
			});
		});		
	}
	var annualDateTos=$(".annualDateTo");//日期段结束控件
	if(annualDateTos.size()>0){
		annualDateTos.each(function(index){
			var dateTo = $(this);
			var dateFromID="annualDateFrom"+index;
			dateTo.attr("id","annualDateTo"+index);
			dateTo.focus(function(){
				WdatePicker({
					onpicked:function(){this.blur();},
					oncleared:function(){this.blur();},
					errDealMode:1,
					minDate:'#F{$dp.$D(\''+dateFromID+'\')}',
					maxDate:'#F{annualToDateValidator(\'' + dateFromID + '\')}'
				});
			});
		});		
	}
	
	var dateTime=$(".futureDate");//普通未来日期控件
	if(dateTime.size()>0){
		dateTime.focus(function(){
			WdatePicker({
				onpicked:function(){this.blur();},
				oncleared:function(){this.blur();},
				errDealMode:1,
				dateFmt:'yyyy-MM-dd HH:mm:ss',
				minDate:'%y-%M-%d'
			});
		});
	}
});

function annualFromDateValidator(id){
	var dateTo = $("#" + id).val();
	if(dateTo != undefined && dateTo != ""){
		var dateToObj = DateTool.getDate(dateTo);
		return dateToObj.getFullYear() + "-01" + "-01";
	}
}
function annualToDateValidator(id){
	var dateFrom = $("#" + id).val();
	var now = new Date();
	if(dateFrom != undefined && dateFrom != ""){
		var dateFromObj = DateTool.getDate(dateFrom);
		if(dateFromObj.getFullYear() == now.getFullYear()){
			return DateTool.format(now, 'yyyy-MM-dd');
		}else{
			return dateFromObj.getFullYear() + "-12" + "-31";
		}
	}else{
		return DateTool.format(now, 'yyyy-MM-dd');
	}
}