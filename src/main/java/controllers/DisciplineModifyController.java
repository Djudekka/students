package controllers;

import db.DBManager;
import entity.Discipline;
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

@WebServlet(name = "DisciplineModifyController", urlPatterns = "/discipline-modify")
public class DisciplineModifyController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("modifyHidden");
        Discipline discipline = DBManager.getDisciplinetById(id);
        req.setAttribute("discipline", discipline);
        req.getRequestDispatcher("WEB-INF/jsp/discipline-modify.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String discipline = req.getParameter("discipline");

        if (discipline.isEmpty()){
            req.setAttribute("error","1");
            req.getRequestDispatcher("WEB-INF/jsp/student-modify.jsp").forward(req,resp);
            return;
        }

        DBManager.modifyDiscipline(id, discipline);
        resp.sendRedirect("/disciplines");
    }
}
