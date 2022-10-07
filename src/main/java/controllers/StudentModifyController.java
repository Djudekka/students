package controllers;

import db.DBManager;
import entity.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "StudentModifyController", urlPatterns = "/student-modify")
public class StudentModifyController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("idsHiddenModify");
        Student student = DBManager.getStudentById(id);
        req.setAttribute("student", student);
        req.getRequestDispatcher("WEB-INF/jsp/student-modify.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String surname = req.getParameter("surname");
        String name = req.getParameter("name");
        String group = req.getParameter("group");
        String stringDate = req.getParameter("date");

        if (surname.isEmpty() || name.isEmpty() || group.isEmpty() || stringDate.isEmpty()){
            req.setAttribute("error","1");
            req.getRequestDispatcher("WEB-INF/jsp/student-modify.jsp").forward(req,resp);
            return;
        }

        DateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        Date date;
        try {
            date = format.parse(stringDate);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateForDB = formatter.format(date);

        int groupId = DBManager.getGroupId(group);
        DBManager.modifyStudent(id, surname, name, groupId, dateForDB);
        resp.sendRedirect("/students");
    }
}
