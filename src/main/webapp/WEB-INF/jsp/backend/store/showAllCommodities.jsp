<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>全部商品列表</title>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
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
        <h1>上架之商品列表</h1>
        <div id="commodityList">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Commodity Name</th>
                        <th>Photo</th>
                        <th>Describe</th>
                        <th>Volume</th>
                        <th>ShellOrCoin</th>
                        <th>Shell</th>
                        <th>Coin</th>
                        <th>Edit</th>
                        <th>DELETE</th>

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
                    url: "http://localhost:8080/coinshell/allCommodity", //API的URL
                    dataType: "json", //這個API裡面的資料型態有"XML","html","script","json","text"

                    success: function(data) {
                        $.each(data, function(index, value) {
                            $("tbody").append(

                                `<tr>
                            <td>` + value.id + `</td>
                            <td>` + value.commodityName + `</td>
                            <td><img src="data:image/gif;base64,` + value.photo + `" width=300px hight=300px></td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            </tr>`

                            )
                        })
                    },
                    error: function() {}
                })
            })
        </script>

    </body>

    </html>