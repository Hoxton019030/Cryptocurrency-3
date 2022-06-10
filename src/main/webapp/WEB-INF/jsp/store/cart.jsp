<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>購物車</title>
        <link rel="Shortcut Icon" href="https://cdn-icons-png.flaticon.com/512/1490/1490853.png" type="image/x-icon" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript" src="${contextRoot}/javascripts/jquery.countdown.min.js"></script>
        <style>
            table,
            tr,
            th,
            td {
                border: 1px solid black;
                border-collapse: collapse;
            }
        </style>
    </head>

    <body>

        <div id="commodityList">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Commodity Name</th>
                        <th>Quantity</th>
                        <th>Shell</th>
                        <th>Total Price</th>
                        <th>DELETE</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <div>目前擁有:$ ${login.myShell} Shell</div>
            <form action="checkout" method="post">
                <input type="text" name="shell" id="" value="${login.myShell}">
                <div id="total">總價: <input id="value" type="text" name="total" id=""> </div>
                <button type="submit">CheckOut</button>
            </form>



    </body>
    <script>
        $(function() {
            var url = "http://localhost:8080/coinshell/showCart";
            fetch(url).then(function(response) {
                return response.json();
            }).then(function(array) {
                $.each(array, function(index, value) {
                    $("tbody").append(
                        `<tr>
                        <td>` + value.commodity.id + `</td>
                        <td>` + value.commodity.commodityName + `</td>
                         <td>` + value.quantity + `</td>
                    <td>` + value.commodity.shell + `</td>
                    <td>` + value.price + `</td>
                    <td>
                        <form action="deleteCart" method="get">
                        <input  type="hidden" name="id" value="` + value.commodity.id + `">
                        <button type="submit">delete</button>
                        </td>
                        </form>
                        </tr>
                        `

                    );
                })
            })
        })
        $(function() {
            var url = "http://localhost:8080/coinshell/showCart";
            var sum = parseInt(0, 10);
            fetch(url).then(function(response) {
                return response.json();
            }).then(function(array) {
                $.each(array, function(index, value) {
                    sum += value.price;
                    document.getElementById("value").value = sum;
                })
            }).then(function() {
                $("#total").append(sum);
                document.getElementById("input-value").value = 123;
            }).then(function() {
                document.getElementById("value").value = 123;
            })
        })
    </script>


    </html>