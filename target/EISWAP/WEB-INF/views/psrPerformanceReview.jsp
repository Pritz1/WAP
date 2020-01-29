<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/css/bootstrap-3.3.5.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/metro.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/metro-responsive.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-2.1.3.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap-3.3.5.min.js" />"></script>
<style>

/* The container1 */
table {
	border-spacing: 0;
	width: 70%;
	border: 1px solid #ddd;
}

th, td {
	text-align: left;
	/* padding: 16px; */
}

thead, tr:nth-child(even) {
	background-color: #f9f9f9
}

.container1 {
	display: block;
	position: relative;
	padding-left: 35px;
	margin-bottom: 12px;
	cursor: pointer;
	font-size: 22px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* Hide the browser's default radio button */
.container1 input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
	position: absolute;
	top: 0;
	left: 0;
	height: 20px;
	width: 20px;
	background-color: #c3c3c3;
	border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container1:hover input ~ .checkmark {
	background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container1 input:checked ~ .checkmark {
	background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

/* Show the indicator (dot/circle) when checked */
.container1 input:checked ~ .checkmark:after {
	display: block;
}

/* Style the indicator (dot/circle) */
.container1 .checkmark:after {
	top: 7px;
	left: 7px;
	width: 6px;
	height: 6px;
	border-radius: 50%;
	background: white;
}
.form-actions {
    margin: 0;
    background-color: transparent;
    text-align: center;
}

.caption-copy{
padding-top:8px;padding-bottom: 8px;color: #777;text-padding-top:8px;padding-bottom: 8px;color: #777;text-align: left;
}
</style>

<script type="text/javascript">
	/* $(document).ready(function() {
	 $("#comment").on('keyup', function() {
	 var words = this.value.match(/\S+/g).length;

	 if (words > 200) {
	 // Split the string on first 200 words and rejoin on spaces
	 var trimmed = $(this).val().split(/\s+/, 200).join(" ");
	 // Add a space at the end to make sure more typing creates new words
	 $(this).val(trimmed + " ");
	 }
	 else {
	 $('#display_count').text(words);
	 $('#word_left').text(200-words);
	 }
	 });
	 });  */

	function countChar(val) {
		var len = val.value.length;
		if (len > 250) {
			val.value = val.value.substring(0, 250);
		} else {
			$('#charNum').text(250 - len);
		}
	};

	function valuesToModal() {
		//alert(1);

		if (document.forms[0].empSel.value == "") {
			alert("Please Select Employee to be Reviewed");
			return false;
		}

		if (!$("input[name=score1]:checked").val()) {
			alert('Please Give Score For First Parameter');
			return false;
		}
		if (!$("input[name=score2]:checked").val()) {
			alert('Please Give Score For Second Parameter');
			return false;
		}
		if (!$("input[name=score3]:checked").val()) {
			alert('Please Give Score For Third Parameter');
			return false;
		}
		if (!$("input[name=score4]:checked").val()) {
			alert('Please Give Score For Fourth Parameter');
			return false;
		}
		if (document.forms[0].comment.value == null
				|| document.forms[0].comment.value == "") {
			alert('Please Write Some Comments');
			return false;
		}

		document.getElementById('modTd1').innerHTML = $('input[name=score1]:checked').val();
		document.getElementById('modTd2').innerHTML = $('input[name=score2]:checked').val();
		document.getElementById('modTd3').innerHTML = $('input[name=score3]:checked').val();
		document.getElementById('modTd4').innerHTML = $('input[name=score4]:checked').val();
		var empselVal = $("#empSel").val();
		var empselTxt = $("#empSel option:selected").text();
		document.getElementById('coCode').innerHTML = "<b>ID : </b>"
				+ empselVal.split("~")[1];
		document.getElementById('empName').innerHTML = "<b>Name : </b>"
				+ empselTxt.split("/")[0];
		document.getElementById('hname').innerHTML = "<b>HQ : </b>"
				+ empselTxt.split("/")[1];
		document.getElementById('modComment').innerHTML = document.forms[0].comment.value;
		document.forms[0].psrNetid.value = empselVal.split("~")[2];
		document.forms[0].psrEmp.value = empselVal.split("~")[0];
		//alert("document.forms[0].psrNetid.value : "+document.forms[0].psrNetid.value);
		//alert(document.getElementById('modTd4').innerHTML);
		

		document.getElementById('confirm2').click()
	}

	function confirmReview() {
		//alert(2);
		document.forms[0].action = "reviewConfirmed.action";
		document.forms[0].submit();
		return true;
	}
	
	function isReviewedByFM(){
		var fmCode = (document.forms[0].empSel.value).split("~")[3];
		if(fmCode!=null && fmCode!=""){
			document.getElementById("fmScores").style.display="block";
		}else{
			document.getElementById("fmScores").style.display="none";
		}
	}
	
	
	function getMgr1Scores(obj)
	{
		
	var empselVal = $("#empSel").val();
	
	$.ajax({
	url : 'getMgr1Scores',
	cache: false,
	data: 'psrEmp='+empselVal.split("~")[0]+"&psrNetid="+empselVal.split("~")[2]+"&divId="+document.forms[0].hidDivId.value+"&loginMth="+document.forms[0].hidLogMth.value+"&loginYr="+document.forms[0].hidLogYr.value,
	type:'GET', 
	dataType: 'json',
	success : function(obj) 
	{
		document.forms[0].ajaxRes.value=obj;
		document.forms[0].score1.value=document.getElementById('panTd1').innerHTML = (document.forms[0].ajaxRes.value).split(",")[0];
		document.forms[0].score2.value=document.getElementById('panTd2').innerHTML = (document.forms[0].ajaxRes.value).split(",")[1];
		document.forms[0].score3.value=document.getElementById('panTd3').innerHTML = (document.forms[0].ajaxRes.value).split(",")[2];
		document.forms[0].score4.value=document.getElementById('panTd4').innerHTML = (document.forms[0].ajaxRes.value).split(",")[3];
	
	},error:function (xhr, ajaxOptions, thrownError){
	    alert(xhr.status);
	    alert(thrownError);
	}
	});
}
	
</script>

</head>
<body>

<c:choose>
<c:when test="${(error ne null) && (error ne '')}">
<div class="container">
<div class="panel panel-primary">
<div class="panel-body">
<div class="well"><span class="caption-copy">
${error}</span></div>
</div></div></div>
</c:when>
<c:otherwise>
<form:form id="reviewform" commandName="psrPerformanceReview"	method="POST" action="reviewConfirmed">
<div style="float: top;"><jsp:include page="header.jsp" /></div>
		<br />
<%-- <div style="float: left;"><jsp:include page="sideBar.jsp" /></div>		
 --%>
		
		<form:hidden path="psrNetid" />
		<form:hidden path="psrEmp" />
	<input type="hidden" value="${user.divId}" name="hidDivId">
	<input type="hidden" value="${user.loginMth}" name="hidLogMth">	
	<input type="hidden" value="${user.loginYr}" name="hidLogYr">		
	<input type="hidden"  name="ajaxRes">	
<br/><br/><br/>			
<div class="container">
<div class="panel panel-primary">
<div class="panel-body">
		<div  style="overflow-x: auto;">
		<!-- <div class="col-lg-12"> -->
		
<c:choose>
<c:when test="${(psrPerformanceReview.empList ne null) && (not empty psrPerformanceReview.empList)}">
		<div class="row" style="padding-right: 25px;padding-left: 25px;">
			<table style="border: none;" class="col-lg-12" width="100%">
				<caption id="title101">Section I: Select Your Team Member
					To Be reviewed</caption>
				<tr>
					<td>
					<select class="form-control " id="empSel" name="empSel" width="100%" onClick="isReviewedByFM()">
							<option value="">Select One Emp</option>
							<c:forEach items="${psrPerformanceReview.empList}" var="emp">
								<option value="${emp.eCode}~${emp.coCode}~${emp.netId}~${emp.fmCode}">${emp.empName}/${emp.hqName}</option>
							</c:forEach>
					</select></td>
				</tr>
			</table>
			</div>
<br/>	

<div class="row" style="padding-right: 25px;padding-left: 25px;" >	
 <div class="panel-group " id="fmScores" style="display:none;" >
  <div class="panel panel-default">
    <div class="panel-heading">
      <h5 class="panel-title">
        <a data-toggle="collapse" href="#collapse1">Want To Check What AFM has Reviewed?</a>
      </h5>
    </div>
    <div id="collapse1" class="panel-collapse collapse">
      <div class="panel-body"><a onclick='getMgr1Scores(this)'>Click To Get AFM's Review</a>
		<table  class="table table-sm-12">
							<caption>
								<span id="coCode"></span> <span id="empName"> </span> <span id="hname"></span>
							</caption>
							<thead>
								<tr>
									<th>Parameters</th>
									<th>TP Compliance</th>
									<th>Strategy Compliance</th>
									<th>Detailing</th>
									<th>DR. Conversion</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Rating</td>
									<td id="panTd1"></td>
									<td id="panTd2"></td>
									<td id="panTd3"></td>
									<td id="panTd4"></td>
								</tr>
							</tbody>
						</table>   
						</div>  
      <div class="panel-footer"><span id="totScore"></span></div>
    </div>
  </div>
</div>
</div>
<div class="row" style="padding-right: 25px;padding-left: 25px;">			
			
			<!-- </div> -->
			<!-- <div class="table-responsive col-lg-11"> -->
			<table cellspacing="0" class="table col-lg-12" width="100%">
				<caption id="title102">Section II: Operational Effectiveness<br/><br/>
				NOTE : Poor=1,Average=2,Good=3,Excellent=4,Outstanding=5</caption>
				<thead>
					<tr>
						<!-- First column header is not rotated -->
						<th width="20%">&nbsp;</th>
						<!-- Following headers are rotated -->
						<th width="16%"><div><span>Poor</span></div></th>
						<th width="16%"><div><span>Average</span></div></th>
						<th width="16%"><div><span>Good</span></div></th>
						<th width="16%"><div><span>Excellent</span></div></th>
						<th width="16%"><div><span>Outstanding</span></div></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th><label>TP Compliance</label></th>
						<td title="poor"><label class="container1"> <input
								type="radio" name="score1" value="1"> <span
								class="checkmark"></span>

						</label></td>
						<td title="Average"><label class="container1"> <input
								type="radio" name="score1" value="2"> <span
								class="checkmark"></span>
						</label></td>
						<td title="Good"><label class="container1"> <input
								type="radio" name="score1" value="3"> <span
								class="checkmark"></span>
						</label></td>
						<td title="Excellent"><label class="container1"> <input
								type="radio" name="score1" value="4"> <span
								class="checkmark"></span>
						</label></td>
						<td title="Outstanding"><label class="container1"> <input
								type="radio" name="score1" value="5"> <span
								class="checkmark"></span>
						</label></td>
					</tr>
					<tr>
						<th><label>Strategy Compliance</label></th>
						<td title="poor"><label class="container1"> <input
								type="radio" name="score2" value="1"> <span
								class="checkmark"></span>
						</label></td>
						<td title="Average"><label class="container1"> <input
								type="radio" name="score2" value="2"> <span
								class="checkmark"></span>
						</label></td>
						<td title="Good"><label class="container1"> <input
								type="radio" name="score2" value="3"> <span
								class="checkmark"></span>
						</label></td>
						<td title="Excellent"><label class="container1"> <input
								type="radio" name="score2" value="4"> <span
								class="checkmark"></span>
						</label></td>
						<td title="Outstanding"><label class="container1"> <input
								type="radio" name="score2" value="5"> <span
								class="checkmark"></span>
						</label></td>
					</tr>

					<tr>
						<th><label>Detailing</label></th>
						<td title="poor"><label class="container1"> <input
								type="radio" name="score3" value="1"> <span
								class="checkmark"></span>
						</label></td>
						<td title="Average"><label class="container1"> <input
								type="radio" name="score3" value="2"> <span
								class="checkmark"></span>
						</label></td>
						<td title="Good"><label class="container1"> <input
								type="radio" name="score3" value="3"> <span
								class="checkmark"></span>
						</label></td>
						<td title="Excellent"><label class="container1"> <input
								type="radio" name="score3" value="4"> <span
								class="checkmark"></span>
						</label></td>
						<td title="Outstanding"><label class="container1"> <input
								type="radio" name="score3" value="5"> <span
								class="checkmark"></span>
						</label></td>
					</tr>

					<tr>
						<th><label>DR. Conversion</label></th>
						<td title="poor"><label class="container1"> <input
								type="radio" name="score4" value="1"> <span
								class="checkmark"></span>
						</label></td>
						<td title="Average"><label class="container1"> <input
								type="radio" name="score4" value="2"> <span
								class="checkmark"></span>
						</label></td>
						<td title="Good"><label class="container1"> <input
								type="radio" name="score4" value="3"> <span
								class="checkmark"></span>
						</label></td>
						<td title="Excellent"><label class="container1"> <input
								type="radio" name="score4" value="4"> <span
								class="checkmark"></span>
						</label></td>
						<td title="Outstanding"><label class="container1"> <input
								type="radio" name="score4" value="5"> <span
								class="checkmark"></span>
						</label></td>
					</tr>

				</tbody>
			</table>
			</div>
<!-- </div> -->
<!-- <div class="col-lg-12"> -->
<div class="row" style="padding-right: 25px;padding-left: 25px;">	
<span class="caption-copy">
	Section III: Leave a Comment</span>
<br/><br/>
			<label for="comment">Comment: </label><span>(Max 250
				Characters)</span>
			<textarea class="form-control form-group col-md-6" rows="5"
				maxlength="250" id="comment" name="comment"
				onkeyup="countChar(this)"></textarea>
			<div>
				Characters Left : <span id="charNum"></span>
			</div>

			<br />
			
					<div class="form-actions">
					<button id="confirm" type="button" class="btn btn-primary"
							onclick="return valuesToModal();">&nbsp;CONFIRM</button></td>
					</div>
			
			<button id="confirm2" type="button"
							class="btn btn-primary" data-toggle="modal"
							data-target="#myModal" style="display: none;"></button>
		</div>
<!-- </div> -->

		<!-- Modal -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Please Check And Confirm The Below
							Ratings :</h4>
					</div>
					<div class="modal-body">

						<table  class="table table-sm">
							<caption>
								<span id="coCode"></span> <span id="empName"> </span> <span
									id="hname"></span>
							</caption>
							<thead>
								<tr>
									<th>Parameters</th>
									<th>TP Compliance</th>
									<th>Strategy Compliance</th>
									<th>Detailing</th>
									<th>DR. Conversion</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Rating</td>
									<td id="modTd1"></td>
									<td id="modTd2"></td>
									<td id="modTd3"></td>
									<td id="modTd4"></td>
								</tr>
							</tbody>
						</table>

						<span>Comment:</span>
						<p id="modComment"></p>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<button type="button" class="btn btn-default" onclick="return confirmReview();">Confirm</button>
					</div>
				</div>
			</div>
		</div>
		</div>
	</c:when>
<c:otherwise>
<br/><br/><br/>
<div class="well"><span class="caption-copy">NO DATA FOUND</span></div>	
</c:otherwise>
 </c:choose>
		</div>
</div>
	</form:form>
</c:otherwise>
 </c:choose>
</body>
</html>
