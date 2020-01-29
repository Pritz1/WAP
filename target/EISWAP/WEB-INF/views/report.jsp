<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
 "http://www.w3.org/TR/html4/loose.dtd">
<html>
<div style="float: top;"><jsp:include page="header.jsp" /></div>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>Parameters</title>
<%-- <script src="<c:url value="/resources/js/jquery-2.1.3.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery.dataTables.min.js" />"></script>
<link href="<c:url value="/resources/css/metro.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/metro-icons.css" />"
	rel="stylesheet"/>
<link href="<c:url value="/resources/css/metro-responsive.css" />"
	rel="stylesheet"/>
<link href="<c:url value="/resources/css/select2.min.css" />"
	rel="stylesheet"/>
<script src="<c:url value="/resources/js/metro.js" />"></script>
<script src="<c:url value="/resources/js/select2.min.js" />"></script> --%>

<%-- <link href="<c:url value="/resources/css/bootstrap-3.3.5.css" />"	rel="stylesheet">
<link href="<c:url value="/resources/css/metro.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/metro-responsive.css" />"	rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap-table.min-1.12.2.css" />"	rel="stylesheet">
<script src="<c:url value="/resources/js/bootstrap-3.3.5.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap-table-1.12.2.js" />"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script> --%>
<!------ Include the above in your HEAD tag ---------->


<!-- <script language="JavaScript" src="https://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script> -->
<script src="<c:url value="/resources/js/jquery.dataTables.min2.js" />"></script>
<script src="<c:url value="/resources/js/dataTables.bootstrap.js" />"></script>
<link href="<c:url value="/resources/css/bootstrap.min2.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/dataTables.bootstrap.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/metro.css" />" rel="stylesheet">
<style>
/* #emp_table tr 
{
line-height : 10px !important;
}

#emp_table tr td 
{
max-height : 20px !important;
font-size : small;
} */
.table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
  /* background-color: #eff5ff; */
  background-color: #1ba1e2;
  font-weight:bold;
  font-size: 15px;
  color:#ffffff;
}
.pagination>li {
display: inline;
padding:0px !important;
margin:0px !important;
border:none !important;
}
.modal-backdrop {
  z-index: -1 !important;
}
/*
Fix to show in full screen demo
*/
iframe
{
    height:700px !important;
}

.btn {
display: inline-block;
padding: 6px 12px !important;
margin-bottom: 0;
font-size: 14px;
font-weight: 400;
line-height: 1.42857143;
text-align: center;
white-space: nowrap;
vertical-align: middle;
-ms-touch-action: manipulation;
touch-action: manipulation;
cursor: pointer;
-webkit-user-select: none;
-moz-user-select: none;
-ms-user-select: none;
user-select: none;
background-image: none;
border: 1px solid transparent;
border-radius: 4px;
}

.btn-primary {
color: #fff !important;
background: #428bca !important;
border-color: #357ebd !important;
box-shadow:none !important;
}
.btn-danger {
color: #fff !important;
background: #d9534f !important;
border-color: #d9534f !important;
box-shadow:none !important;
}
.card-body {
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.25rem;
}
.card {
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0,0,0,.125);
    border-radius: .25rem;
}
</style>
</head>

<body style="background-color:#e5e5e5;" >
<br><br><br><br>
<div >
<form:form id="reportform" commandName="report" method="POST" action="report">
<input type="hidden" id="levelSelected" name="levelSelected" value="1"/>
<input type="hidden" id="selEmp" name="selEmp" />
<fieldset>
<div class="container">
	<div class="col-12">
<div class="row">
<div class="card">
            <div class="card-body">
			<table style="border: none;" class="col-lg-8" >
				
				<tr>
					<td>
					<select class="form-control " id="viewType" name="viewType" width="50%" >
							<option value="">Select-Report is to be Viewed For All/Selected</option>
							<option value="1" ${(report.viewType==1) ? "selected='selected'" : "" }>ALL</option>
			 <option value="2" ${(report.viewType==2) ? "selected='selected'" : "" } >SELECTED</option>
					</select></td>
				<td>	&ensp;
	<button class="button  bg-cyan bg-active-darkBlue fg-white " id="btn_download" onclick="return onSubmit1();" value="Save">Download Report</button>
			</td>	
			<td><button class="button  bg-cyan bg-active-darkBlue fg-white " id="btn_submit" onclick="return onSubmit1();" value="Save">Next</button></td>
			</tr>
			</table>
			</div>
			</div>
			</div>
			</div>
			</div>
			<br><br>
			
