<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../backendNavBar.jsp" />
    
<head>
<meta charset="UTF-8">
<title>圖像管理 | CoinShell Backend</title>
</head>

    <body>
        <h1>使用者頭像列表</h1>
        <div id="text-search">
            <form action="search" method="get">
                搜尋:<input type="text" name="name">
                <input type="submit" value="開始搜尋">
            </form>

        </div>
        <div id="cuaList">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Alias avatar</th>
                        <th>Avatar photo</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>



        </div>
        <script>
            $(function() {
                $.ajax({
                    method: "GET", //API的訪問方式，GET或POST
                    url: "http://localhost:8080/coinshell/allCUA", //API的URL
                    dataType: "json", //這個API裡面的資料型態有"XML","html","script","json","text"

                    success: function(data) {
                        $.each(data, function(index, value) {
                            $("tbody").append(

                                `<tr>
                            <td>` + value.id + `</td>
                            <td>` + value.aliasAvatar + `</td>
                            <td><img src="data:image/gif;base64,` + value.userAvatar + `" width=65px hight=65px></td>
                            <td> <a href="editcua?id=` + value.id + `">編輯</a></td>
                            <td ><a href="deletecua?id=` + value.id + `">刪除</a> </td> 
                                </tr>
                                `

                            )
                        })
                    },
                    error: function() {}
                })
            })
        </script>

    </body>

    </html>