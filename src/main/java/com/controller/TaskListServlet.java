package com.controller;

import java.io.IOException;
import java.util.List;

import com.dao.TaskDAO;
import com.model.Tasks;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/taskshome")
public class TaskListServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        System.out.println(
                "Request came for task list");


        TaskDAO taskDAO =
                new TaskDAO();


        List<Tasks> allTasks =
                taskDAO.getAllTasks();


        req.setAttribute(
                "allTasks",
                allTasks);


        RequestDispatcher rd =
                req.getRequestDispatcher(
                        "task-home.jsp");


        rd.forward(req, resp);
    }
}