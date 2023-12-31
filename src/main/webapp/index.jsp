<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Моё красивое</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="icon" href="img/favicon.png">
</head>
<body>

<header>
    <div class="header">
        <h1 class="main_header_h1">Welcome to the Web-club</h1>
        <div class="hea-2">
            <p class="header hea-2__header">
                Изготовитель: Шамков Николай Николаевич<br>
                Группа: P3207<br>
                Вариант: 1720
            </p>
        </div>
    </div>
</header>

<div class="wrapper">
    <div class="grid">
        <div>
            <canvas id="drawLine" width="600" height="600"></canvas>
            <!--        <button class="base-button" type="button" onclick="reset()">Тык тык</button>-->
        </div>
        <div class="container">
            <div class="pad_bot">
                <img src="img/sad.png" alt="как же тонко" class="tonko">
                <p class="sad">Тут можно задавать координаты прямо мышкой, тыкая по канвасу. Жаль, что далеко не все
                    поймут в чём же дело и как сложен js))) Действительно тонко))) Не так уж много и образованных в
                    наше время, кто знает, почему это так интересно и необычно)))
                </p>
                <div class="custom">
                    <label for="size_r">Параметр R:</label>
                    <select name="size_r" id="size_r" class="my-select">
                        <option value="1">1</option>
                        <option value="1.5">1.5</option>
                        <option value="2">2</option>
                        <option value="2.5">2.5</option>
                        <option value="3" selected>3</option>
                    </select>
                </div>

                <div class="custom">
                    <label for="x_coords">X координата:</label>
                    <input type="text" id="x_coords" min="-3" max="5" name="x_coords" class="my-input" oninput="change_input_field(this, -2.99999999, 4.99999999, 0)" placeholder="X (-3; 5)"/>
                </div>

                <div class="custom">
                    <label for="y_coords">Y координата:</label>
                    <input type="text" id="y_coords" min="-5" max="3" name="y_coords" class="my-input" oninput="change_input_field(this, -4.99999999, 2.99999999, 1)" placeholder="Y (-5; 3)"/>
                </div>
                <button class="btn" onclick="request_to_servlet()">Есть пробитие?</button>
                <button class="btn" onclick="clear_table()">Очистить табличку</button>
                <h5 id="form_error"></h5>
            </div>
        </div>
        <div class="container">
            <div class="table">
                <table>
                    <thead>
                    <tr>
                        <th colspan="1" style="width: 10%">X</th>
                        <th colspan="1" style="width: 10%">Y</th>
                        <th colspan="1" style="width: 5%">R</th>
                        <th colspan="1" style="width: 15%">Результат</th>
                        <th colspan="1" style="width: 35%">Выполнен в</th>
                        <th colspan="1" style="width: 35%">Время выполнения</th>
                    </tr>
                    </thead>
                    <tbody id="suda">
                    <% if (request.getSession(true).getAttribute("tableData") != null) {%>
                    <%=request.getSession(true).getAttribute("tableData")%>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery-3.6.3.js" ></script>
<script src="main.js"></script>
</body>
</html>