
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset=UTF-8>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students Modifying</title>
    <link rel="stylesheet" href="../../resources/css/style.css?v=1">
    <link rel="stylesheet" href="../../resources/fonts/fonts.css?v=1">
    <script src="../../resources/js/functions.js"></script>
<html>
<head>
    <title>Discipline modifying</title>
</head>
<body>
<div id="container">
    <header>
        <nav class="head">
            <h1 class="title">Система управления студентами и их успеваемостью</h1>
            <div class="login">
                <div><p>Привет, admin!</p></div>
                <div><a href="/logout">Logout</a></div>
            </div>
        </nav>
    </header>
    <main>
        <section class="content">
            <div class="side_menu">
                <div><a href="/home">На главную</a></div>
                <div><a href="/disciplines">Назад</a></div>
            </div>
            <div class="main">
                <h2>Для того чтобы модифицировать дисциплину введите новое значение поля и нажмите кнопку
                    "Применить":</h2>
                <div class="form_cm">
                    <form action="/discipline-modify" method="post">
                        <input type="hidden" name="id" value="${discipline.id}">
                        <div class="line3">
                            <div>Название</div>
                            <label>
                                <input type="text" name="discipline" value="${discipline.discipline}">
                            </label>
                        </div>
                        <input class="button_cm_discipline" type="submit" value="Применить">
                    </form>
                </div>
                <c:if test="${error eq 1}">
                    <h4>Поле не должно быть пустым</h4>
                </c:if>
            </div>
        </section>
    </main>
</div>
</body>
</html>
