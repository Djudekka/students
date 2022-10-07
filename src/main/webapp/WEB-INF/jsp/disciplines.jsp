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

                            <tr>

                                <td class="ld_col0"><label><input name="idDiscipline" type="checkbox" value="1"></label></td>

                                <td class="ld_col1">Высшая математика</td>
                            </tr>

                            <tr>

                                <td class="ld_col0"><label><input name="idDiscipline" type="checkbox" value="2"></label></td>

                                <td class="ld_col1">История Науки и Техники</td>
                            </tr>

                            <tr>

                                <td class="ld_col0"><label><input name="idDiscipline" type="checkbox" value="3"></label></td>

                                <td class="ld_col1">Политология</td>
                            </tr>

                            <tr>

                                <td class="ld_col0"><label><input name="idDiscipline" type="checkbox" value="4"></label></td>

                                <td class="ld_col1">Информатика</td>
                            </tr>

                            <tr>

                                <td class="ld_col0"><label><input name="idDiscipline" type="checkbox" value="5"></label></td>

                                <td class="ld_col1">Теория Алгоритмизации</td>
                            </tr>

                            <tr>

                                <td class="ld_col0"><label><input name="idDiscipline" type="checkbox" value="6"></label></td>

                                <td class="ld_col1">Системный Анализ</td>
                            </tr>

                            <tr>

                                <td class="ld_col0"><label><input name="idDiscipline" type="checkbox" value="7"></label></td>

                                <td class="ld_col1">Управление проектами</td>
                            </tr>

                            <tr>

                                <td class="ld_col0"><label><input name="idDiscipline" type="checkbox" value="8"></label></td>

                                <td class="ld_col1">Основы Дискретной Математики</td>
                            </tr>

                        </table>
                    </div>
                    <div class="root_discipline">
                        <div class="button_group2">

                            <form action="/discipline_creating">
                                <input class="button_discipline" type="submit" value="Создать дисциплину…">
                            </form>


                            <input class="button_discipline" type="submit" value="Модифицировать выбранную дисциплину…" onclick="modifyDisciplines()">
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
<form action="/discipline_deleting" method="post" id="deleteForm">
    <input type="hidden" id="deleteHidden" name="deleteHidden">
</form>
<form action="/discipline_modifying" method="get" id="modifyForm">
    <input type="hidden" id="modifyHidden" name="modifyHidden">
</form>
</html>
