/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.leaverequest;

import controller.authentication.BaseRequiredAuthenticationController;
import dal.EmployeeDBContext;
import dal.LeaveRequestDBContext;
import data.Employee;
import data.LeaveRequest;
import data.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author sonnt-local hand-some
 */
public class CreateLeaveRequestController extends BaseRequiredAuthenticationController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        LeaveRequest lr = new LeaveRequest();
        lr.setTitle(req.getParameter("title"));
        lr.setReason(req.getParameter("reason"));
        lr.setFrom(Date.valueOf(req.getParameter("from")));
        lr.setTo(Date.valueOf(req.getParameter("to")));
        Employee owner = new Employee();
        owner.setId(Integer.parseInt(req.getParameter("eid")));
        lr.setOwner(owner);
        lr.setCreatedby(user);
        LeaveRequestDBContext db = new LeaveRequestDBContext();
        db.insert(lr);
        resp.getWriter().println("inserted" + lr.getId());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        EmployeeDBContext db = new EmployeeDBContext();
        ArrayList<Employee> employees = db.list();
        req.setAttribute("employees", employees);
        req.getRequestDispatcher("../view/leaverequest/create.jsp").forward(req, resp);
    }
   
   

}