<%-- <table>
 <tr>
  <td><div class="input-control">
	<label for="division">Employee Selection : </label> 
		<select	class="js-example-basic-single"	data-placeholder="Select-Report is to be Viewed For All/Selected"
			style="width: 350px" data-allow-clear="true" data-minimum-results-for-search="Infinity" id="viewType" name="viewType">
			 <option value=""></option>
			 <option value="1" ${(report.viewType==1) ? "selected='selected'" : "" }>ALL</option>
			 <option value="2" ${(report.viewType==2) ? "selected='selected'" : "" } >SELECTED</option>
	     </select>
</div></td>
<td>
	<button class="button  bg-cyan bg-active-darkBlue fg-white " onclick="return onSubmit1();" value="Save">Submit</button>
		</td>
	</tr>
</table> 




<p>view type: ${report.viewType}</p> --%>
<c:if test="${report.viewType == '2'}" >
<c:set var="count" value="0" scope="page" />
<div id="cont" class="container">
	
    
        <div class="row">
		
         <div class="col-12">
          <div class="card">
            <div class="card-body">
            <div class="table-responsive">
<table id="datatable" class="table table-hover table-striped table-bordered" cellspacing="0" width="100%">	<thead>
		<tr>
		    <th>Select</th>
			<th>EMP NAME</th>
			<th>NETID</th>
			<th>ECODE</th>
			<th>HQ NAME</th>
			<th>LEVEL</th>
		</tr>
	</thead>
 <tbody>
<c:forEach items="${report.empList}" var="emp">
 <c:set var="count" value="${count + 1}" scope="page"/>
  <tr>
	<td>
	<input type="checkbox" id="${emp.eCode}" name="empcheck" value="${emp.eCode}"> 
	</td>							
	<td>${emp.empName}</td>
	<td>${emp.netId}</td>
	<td>${emp.eCode}</td>
	<td>${emp.hqName}</td>
	<td>${emp.level}</td>
 </tr>
</c:forEach>
</tbody>
</table></div>
<table>
 <tr>
 <td ><button class="button bg-cyan bg-active-darkBlue fg-white " style="font-size:18px" onclick="return onSubmit2();" type="submit">&nbsp;Download</button>
 </td>
 </tr>
 </table>
 </div></div>
</div></div></div>
</c:if>
</fieldset>
</form:form>
</div>

</body>
	
	<script type="text/javascript">
	
	
	
	$(function() {
	    $('#btn_download').hide(); 
	    $('#btn_submit').hide(); 
	    $('#viewType').change(function(){
	        if($('#viewType').val() == '1') {
	            $('#btn_download').show();
	            $('#btn_submit').hide();
	            $('#cont').hide();
	        } else if($('#viewType').val() == '2') {
	            $('#btn_download').hide();
	            $('#btn_submit').show();
	        } else {
	            $('#btn_download').hide();
	            $('#btn_submit').hide();
	            $('#cont').hide();
	        } 
	    });
	});
	
	$(document).ready(function() {
	    $('#datatable').dataTable();
	} );
/* 	
	$(document).ready(function() {
		$('.js-example-basic-single').select2();
		$("#viewType").select2({
			width : 'resolve'
		});
	}); */
	
	function onSubmit1() {
		if(document.forms[0].viewType.value=="" || document.forms[0].viewType.value==null){
			alert("Please Select Value For Employee Selection");
			return false;
		}else if(document.forms[0].viewType.value=="2"){
		//alert("selected");
		document.forms[0].action = "showEmployeeList.action";
		document.forms[0].submit();
		return false;
		}else{
			//alert("all");
			document.forms[0].action = "report.action";
			document.forms[0].submit();
		}
	}
	
	function onSubmit2(){
		debugger;
		var table = $('#datatable').DataTable();
		var rowcollection =  table.$("input[name='empcheck']:checked", {"page": "all"});
		var arr=[];
		rowcollection.each(function(index,elem){
			arr.push("'"+$(elem).val()+"'");
		});
		//alert(arr);
		var total = arr.length;
		//alert("total : "+total);
		if(total>0){
			document.forms[0].selEmp.value=arr;
			document.forms[0].action = "report.action";
			document.forms[0].submit();
		}
		else{
			alert("Please Select Atleast One Employee To Continue");
			return false;
		}
		return false;
	}
	
	</script>
	</html>