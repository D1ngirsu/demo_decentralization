/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dynamic;

import data.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 *
 * @author sonnt-local
 */

public class TestDynamic extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float num1 = Float.parseFloat(req.getParameter("num1"));
        float num2 = Float.parseFloat(req.getParameter("num2"));
        String operator = req.getParameter("operator");
        switch (operator) {
            case "plu":
                resp.getWriter().println((num1 + num2));
                break;
            case "min":
                resp.getWriter().println((num1 - num2));
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Student s = new Student();
        s.setId(Integer.parseInt(req.getParameter("id")));
        s.setName(req.getParameter("name"));
        resp.getWriter().println("I love sonnt " + new Date());
        resp.getWriter().println(s.getName());
    }

}
