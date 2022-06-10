<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextRoot}/css/article.css">
<title>修改文章頁面</title>
<style type="text/css">
body{
padding-top: 82px;
}
</style>
</head>
<body>
<jsp:include page="../NavBar/CoinShellNavBar.jsp" />
<div class="container">
	<div class="row justify-content-center">
		<div class="col-9">
			<div class="card border-info" id="edit-card">
				<div class="card-header">修改文章</div>
				<div class="card-body">
					<!-- 			如果getmapping和postmapping的路徑一樣，action=""可以不用寫 -->
					<form:form action="${contextRoot}/postEditArticle" method="post"
						modelAttribute="article">
						<div class="input-group">
							<form:select path="tag">
								<form:option value="NONE" label="請選擇幣別標籤" />
								<form:options items="${tagList}"/>
							</form:select>
						</div>
						<div class="input-group">													
							<form:input path="title" id="edit-title"/>
						</div>
						<div class="input-group">
							<form:textarea wrap="Virtual" path="text" class="form-control" id="edit-textarea"/>							
						</div>
						<div>
							<form:input path="readNum" type="hidden"/>
							<form:input path="commentNum" type="hidden"/>
							<form:input path="deleted" type="hidden"/>
							<form:input path="id" type="hidden"/>
							<form:input path="added" type="hidden"/>
							<form:input path="authorId" type="hidden"/>
							<form:input path="goodNum" type="hidden"/>
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