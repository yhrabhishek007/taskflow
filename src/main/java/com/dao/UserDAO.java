package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.Users;
import com.utility.DBConnection;

public class UserDAO {

    // ==========================================
    // REGISTER
    // ==========================================

    public boolean registerUser(Users user) {

        String query =
                "INSERT INTO users "
                + "(name, email, password, role) "
                + "VALUES (?, ?, ?, ?)";


        try (
                Connection con =
                        DBConnection.getDBConnection();

                PreparedStatement ps =
                        con.prepareStatement(query)
        ) {

            ps.setString(
                    1,
                    user.getName());

            ps.setString(
                    2,
                    user.getEmail());

            ps.setString(
                    3,
                    user.getPassword());

            ps.setString(
                    4,
                    user.getRole());


            int rows =
                    ps.executeUpdate();


            return rows > 0;


        } catch (SQLException e) {

            System.out.println(
                    "Registration failed.");

            e.printStackTrace();

            return false;
        }
    }


    // ==========================================
    // LOGIN
    // ==========================================

    public boolean validateUser(
            String email,
            String password) {

        String query =
                "SELECT * FROM users "
                + "WHERE email = ? "
                + "AND password = ?";


        try (
                Connection con =
                        DBConnection.getDBConnection();

                PreparedStatement ps =
                        con.prepareStatement(query)
        ) {

            ps.setString(
                    1,
                    email);

            ps.setString(
                    2,
                    password);


            try (
                    ResultSet rs =
                            ps.executeQuery()
            ) {

                if (rs.next()) {

                    System.out.println(
                            "Valid user from UserDAO.");

                    return true;
                }
            }


        } catch (SQLException e) {

            System.out.println(
                    "Login database error.");

            e.printStackTrace();
        }


        return false;
    }
}