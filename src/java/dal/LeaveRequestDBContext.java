/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import data.Employee;
import data.LeaveRequest;
import data.User;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sonnt-local
 */
public class LeaveRequestDBContext extends DBContext<LeaveRequest> {

    @Override
    public ArrayList<LeaveRequest> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public LeaveRequest get(int id) {
        try {
            String sql = "SELECT lr.[rid]\n"
                    + "      ,lr.[title]\n"
                    + "      ,lr.[reason]\n"
                    + "      ,lr.[from]\n"
                    + "      ,lr.[to]\n"
                    + "      ,lr.[status]\n"
                    + "      ,u.username as createdbyusername\n"
                    + "	  ,u.displayname\n"
                    + "      ,e.[eid] as ownereid\n"
                    + "	  ,e.ename\n"
                    + "	  ,d.did\n"
                    + "	  ,d.dname\n"
                    + "      ,lr.[createddate]\n"
                    + "  FROM [LeaveRequests] lr \n"
                    + "  INNER JOIN Users u  ON u.username = lr.createdby\n"
                    + "  INNER JOIN Employees e ON e.eid = lr.owner_eid\n"
                    + "  INNER JOIN Department d ON e.did = d.did\n"
                    + "  WHERE lr.rid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                LeaveRequest lr = new LeaveRequest();
                lr.setId(rs.getInt("rid"));
                lr.setTitle(rs.getString("title"));
                lr.setReason(rs.getString("reason"));
                lr.setFrom(rs.getDate("from"));
                lr.setTo(rs.getDate("to"));
                lr.setStatus(rs.getInt("status"));
                lr.setCreateddate(rs.getTimestamp("createddate"));
                Employee owner = new Employee();
                owner.setId(rs.getInt("ownereid"));
                owner.setName(rs.getString("ename"));
                lr.setOwner(owner);
                User u = new User();
                u.setUsername(rs.getString("createdbyusername"));
                u.setDisplayname(rs.getString("displayname"));
                lr.setCreatedby(u);
                return lr;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            if (connection != null)
                try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    @Override
    public void insert(LeaveRequest model) {

        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [LeaveRequests]\n"
                    + "           ([title]\n"
                    + "           ,[reason]\n"
                    + "           ,[from]\n"
                    + "           ,[to]\n"
                    + "           ,[status]\n"
                    + "           ,[createdby]\n"
                    + "           ,[owner_eid]\n"
                    + "           ,[createddate])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,0\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,GETDATE())";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getTitle());
            stm.setString(2, model.getReason());
            stm.setDate(3, model.getFrom());
            stm.setDate(4, model.getTo());
            stm.setString(5, model.getCreatedby().getUsername());
            stm.setInt(6, model.getOwner().getId());
            stm.executeUpdate();
            //get ID of record
            String sql_getid = "SELECT @@IDENTITY as rid";
            PreparedStatement stm_getid = connection.prepareStatement(sql_getid);
            ResultSet rs = stm_getid.executeQuery();
            if (rs.next()) {
                model.setId(rs.getInt("rid"));
            }
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            if (connection != null)
                try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    public void update(LeaveRequest model) {
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE [LeaveRequests]\n"
                    + "   SET [title] = ?\n"
                    + "      ,[reason] = ?\n"
                    + "      ,[from] = ?\n"
                    + "      ,[to] = ?\n"
                    + "      ,[owner_eid] = ?\n"
                    + " WHERE [rid] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getTitle());
            stm.setString(2, model.getReason());
            stm.setDate(3, model.getFrom());
            stm.setDate(4, model.getTo());
            stm.setInt(5, model.getOwner().getId());
            stm.setInt(6, model.getId());
            stm.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            if (connection != null)
                try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    public void delete(LeaveRequest model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
