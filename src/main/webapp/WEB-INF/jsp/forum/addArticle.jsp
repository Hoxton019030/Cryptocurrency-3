<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${contextRoot}/css/article.css">
<title>新增留言</title>
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
				<div class="card-header">新增文章</div>
				<div class="card-body">
					<!-- 			如果getmapping和postmapping的路徑一樣，action=""可以不用寫 -->
					<form:form action="${contextRoot}/article/add" method="post"
						modelAttribute="article" class="articleForm">
						<div class="input-group">
							<label>幣別：</label>						
							<form:select path="tag">
								<form:option value="NONE" label="請選擇幣別標籤" />
								<form:options items="${tagList}"/>
							</form:select>
						</div>
						<div class="input-group">
							<label>標題：</label>												
							<form:input path="title"  id="edit-title" placeholder="請輸入文章標題⋯"/>
						</div>
						<label>內文：</label><br>
						<div class="input-group">							
							<form:textarea id="edit-textarea" wrap="Virtual" path="text" class="form-control" placeholder="請輸入文章內容⋯"/>							
						</div>
						<div>
						<form:input path="readNum" value="0" type="hidden"/>
						<form:input path="commentNum" value="0" type="hidden"/>
						<form:input path="goodNum" value="0" type="hidden"/>
						<form:input path="deleted" value="n" type="hidden"/>
						<form:input path="authorId" value="${login.id}" type="hidden"/>
						</div>
						<div class=" text-right">
							<input class="btn btn-primary btn-sm shadow-none" type="submit" name="submit" value="Submit">
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>	
</div>
<!-- <script type="text/javascript">
function upload(){
var content = document.getElementById("#textarea").val();
// var reg=new RegExp("\r\n","g");
// str = str.replace(reg,"<br>");
content = content.replace(/\n|\r\n/g,"<br>");
// $("#textarea").value = content;
document.getElementById(".articleForm").submit();
}

</script> -->
</body>
</html>