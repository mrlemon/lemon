<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
</head>
<body>
<h1>Search:</h1>
<form action="/lemon/search.html" method="get">
Keywords:<INPUT type="text" size="20" name="query" value="">
<input type="submit" value="search">
<INPUT type="hidden" size="20" name="page" value="1">
</form> 
<h1>Result:</h1>
<div class="left">
<c:if test="${! empty searchResults}">
<h3>times:<c:out value="${searchResults.searchTime}" /></h3>
	<c:if test="${empty searchResults.hits}">
		No result!
	</c:if>
	<c:forEach var="hit" items="${searchResults.hits}">
				id:<c:out value="${hit.data.id}"></c:out><br/>
				title:<c:out value="${hit.data.title}" /><br/>
				content:<c:out value="${hit.data.content}" /><br/>
				qq:<c:out value="${hit.data.qq}" /><br/><br/>
	</c:forEach>
</c:if>
</div>
</body>
</html>
