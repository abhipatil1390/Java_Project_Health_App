<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/result.css">
<meta charset="ISO-8859-1">
<title>Result Page</title>
</head>
<body>

	<header>
		<div class="head">
			<img alt="" src="/urban-926.png" class="img">
			<h1 class="first">BMI Calculator</h1>
		</div>
	</header>
	<main>
		<div class="first">
			<h1>Hi ${userName}, I hope you are good.</h1>
			<br>
			<c:set var="bmiv" value="${bmi}"/>
			<h2>Your BMI Score is <fmt:formatNumber maxFractionDigits="2" type="number" value="${bmiv}"/>
			</h2>
			<h1>You are ${condition}</h1>
		</div>

	</main>


</body>
</html>