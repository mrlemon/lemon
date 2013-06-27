<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<form action="user" method="post">
<h3>User management</h3>
<ul>
	<li>ID :<input name="id"> </li>
	<li>Name:<input name="name"></li>
	<li>Birthday:<input name="birthday"></li>
	<li>
	<input type="hidden" name="_method" value="put"/>
	<input type="submit"  value="add">
	</li>
</ul>
</form>
</body>
</html>
