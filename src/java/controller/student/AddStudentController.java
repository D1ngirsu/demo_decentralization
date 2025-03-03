/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.student;

import data.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author sonnt-local
 */
public class AddStudentController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Student> students = new ArrayList<>();
        String[] indexes = req.getParameterValues("index");
        for (String index : indexes) {
            String name = req.getParameter("name" + index);
            int sid = Integer.parseInt(req.getParameter("sid" + index));
            boolean gender = req.getParameter("gender" + index).equals("male");
            Date dob = Date.valueOf(req.getParameter("dob" + index));

            Student s = new Student();
            s.setId(sid);
            s.setName(name);
            s.setGender(gender);
            s.setDob(dob);

            students.add(s);
        }
        
        req.setAttribute("data", students);
        req.getRequestDispatcher("../view/student/list.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("../register.html").forward(req, resp);
    }

}
