
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset=UTF-8>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Discipline creating</title>
    <link rel="stylesheet" href="../../resources/css/style.css?v=1">
    <link rel="stylesheet" href="../../resources/fonts/fonts.css?v=1">
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
                <h2>Для того чтобы создать новую дисциплину заполните все поля и нажмите кнопку "Создать":</h2>
                <div class="form_cm">
                    <form action="/discipline-creating" method="post">
                        <div class="line3">
                            <div>Название</div>
                            <label>
                                <input type="text" name="discipline">
                            </label>
                        </div>
                        <input class="button_cm_discipline" type="submit" value="Создать">
                    </form>
                </div>
                <c:if test="${error eq 1}">
                    <h4>Поле не должно быть пустым</h4>
                </c:if>
            </div>е
        </section>
    </main>
</div>
</body>
</html>
