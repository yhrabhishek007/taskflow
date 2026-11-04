package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Tasks;
import com.utility.DBConnection;

public class TaskDAO {

	// ==========================================
	// CREATE TASK
	// ==========================================

	public boolean createTask(Tasks task) {

		String sql = "INSERT INTO tasks " + "(task_name, task_description, story_points, "
				+ "assigned_to, status, priority, due_date) " + "VALUES (?, ?, ?, ?, ?, ?, ?)";

		try (Connection con = DBConnection.getDBConnection();

				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, task.getTaskName());

			ps.setString(2, task.getTaskDescription());

			ps.setInt(3, task.getStoryPoints());

			ps.setInt(4, task.getAssignedTo());

			ps.setString(5, task.getStatus());

			ps.setString(6, task.getPriority());

			if (task.getDueDate() != null) {

				ps.setDate(7, java.sql.Date.valueOf(task.getDueDate()));

			} else {

				ps.setNull(7, java.sql.Types.DATE);
			}

			int rowsAffected = ps.executeUpdate();

			return rowsAffected > 0;

		} catch (SQLException e) {

			System.out.println("Error while creating task.");

			e.printStackTrace();

			return false;
		}
	}

	// ==========================================
	// UPDATE TASK
	// ==========================================

	public boolean updateTask(Tasks task) {

		String sql = "UPDATE tasks SET " + "task_name=?, " + "task_description=?, " + "story_points=?, "
				+ "assigned_to=?, " + "status=?, " + "priority=?, " + "due_date=? " + "WHERE task_id=?";

		try (Connection con = DBConnection.getDBConnection();

				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, task.getTaskName());

			ps.setString(2, task.getTaskDescription());

			ps.setInt(3, task.getStoryPoints());

			ps.setInt(4, task.getAssignedTo());

			ps.setString(5, task.getStatus());

			ps.setString(6, task.getPriority());

			if (task.getDueDate() != null) {

				ps.setDate(7, java.sql.Date.valueOf(task.getDueDate()));

			} else {

				ps.setNull(7, java.sql.Types.DATE);
			}

			ps.setInt(8, task.getTaskId());

			int rowsAffected = ps.executeUpdate();

			return rowsAffected > 0;

		} catch (SQLException e) {

			System.out.println("Error while updating task.");

			e.printStackTrace();

			return false;
		}
	}

	// ==========================================
	// DELETE TASK
	// ==========================================

	public boolean deleteTaskById(int taskId) {

		String sql = "DELETE FROM tasks WHERE task_id=?";

		try (Connection con = DBConnection.getDBConnection();

				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, taskId);

			int rowsAffected = ps.executeUpdate();

			return rowsAffected > 0;

		} catch (SQLException e) {

			System.out.println("Error while deleting task.");

			e.printStackTrace();

			return false;
		}
	}

	// ==========================================
	// FIND TASK BY ID
	// ==========================================

	public Tasks findTaskById(int taskId) {

		String sql = "SELECT task_id, task_name, " + "task_description, story_points, "
				+ "assigned_to, status, priority, due_date " + "FROM tasks " + "WHERE task_id=?";

		try (Connection con = DBConnection.getDBConnection();

				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, taskId);

			try (ResultSet rs = ps.executeQuery()) {

				if (rs.next()) {

					return mapResultSetToTask(rs);
				}
			}

		} catch (SQLException e) {

			System.out.println("Error while finding task.");

			e.printStackTrace();
		}

		return null;
	}

	// ==========================================
	// GET ALL TASKS
	// ==========================================

	public List<Tasks> getAllTasks() {

		List<Tasks> list = new ArrayList<>();

		String sql = "SELECT task_id, task_name, " + "task_description, story_points, "
				+ "assigned_to, status, priority, due_date " + "FROM tasks " + "ORDER BY task_id DESC";

		try (Connection con = DBConnection.getDBConnection();

				PreparedStatement ps = con.prepareStatement(sql);

				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {

				list.add(mapResultSetToTask(rs));
			}

		} catch (SQLException e) {

			System.out.println("Error while getting all tasks.");

			e.printStackTrace();
		}

		return list;
	}

	// ==========================================
	// RESULTSET → TASK
	// ==========================================

	private Tasks mapResultSetToTask(ResultSet rs) throws SQLException {

		Tasks task = new Tasks();

		task.setTaskId(rs.getInt("task_id"));

		task.setTaskName(rs.getString("task_name"));

		task.setTaskDescription(rs.getString("task_description"));

		task.setStoryPoints(rs.getInt("story_points"));

		task.setAssignedTo(rs.getInt("assigned_to"));

		task.setStatus(rs.getString("status"));

		task.setPriority(rs.getString("priority"));

		if (rs.getDate("due_date") != null) {

			task.setDueDate(rs.getDate("due_date").toLocalDate());
		}

		return task;
	}
}