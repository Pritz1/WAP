<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<link rel='shortcut icon' type='image/x-icon' href='../favicon.ico' />


<title>Login Success</title>
<!-- below jquery import is required for datatables too in other jsps. -->
<script src="<c:url value="/resources/js/jquery-2.1.3.min.js" />"></script>
<link href="<c:url value="/resources/css/metro.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/metro-icons.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/metro-responsive.css" />"
	rel="stylesheet">
<%-- <link href="<c:url value="/resources/css/select2.min.css" />" rel="stylesheet"> --%>
<%-- <script src="<c:url value="/resources/js/jquery-3.1.0.js" />"></script> --%>
<script src="<c:url value="/resources/js/metro.js" />"></script>
<%-- <script src="<c:url value="/resources/js/jquery.dataTables.min.js" />"></script> --%>
<%-- <script src="<c:url value="/resources/js/select2.min.js" />"></script> --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>
html, body {
	height: 100%;
}
body {
	
}

.page-content {
	padding-top: 3.125rem;
	min-height: 100%;
	height: 100%;
}

.table .input-control.checkbox {
	line-height: 1;
	min-height: 0;
	height: auto;
}

@media screen and (max-width: 800px) {
	#cell-sidebar {
		flex-basis: 52px;
	}
	#cell-content {
		flex-basis: calc(100% - 52px);
	}
}

.app-bar .app-bar-menu > li .d-menu li:not(.disabled):hover {
  background-color: #71b1d159 !important;
}

.app-bar .app-bar-menu > li .d-menu {
    top: 100%;
    border: 2px solid #ded9d3 !important;
}
.app-bar {
box-shadow: 0px 2px 25px 0 rgba(0, 0, 0, 0.20);
}
</style>

<script>
    
    /* function wapClick() {
    	document.getElementById("superUsrMenu").style.display = "none";
        var x = document.getElementById("wapMenu");
        if (x.style.display === "none") {
            x.style.display = "block";
        }else{
        	x.style.display = "none";
        }
    }
    function superUser() {
    	document.getElementById("wapMenu").style.display = "none";
        if (document.getElementById("superUsrMenu").style.display === "none") {
        	document.getElementById("superUsrMenu").style.display = "";
        }else{
        	document.getElementById("superUsrMenu").style.display = "none";
        }
    }
    
    function menuCall(){
    	//alert("1");
    document.getElementById("param1").style.display = "";
    	 
    	 
    }
        function pushMessage(t){
            var mes = 'Info|Implement independently';
            $.Notify({
                caption: mes.split("|")[0],
                content: mes.split("|")[1],
                type: t
            });
        }

        $(function(){
            $('.sidebar').on('click', 'li', function(){
                if (!$(this).hasClass('active')) {
                    $('.sidebar li').removeClass('active');
                    $(this).addClass('active');
                }
            })
        }) */
        
        
        var mywindow=null;
        function openChangeDate(){
        	
                width = 500;
                height = 500;
                mywindow = window.open("http://www.palsonsonline.com:8087/EISWAP/showChangeDate.html", "Title",
                    "location=0,status=1,scrollbars=1,resizable=1,menubar=0,toolbar=no,width="
                                + width + ",height=" + height);
                mywindow.moveTo(500, 100);
                mywindow.focus();
        }
        
    </script>

</head>
<body>

	<div class="app-bar fixed-top darcula" data-role="appbar">
		<!-- <a class="app-bar-element branding">Dashboard</a>
        <span class="app-bar-divider"></span> -->
		<ul class="app-bar-menu">
			<!-- <li><a href="dashboard.html">Dashboard</a></li> -->
			<!-- <li><a onclick="wapClick()">WAP Options</a></li> --> 
			<!-- menu 1 starts -->
			<li><a href="" class="dropdown-toggle">WAP Options</a>
				<ul class="d-menu" data-role="dropdown">
                   <li><a href="parameters" id="param"> <span
							class="mif-list icon" style="font-size: 20px;"></span> <span
							class="title">Parameters for Appraisal</span>

					</a></li>
					<li><a href="slabs"> <span
							class="mif-paragraph-justify icon" style="font-size: 20px;"></span>
							<span class="title">Parameter Slabs</span>

					</a></li>
					<!-- <li><a href="wapcalc"> <span class="mif-calculator icon"
							style="font-size: 20px;"></span> <span class="title">Wap
								Calculation Example</span>

					</a></li> --><!-- class="active" -->
				<li ><a href="showincrement"> <span 	
							class="mif-plus icon" style="font-size: 20px;"></span> <span
							class="title">Know Your Increment</span>
		
					</a></li>
					<!-- <li><a href="upload"> <span class="mif-file-upload icon"
							style="font-size: 20px;"></span> <span class="title">Upload
								Manager's Feedback </span>
						todo get manager designtions from db 

					</a></li> -->
					
