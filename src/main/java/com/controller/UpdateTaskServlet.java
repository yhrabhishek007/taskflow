package com.controller;

import java.io.IOException;
import java.time.LocalDate;

import com.dao.TaskDAO;
import com.model.Tasks;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateTask")
public class UpdateTaskServlet extends HttpServlet {

	// Show update form
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("Request came to find task by ID");

		String idParam = req.getParameter("id");

		// Check ID
		if (idParam == null || idParam.trim().isEmpty()) {

			resp.sendRedirect("taskshome?error=invalidId");

			return;
		}

		try {

			int taskId = Integer.parseInt(idParam);

			TaskDAO taskDAO = new TaskDAO();

			Tasks task = taskDAO.findTaskById(taskId);

			// Task not found
			if (task == null) {

				resp.sendRedirect("taskshome?error=notFound");

				return;
			}

			// Put task into request
			req.setAttribute("task", task);

			// Open update form
			RequestDispatcher rd = req.getRequestDispatcher("updateTaskForm.jsp");

			rd.forward(req, resp);

		} catch (NumberFormatException e) {

			System.out.println("Invalid task ID: " + idParam);

			resp.sendRedirect("taskshome?error=invalidId");
		}
	}

	// Process update form
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("Request received for updating task");

		try {

			// Get task ID
			int taskId = Integer.parseInt(req.getParameter("taskId"));

			// Get form values
			String taskName = req.getParameter("taskName");

			String taskDescription = req.getParameter("taskDescription");

			int storyPoints = Integer.parseInt(req.getParameter("storyPoints"));

			int assignedTo = Integer.parseInt(req.getParameter("assignedTo"));

			String status = req.getParameter("status");

			String priority = req.getParameter("priority");

			// Due date
			String dueDateParam = req.getParameter("dueDate");

			LocalDate dueDate = null;

			if (dueDateParam != null && !dueDateParam.trim().isEmpty()) {

				dueDate = LocalDate.parse(dueDateParam);
			}

			// Create task object
			Tasks task = new Tasks(taskName, taskDescription, storyPoints, assignedTo);

			// Set remaining values
			task.setTaskId(taskId);

			task.setStatus(status);

			task.setPriority(priority);

			task.setDueDate(dueDate);

			System.out.println("Updating task ID: " + taskId);

			System.out.println("Task Name: " + taskName);

			System.out.println("Status: " + status);

			System.out.println("Priority: " + priority);

			System.out.println("Due Date: " + dueDate);

			// DAO
			TaskDAO taskDAO = new TaskDAO();

			// Update database
			boolean result = taskDAO.updateTask(task);

			if (result) {

				System.out.println("Task updated successfully");

				resp.sendRedirect("taskshome");

			} else {

				System.out.println("Task update failed");

				resp.sendRedirect("updateTask?id=" + taskId + "&error=updateFailed");
			}

		} catch (NumberFormatException e) {

			e.printStackTrace();

			resp.sendRedirect("taskshome?error=invalidData");

		} catch (Exception e) {

			e.printStackTrace();

			resp.sendRedirect("taskshome?error=updateFailed");
		}
	}
}