<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
</head>
<body>
<h1>Reindex:</h1>
<a href="/lemon/reindex">reindex</a>
<h1>Info:</h1>
<c:if test="${indexResults}">
<h3>reindex required time:${indexResults.indexTime} ms</h3>
</c:if>
</body>
</html>
