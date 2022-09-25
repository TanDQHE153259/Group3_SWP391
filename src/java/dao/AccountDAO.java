/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import context.DBContext;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import model.Role;

/**
 *
 * @author thuong
 */
public class AccountDAO {

    Connection con = null; // ket noi vs sql
    PreparedStatement ps = null; // nhan cau lenh
    ResultSet rs = null; // tra kq

    public Account checkLogin(String user, String pass) {
        String query = "SELECT * From Account WHERE [username] = ? and [password] = ? ";
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, user);
                ps.setString(2, pass);
                
                rs = ps.executeQuery();
                while (rs.next()) {
//                return new Account(rs.getString(1),rs.getString(2));

                //Get Role For Authen
                RoleDAO roleDAO = new RoleDAO();
                Role role = roleDAO.getRoleById(rs.getInt("roleId"));
                    return Account.builder()
                        .userid(rs.getInt(1))
                        .username(rs.getString(2))
                        .password(rs.getString(3))
                        .fullname(rs.getString(7))
                        .phone(rs.getInt(6))
                        .address(rs.getString(8))
                        .email(rs.getString(5))
                        .avatar(rs.getString(10))
                        .role(role)
                        .build();   
            }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
    

    public Account CheckAccountExit(String user) {
        String query = "  select * from Account  "
                + "where [username] = ?";

        try {
            con = DBContext.makeConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, user);
                rs = ps.executeQuery();
                while (rs.next()) {
                    return Account.builder()
                            .username(rs.getString(2))
                            .build();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
    public boolean updatePasswordTokenWithEmail(String email, String token) {
        String sql = "update Account\n"
                + "set password_token = ?\n"
                + "where email = ?";
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setString(1, token);
                ps.setString(2, email);
                if (ps.executeUpdate() > 0) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;

    }
     public boolean isExistAccount(String email) {
        String sql = "SELECT * FROM [Account] WHERE Email = ?";
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setString(1, email);

                rs = ps.executeQuery();
                if (rs.next()) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }
  
}
