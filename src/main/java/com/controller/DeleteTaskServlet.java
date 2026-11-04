package com.controller;

import java.io.IOException;

import com.dao.TaskDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteTask")
public class DeleteTaskServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        System.out.println(
                "Request came to delete task");


        String idParam =
                req.getParameter("id");


        if (idParam == null
                || idParam.trim().isEmpty()) {

            resp.sendRedirect(
                    "taskshome?error=invalidId");

            return;
        }


        try {

            int taskId =
                    Integer.parseInt(idParam);


            TaskDAO taskDAO =
                    new TaskDAO();


            boolean status =
                    taskDAO.deleteTaskById(
                            taskId);


            if (status) {

                System.out.println(
                        "Task deleted successfully");

                resp.sendRedirect(
                        "taskshome?message=deleted");

            } else {

                System.out.println(
                        "Task deletion failed");

                resp.sendRedirect(
                        "taskshome?error=deleteFailed");
            }


        } catch (NumberFormatException e) {

            System.out.println(
                    "Invalid task ID: "
                            + idParam);


            resp.sendRedirect(
                    "taskshome?error=invalidId");
        }
    }
}