package com.controller;

import java.io.IOException;

import com.dao.UserDAO;
import com.model.Users;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterUserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("Registration request received");

		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String role = req.getParameter("role");

		// Basic validation
		if (name == null || name.trim().isEmpty() || email == null || email.trim().isEmpty() || password == null
				|| password.trim().isEmpty() || role == null || role.trim().isEmpty()) {

			req.setAttribute("error", "All fields are required.");

			RequestDispatcher rd = req.getRequestDispatcher("register.jsp");

			rd.forward(req, resp);
			return;
		}

		// Create User object
		Users user = new Users(name, email, password, role);

		System.out.println("Registration request for: " + email);

		// DAO
		UserDAO userDAO = new UserDAO();

		boolean status = userDAO.registerUser(user);

		if (status) {

			System.out.println("User registered successfully");

			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");

			rd.forward(req, resp);

		} else {

			System.out.println("User registration failed");

			req.setAttribute("error", "Registration failed. Email may already exist.");

			RequestDispatcher rd = req.getRequestDispatcher("register.jsp");

			rd.forward(req, resp);
		}
	}
}

//```text
//                  Registration
//                       │
//                       ▼
//                  Plain password
//                       │
//                       ▼
//                  BCrypt hashing
//                       │
//                       ▼
//                 Password hash
//                       │
//                       ▼
//                    MySQL
//```
//
//Then login:
//
//```text
//                    Login
//                      │
//                      ▼
//              Entered password
//                      │
//                      ▼
//              BCrypt verification
//                      │
//                      ▼
//              Stored password hash
//                      │
//                 ┌────┴────┐
//                 ▼         ▼
//               Valid     Invalid
//                 │         │
//                 ▼         ▼
//              Session     Error
