<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>新增商品</title>
            <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
            <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
            <script src="${contextRoot}/javascripts/indexJs.js"></script>
            <script>
            </script>
        </head>

        <body>
            <!-- <form action="/commodityUpload" method="post" enctype="multipart/form-data">
                <br> Commodity Name: <input type="text" name="name">
                <br> Discribe:<textarea name="discribe"></textarea>
                <br> Volume: <input type="number" name="volume" min="0" max="2147483647">
                <br> Photo: <input type="file" name="photo">
                <br> shellOrCoin:

                <input type="radio" id="Shell" name="shellOrCoin" value="Shell" require>
                <label for="Shell" onclick="showMyshell()">Shell</label>
                <input type="radio" id="Coin" name="shellOrCoin" value="Coin">
                <label for="Coin" onclick="showMyCoin()">Coin</label>
                <div style="display: none;" id="myShell"> MyShell:<input type="number" name="myShell" min="0" max="2147483647"></div>
                <div style="display: none;" id="myCoin"> Coin:<input type="number" name="coin" min="0" max="2147483647"></div>

                <br>
                <input type="submit" value="送出">
            </form> -->
            <form action="fileUpload" method="post" enctype="multipart/form-data" accept="image/*">
                name: <input id="photoName" name="photoName" />
                <br /> file: <input type="file" name="file">

                <br />
                <input type="submit" value="送出">

            </form>


        </body>
        <script>
            function showMyshell() {
                $("#myShell").toggle()
                $("#myCoin").hide()
            }

            function showMyCoin() {
                $("#myCoin").toggle()
                $("#myShell").hide()
            }
        </script>

        </html>