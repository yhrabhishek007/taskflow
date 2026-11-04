package com.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	public static Connection getDBConnection() {

		Connection con = null;

		try {

			System.out.println("Request for DB connection!!!!");

			Class.forName("com.mysql.cj.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/taskmanagementdb", "root", "root");

			System.out.println("DB connected successfully!!!!");

		} catch (Exception e) {

			e.printStackTrace();
		}

		return con;
	}
}