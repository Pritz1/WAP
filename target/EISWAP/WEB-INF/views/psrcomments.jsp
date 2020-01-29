<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/css/metro.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap.min2.css" />" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
<br><br>
Write your comments here
<center>
<form:form commandName="comments" action="addcomments" method="POST">
<textarea cols="75" rows="15" name=></textarea>

<textarea  rows="5"
				maxlength="250" id="comments" name="comments"
				></textarea>

<br>
<input type="submit" value="Save">
<input type="reset" value="Reset">

</form:form>
</center>
</body>
</html>