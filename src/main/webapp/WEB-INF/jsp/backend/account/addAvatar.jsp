<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增會員圖像</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script src="${contextRoot}/javascripts/indexJs.js"></script>
<script>
</script>
</head>
<body>
<h2>新增會員圖像</h2>

<form action="uploadcua" method="post" enctype="multipart/form-data">
圖像別名： <input type="text" name="alias" value="我是圖像別名">
<br/>
圖像上傳：<input type="file" name="file" required="required" accept="image/png, image/gif, image/jpeg">

<input type="submit" value="送出">
</form>



<script></script>
</body>
</html>