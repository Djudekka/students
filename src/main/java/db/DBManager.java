package db;

import entity.Discipline;
import entity.Group;
import entity.Student;
import entity.Term;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBManager {

    public static final String ID = "id";
    public static final String SURNAME = "surname";
    public static final String NAME = "name";
    public static final String ID_GROUP = "id_group";
    public static final String GROUP = "group";
    public static final String DATE = "date";


    public static List<Student> getAllActiveStudent() {

        List<Student> students = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_1?user=root&password=yhbASD");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select s.id, s.surname, s.name, s.id_group, g.group, s.date from " +
                    "student as s left join groupp as g on s.id_group = g.id where status = '1';");

            while (resultSet.next()) {
                Student student = new Student();
                student.setId(resultSet.getInt(ID));
                student.setSurname(resultSet.getString(SURNAME));
                student.setName(resultSet.getString(NAME));

                Group group = new Group();
                group.setId(resultSet.getInt(ID_GROUP));
                group.setGroup(resultSet.getString(GROUP));
                student.setGroup(group);

                student.setDate(resultSet.getDate(DATE));

                students.add(student);
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return students;
    }

    public static List<Discipline> getAllActiveDisciplines() {
        List<Discipline> disciplines = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_1?user=root&password=yhbASD");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select d.id, d.discipline from discipline as d where status = '1'");

            while (resultSet.next()) {

            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return disciplines;
    }

    public static List<Term> getAllActiveTerms() {
        List<Term> terms = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_1?user=root&password=yhbASD");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from term as t where status = '1'");

            while (resultSet.next()) {

            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return terms;
    }

    public static int getGroupId(String group) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_1?user=root&password=yhbASD");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select id from groupp as g where g.group = '" + group + "'");

            while (resultSet.next()) {
                return resultSet.getInt(ID);
            }

            statement.execute("INSERT INTO groupp (`group`) VALUES ('" + group + "');");
            resultSet = statement.executeQuery("select id from groupp order by id desc limit 1;");

            while (resultSet.next()) {
                return resultSet.getInt(ID);
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return -1;
    }

    public static void createStudent(String surname, String name, int groupId, String date) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_1?user=root&password=yhbASD");
            Statement statement = connection.createStatement();
            statement.execute("INSERT INTO student (`surname`, `name`, `id_group`, `date`) VALUES ('" + surname + "', '" + name + "', '" + groupId + "', '" + date + "');");

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public static void deleteStudents(String[] ids) {
//        UPDATE students_1.`student` SET `status` = '0' WHERE id in ('1','3','4');
        String stringIds = formIdsForQuery(ids);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_1?user=root&password=yhbASD");
            Statement statement = connection.createStatement();
            statement.execute("UPDATE student SET `status` = '0' WHERE id in (" + stringIds + ");");
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    private static String formIdsForQuery(String[] ids) {
        StringBuilder result = new StringBuilder();
        for (String id : ids) {
            result.append("'").append(id).append("', ");
        }
        result.setLength(result.length() - 2);
        return result.toString();
    }

    public static Student getStudentById (String id) {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_1?user=root&password=yhbASD");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select s.id, s.surname, s.name, s.id_group, g.group, s.date from " +
                    "student as s left join groupp as g on s.id_group = g.id where s.id = '" + id + "';");

            while (resultSet.next()) {
                Student student = new Student();
                student.setId(resultSet.getInt(ID));
                student.setSurname(resultSet.getString(SURNAME));
                student.setName(resultSet.getString(NAME));

                Group group = new Group();
                group.setId(resultSet.getInt(ID_GROUP));
                group.setGroup(resultSet.getString(GROUP));
                student.setGroup(group);

                student.setDate(resultSet.getDate(DATE));
                return student;
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return null;
    }

    public static void modifyStudent(String id, String surname, String name, int groupId, String dateForDB) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_1?user=root&password=yhbASD");
            Statement statement = connection.createStatement();
            statement.execute("UPDATE student SET `surname` = '" + surname + "', `name` = '" + name + "', `id_group` = '"+ groupId +"', `date` = '" + dateForDB + "' WHERE (`id` = '" + id + "');");
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
