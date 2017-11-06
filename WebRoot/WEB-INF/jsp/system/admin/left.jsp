<%@include file="/common/include/taglibs.jsp" %>
<%
	String pathl = request.getContextPath();
	String basePathl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+pathl+"/";
%>
		<!-- 本页面涉及的js函数，都在head.jsp页面中     -->
		<div id="sidebar" class="menu-min">

				<div id="sidebar-shortcuts">

					<div id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>

				</div><!-- #sidebar-shortcuts -->


		<ul class="nav nav-list">
			<li class="active" id="fhindex">
			  <a href="main/index"><i class="icon-dashboard"></i><span>后台首页</span></a>
			</li>

			<c:forEach items="${menuList}" var="menu">
			
				<li id="lm${menu.MENU_ID }">
				<!-- 判断如果是一级菜单不做跳转的话则不跳转，否则就跳转到相应地址 -->
				<c:choose>
						<c:when test="${menu.MENU_URL eq '#' }">
							<c:if test="${user.role.ROLE_ID eq '1' and menu.MENU_NAME=='系统管理'}">
							<a style="cursor:pointer;" class="dropdown-toggle" >
									<i class="${menu.MENU_ICON == null ? 'icon-desktop' : menu.MENU_ICON}"></i>        
									<span>
										${menu.MENU_NAME}
									</span>
									 <b class="arrow icon-angle-down"></b> 
							</a>
							</c:if>
							<c:if test="${menu.MENU_NAME!='系统管理'}">
							<a style="cursor:pointer;" class="dropdown-toggle" >
									<i class="${menu.MENU_ICON == null ? 'icon-desktop' : menu.MENU_ICON}"></i>
									<span>
										${menu.MENU_NAME }
									</span>
									 <b class="arrow icon-angle-down"></b> 
							</a>
							</c:if>
							
						</c:when>
						<c:otherwise>
							  <a style="cursor:pointer;" class="dropdown-toggle"   target="mainFrame"  onclick="siMenu('z${menu.MENU_ID }','lm${menu.MENU_ID }','${menu.MENU_NAME }','${menu.MENU_URL }')">
									<i class="${menu.MENU_ICON == null ? 'icon-desktop' : menu.MENU_ICON}"></i>
									<span>
										${menu.MENU_NAME }
									</span>
									 <b class="arrow icon-angle-down"></b> 
								  </a>
						</c:otherwise>
				</c:choose>
				<!--二级菜单 -->
					    <ul class="submenu">
							<c:forEach items="${menu.subMenu}" var="sub">
						<%-- ${menu.hasMenu} --%>
								<c:choose>
									<c:when test="${not empty sub.MENU_URL}">
									<li id="z${sub.MENU_ID }">
									<a style="cursor:pointer;" target="mainFrame"  onclick="siMenu('z${sub.MENU_ID }','lm${menu.MENU_ID }','${sub.MENU_NAME }','${sub.MENU_URL }')"><i class="icon-double-angle-right"></i>${sub.MENU_NAME }</a></li>
									</c:when>
									<c:otherwise>
									<li><a href="javascript:void(0);"><i class="icon-double-angle-right"></i>${sub.MENU_NAME }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
				  		</ul>  
				</li>
	
			</c:forEach> 

		</ul><!--/.nav-list-->

		<div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div>

	</div><!--/#sidebar-->
