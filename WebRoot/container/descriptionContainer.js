var descriptionContainer=[];

function addDescription(name,data)
{
	descriptionContainer[name]=data;
}

function getDescription(name)
{
	if(descriptionContainer[name]==undefined)
	{
		return name;
	}
	else
	{
		return descriptionContainer[name];
	}
}

addDescription("Audit.Empty","请输入您的用户名和密码！");
addDescription("Audit.IPStrategyFailure","对不起,您所使用的设备没有访问服务的权限！");
addDescription("Audit.AuthenticateFailure","对不起，您的用户名/密码不正确！");
addDescription("Audit.AuthorizeFailure","对不起，您没有执行此操作的权限！");
addDescription("Audit.Unavailable","对不起，您访问的服务暂时不可用！");

addDescription("Execution.GetData","<div>系统正在加载数据。</div>");
addDescription("Execution.SaveData","<div>系统正在保存数据。</div>");
addDescription("Execution.DeleteData","<div>系统正在删除数据。</div>");

addDescription("Error.ViewModel.GetPreview","无法读取数据！");
addDescription("Error.ViewModel.GetDetail","无法读取数据！");
addDescription("Error.ViewModel.SaveData","无法保存数据！");
addDescription("Error.ViewModel.DeleteData","无法删除数据！");
addDescription("Error.ViewModel.AddNew","无法读取数据！");
addDescription("Error.ViewModel.GetFile","无法打开文件！");

addDescription("Confirmation.Delete","删除当前数据将删除所有与当前数据关联的数据，您确定吗？");
addDescription("Confirmation.BatchDelete","删除当前所选择的数据将删除所有与当前数据关联的数据，您确定吗？");

