<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/NewFile.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<header>
         <div class="head">
         <img alt="" src="/urban-926.png" class="img">
		<h1 class="first">BMI Calculator</h1>
		</div>
	</header>
	<main>
		<form action="result" class="BMIData">
		<div class="userName"> 
		<label for="userName">Name:</label>
		<input type="text" name="userName" id="userName" class="usrnm" placeholder="Enter Your Name">
		</div>
			<div class="height">
				<label for="Height">Height: </label> <select name="Height"
					id="Height" class="slht">
					<option value="feet">Feet</option>
					<option value="meter">Meter</option>
				</select> <input type="number" step="0.01" name="Heightvalue" class="slht2"
					placeholder="Enter Height" required="required">
			</div>
			<div class="weight">
				<label for="weight">Weight: </label> <select name="weight"
					id="weight" class="wtht">
					<option value="KG">Kg</option>
					<option value="LBS">Lbs</option>
				</select> <input type="number" name="weightvalue" id="weight"
					placeholder="Enter Weight" class="wtht2" required="required">

			</div>

			<div class="btn">
				<button type="submit" class="submit">Check BMI</button>
				<button type="reset" class="reset">Reset</button>
			</div>

		</form>
	</main>

	<footer class="ftr"> </footer>
</body>
</html>