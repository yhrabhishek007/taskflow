package com.controller;

import java.io.IOException;
import java.time.LocalDate;

import com.dao.TaskDAO;
import com.model.Tasks;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/createTask")
public class CreateTaskServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String taskName = req.getParameter("taskName");

			String taskDescription = req.getParameter("taskDescription");

			int storyPoints = Integer.parseInt(req.getParameter("storyPoints"));

			int assignedTo = Integer.parseInt(req.getParameter("assignedTo"));

			String status = req.getParameter("status");

			String priority = req.getParameter("priority");

			String dueDateParam = req.getParameter("dueDate");

			LocalDate dueDate = null;

			if (dueDateParam != null && !dueDateParam.trim().isEmpty()) {

				dueDate = LocalDate.parse(dueDateParam);
			}

			Tasks task = new Tasks(taskName, taskDescription, storyPoints, assignedTo);

			task.setStatus(status);
			task.setPriority(priority);
			task.setDueDate(dueDate);

			TaskDAO taskDAO = new TaskDAO();

			boolean result = taskDAO.createTask(task);

			if (result) {

				resp.sendRedirect("taskshome");

			} else {

				resp.sendRedirect("createTask.jsp?error=failed");

			}

		} catch (NumberFormatException e) {

			e.printStackTrace();

			resp.sendRedirect("createTask.jsp?error=invalidData");

		} catch (Exception e) {

			e.printStackTrace();

			resp.sendRedirect("createTask.jsp?error=failed");
		}

	}

}