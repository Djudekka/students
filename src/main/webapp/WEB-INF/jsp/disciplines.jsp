<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset=UTF-8>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Disciplines List</title>
      <link rel="stylesheet" href="../../resources/css/style.css?v=1">
    <link rel="stylesheet" href="../../resources/fonts/fonts.css?v=1">
    <script src="../../resources/js/functions.js"></script>
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
            </div>
            <div class="main">
                <h2 class="discipline_title">Список дисциплин</h2>
                <div class="discipline_section">
                    <div class="discipline">
                        <table class="list">
                            <tr>

                                <th class="ld_col0"></th>

                                <th class="ld_col1">Наименование дисциплины</th>
                            </tr>
                           <c:forEach items="${disciplines}" var="d">
                            <tr>

                                <td class="ld_col0"><label><input name="idDiscipline" type="checkbox" value="${d.id}"></label></td>

                                <td class="ld_col1">${d.discipline}</td>
                            </tr>
                           </c:forEach>
                        </table>
                    </div>
                    <div class="root_discipline">
                        <div class="button_group2">

                            <form action="/discipline-creating">
                                <input class="button_discipline" type="submit" value="Создать дисциплину…">
                            </form>


                            <input class="button_discipline" type="submit" value="Модифицировать выбранную дисциплину…"
                                   onclick="modifyDiscipline()">
                            <input class="button_discipline" type="submit" value="Удалить выбранную дисциплину…"
                                   onclick="deleteDisciplines()">

                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
   </div>
</body>
<form action="/discipline-delete" method="post" id="deleteForm">
    <input type="hidden" id="deleteHidden" name="deleteHidden">
</form>
<form action="/discipline-modify" method="get" id="modifyForm">
    <input type="hidden" id="modifyHidden" name="modifyHidden">
</form>
</html>
