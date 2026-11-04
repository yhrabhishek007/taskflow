package com.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Tasks {

	private int taskId;
	private String taskName;
	private String taskDescription;
	private int storyPoints;
	private int assignedTo;
	private String status;
	private String priority;
	private LocalDate dueDate;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;

	public Tasks() {
		super();
	}

	public Tasks(String taskName, String taskDescription, int storyPoints, int assignedTo) {

		this.taskName = taskName;
		this.taskDescription = taskDescription;
		this.storyPoints = storyPoints;
		this.assignedTo = assignedTo;
	}

	public Tasks(int taskId, String taskName, String taskDescription, int storyPoints, int assignedTo, String status,
			String priority, LocalDate dueDate, LocalDateTime createdAt, LocalDateTime updatedAt) {

		super();

		this.taskId = taskId;
		this.taskName = taskName;
		this.taskDescription = taskDescription;
		this.storyPoints = storyPoints;
		this.assignedTo = assignedTo;
		this.status = status;
		this.priority = priority;
		this.dueDate = dueDate;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getTaskDescription() {
		return taskDescription;
	}

	public void setTaskDescription(String taskDescription) {
		this.taskDescription = taskDescription;
	}

	public int getStoryPoints() {
		return storyPoints;
	}

	public void setStoryPoints(int storyPoints) {
		this.storyPoints = storyPoints;
	}

	public int getAssignedTo() {
		return assignedTo;
	}

	public void setAssignedTo(int assignedTo) {
		this.assignedTo = assignedTo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public LocalDate getDueDate() {
		return dueDate;
	}

	public void setDueDate(LocalDate dueDate) {
		this.dueDate = dueDate;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	@Override
	public String toString() {

		return "Tasks [" + "taskId=" + taskId + ", taskName='" + taskName + '\'' + ", taskDescription='"
				+ taskDescription + '\'' + ", storyPoints=" + storyPoints + ", assignedTo=" + assignedTo + ", status='"
				+ status + '\'' + ", priority='" + priority + '\'' + ", dueDate=" + dueDate + "]";
	}
}