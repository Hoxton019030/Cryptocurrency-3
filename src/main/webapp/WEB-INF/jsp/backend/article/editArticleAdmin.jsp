<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script src="${contextRoot}/javascripts/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRoot}/css/article.css">
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<title>修改文章頁面</title>
<style type="text/css">
body{
padding-top: 82px;
}
</style>
</head>
<body>
<a href="${contextRoot}/administrator/article">討論區刪改查頁面</a>
<div class="container">
	<div class="row justify-content-center">
		<div class="col-9">
			<div class="card border-info" id="article-card">
				<div class="card-header">修改文章</div>
				<div class="card-body">
					<!-- 			如果getmapping和postmapping的路徑一樣，action=""可以不用寫 -->
					<form:form action="${contextRoot}/postEditArticleAdmin" method="post"
						modelAttribute="article">
						<div class="input-group">
							<label>幣別：</label>
							<form:select path="tag">
								<form:option value="NONE" label="請選擇幣別標籤" />
								<form:options items="${tagList}"/>
							</form:select>
						</div>
						<div class="input-group">
							<label>標題：</label>			
							<form:input path="title"/>
						</div>
						<label>內文：</label><br>
						<div class="input-group">							
							<form:textarea wrap="Virtual" path="text" class="form-control" id="article-textarea"/>							
						</div>
						<div>
							<form:input path="readNum" type="hidden"/>
							<form:input path="goodNum" type="hidden"/>
							<form:input path="commentNum" type="hidden"/>
							<form:input path="deleted" type="hidden"/>
							<form:input path="id" type="hidden"/>
							<form:input path="added" type="hidden"/>
							<form:input path="authorId" type="hidden"/>
						</div>
						<div class=" text-right">							
							<input class="btn btn-primary btn-sm shadow-none" type="submit" name="submit" value="確認修改">
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>


</body>
</html>