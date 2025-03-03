/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import data.Department;
import data.Employee;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sonnt-local
 */
public class EmployeeDBContext extends DBContext<Employee> {

    @Override
    public ArrayList<Employee> list() {
        ArrayList<Employee> employees = new ArrayList<>();
        try {
            String sql = "SELECT [eid]\n"
                    + "      ,[ename]\n"
                    + "  FROM [Employees]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getInt("eid"));
                e.setName(rs.getString("ename"));
                employees.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null)
                try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return employees;
    }

    @Override
    public Employee get(int id) {
        ArrayList<Employee> employees = new ArrayList<>();
        try {
            String sql = "WITH employee_hierarchy AS (\n"
                    + "    SELECT eid, managerid, 0 AS level\n"
                    + "    FROM employees\n"
                    + "    WHERE eid = ?\n"
                    + "    UNION ALL\n"
                    + "    SELECT e.eid, e.managerid, eh.level + 1\n"
                    + "    FROM employees e\n"
                    + "    INNER JOIN employee_hierarchy eh ON e.managerid = eh.eid\n"
                    + ")\n"
                    + "SELECT \n"
                    + "    e.eid as [staffid], \n"
                    + "	staff.ename as [staffname],\n"
                    + "    e.managerid as [managerid],\n"
                    + "	manager.ename as [managername],\n"
                    + "	d.did,\n"
                    + "	d.dname\n"
                    + "FROM employee_hierarchy e INNER JOIN Employees staff ON staff.eid = e.eid\n"
                    + "INNER JOIN Department d ON d.did = staff.did\n"
                    + "LEFT JOIN Employees manager ON e.managerid = manager.eid";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getInt("staffid"));
                e.setName(rs.getString("staffname"));
                int managerid = rs.getInt("managerid");
                if (managerid != 0) {
                    Employee m = new Employee();
                    m.setId(rs.getInt("managerid"));
                    m.setName(rs.getString("managername"));
                    e.setManager(m);
                }
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                e.setDept(d);
                employees.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null)
                try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        //construct hirachical structure
        if (employees.size() > 0) {
            Employee root = employees.get(0);
            for (Employee employee : employees) {
                if (root != employee) {
                    Employee manager = findManager(employees, employee);
                    employee.setManager(manager);
                    manager.getDirectstaffs().add(employee);
                    root.getStaffs().add(employee);
                }
            }
            return root;
        } else {
            return null;
        }
    }

    private Employee findManager(ArrayList<Employee> emps, Employee e) {
        for (Employee emp : emps) {
            if (e.getManager().getId() == emp.getId()) {
                return emp;
            }
        }
        return null;
    }

    @Override
    public void insert(Employee model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Employee model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Employee model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
