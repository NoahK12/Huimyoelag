<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="${pageContext.request.contextPath}/css/template/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/template/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/shop/shopHome.css" rel="stylesheet">

<title>희묘애락</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

	<div class="wrap">
		<tiles:insertAttribute name="header" />

		<tiles:insertAttribute name="body" />

		<tiles:insertAttribute name="footer" />
	</div>

</body>
</html>