<!-- Comments	 -->				
					<li><a href="psrcomments"> <span
							class="mif-star-full icon" style="font-size: 20px;"></span> <span
							class="title">PSR Comments</span>

					</a></li>
<!-- Comments	 -->				
					
					
					<li><a href="showPsrPerformanceReview"> <span
							class="mif-star-full icon" style="font-size: 20px;"></span> <span
							class="title">Evaluation By Manager</span>

					</a></li>
					
					<li><a href="showReviewStatus"> <span
							class="mif-eye icon" style="font-size: 20px;"></span> <span
							class="title">Review Status</span>

					</a></li>
					<li><a href="showprocessWap"> <span
							class="mif-loop2 icon" style="font-size: 20px;"></span> <span
							class="title">Process WAP </span>

					</a></li>
					<li><a href="showAppraisal"> <span
							class="mif-medal icon" style="font-size: 20px;"></span> <span
							class="title">Show Appraisal</span>

					</a></li>
					
                </ul>        
             </li>
             <!-- menu 1 ends -->
             
			<li><a href="" class="dropdown-toggle" >Super User</a> <!-- onclick="superUser()" -->
			<ul class="d-menu" data-role="dropdown">
					<li ><a href="users" id="users"> <span
							class="mif-users icon" style="font-size: 20px;"></span> <span
							class="title">Users</span>
					</a></li>
					<!-- <li >
                        	<a  href="adminUsers" id="adminUsers">
                            	<span class="mif-users icon" style="font-size: 20px;"></span>
                            	<span class="title">Admin Users</span>
                        	</a>
                        </li> -->
					<li><a href="division"> <span class="mif-flow-tree icon"
							style="font-size: 20px;"></span> <span class="title">Division</span>
					</a></li>
					<!-- <li ><a href="lockHistory">
                            <span class="mif-history icon" style="font-size: 20px;"></span>
                            <span class="title">Lock History</span>
                          
                        </a></li>
                        <li ><a href="deleteWapData">
                            <span class="mif-bin icon" style="font-size: 20px;"></span>
                            <span class="title">Delete Data</span>
                        </a></li> -->
					<li><a href="lockmaster"> <span class="mif-lock icon"
							style="font-size: 20px;"></span> <span class="title">Lock
								Master</span>
					</a></li>

					<!-- <li><a href="cloneParam"> <span
							class="mif-flow-parallel icon" style="font-size: 20px;"></span> <span
							class="title">Clone Parameters</span> 

					</a></li>-->
			</ul>
			</li>

			<li><a href="" class="dropdown-toggle">Report</a>
				<ul class="d-menu" data-role="dropdown">
					<li><a href="" class="dropdown-toggle">WAP Report</a>
						<ul class="d-menu" data-role="dropdown">
							<!-- <li><a href="">View Report</a></li> -->
							<li><a href="downloadReport">Download Report</a></li>
							<!-- <li class="divider"></li>
                            <li><a href="">Clear list</a></li> -->
						</ul></li>
					<!-- <li><a href="">QIP - Quarterly Incentive Project</a></li> -->
					<!-- <li class="divider"></li> -->
					<li><a href="about">About</a></li>
				</ul></li>

		</ul>

		<div class="app-bar-element place-right">
			<span class="dropdown-toggle"><span class="mif-cog"></span>
				User Options</span>
			<div
				class="app-bar-drop-container padding10 place-right no-margin-top block-shadow fg-dark"
				data-role="dropdown" data-no-close="true" style="width: 220px">
				<!-- <h2 class="text-light">Quick settings</h2> -->
				<h5 class="text-light">&nbsp;User Name : ${user.employeeName}</h5>
				<h5 class="text-light">&nbsp;User ID : ${user.emp}</h5>
				<h5 class="text-light">&nbsp;Designation : ${desig}</h5>
				<h5 class="text-light">&nbsp;Division : ${user.divName}</h5>
				<h5 class="text-light">&nbsp;Head Quarter : ${user.hqName}</h5>
				<h5 class="text-light">&nbsp;Login Yr/Mth : ${user.loginYr}/${user.loginMth}</h5>
				<ul class="unstyled-list fg-dark">
					<!-- <li class="divider"></li>
					<li><a href="" class="fg-white3 fg-hover-yellow">Change	Password</a></li> -->
					<li class="divider"></li>
					<li><a onclick="openChangeDate()"  class="fg-white3 fg-hover-yellow">Change Date</a></li> <!-- href="showChangeDate" -->
					<li><a href="logout" class="fg-white3 fg-hover-yellow">Logout</a></li> <!-- http://localhost:8087/EISWAP/loginform.html -->
				</ul>
			</div>
		</div>
	</div>

</body>
</html>