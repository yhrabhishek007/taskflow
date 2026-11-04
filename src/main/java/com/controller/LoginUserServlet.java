package com.controller;

import java.io.IOException;

import com.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginUserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("Login request received");

		String email = req.getParameter("email");
		String password = req.getParameter("password");

		// Basic validation
		if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {

			resp.sendRedirect("login.jsp?error=empty");
			return;
		}

		UserDAO userDAO = new UserDAO();

		boolean status = userDAO.validateUser(email, password);

		if (status) {

			System.out.println("Login successful");

			// Create session
			HttpSession session = req.getSession();

			session.setAttribute("userEmail", email);

			// Redirect to task home
			resp.sendRedirect("taskshome");

		} else {

			System.out.println("Login failed");

			resp.sendRedirect("login.jsp?error=invalid");
		}
	}
}