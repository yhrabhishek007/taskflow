<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.model.Tasks"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>TaskFlow | Dashboard</title>

<link rel="stylesheet" href="dashboard.css">

</head>

<body>


	<%
	List<Tasks> allTasks = (List<Tasks>) request.getAttribute("allTasks");

	if (allTasks == null) {
		allTasks = new java.util.ArrayList<Tasks>();
	}

	int totalTasks = allTasks.size();

	int todoCount = 0;
	int progressCount = 0;
	int completedCount = 0;

	for (Tasks task : allTasks) {

		if ("TODO".equalsIgnoreCase(task.getStatus())) {
			todoCount++;
		}

		if ("IN_PROGRESS".equalsIgnoreCase(task.getStatus())) {
			progressCount++;
		}

		if ("DONE".equalsIgnoreCase(task.getStatus())) {
			completedCount++;
		}
	}
	%>


	<!-- ================= SIDEBAR ================= -->

	<aside class="sidebar">


		<!-- Logo -->

		<div class="sidebar-logo">

			<div class="logo-icon">✓</div>

			<div>

				<div class="logo-name">
					Task<span>Flow</span>
				</div>

				<div class="logo-small">WORKSPACE</div>

			</div>

		</div>


		<!-- Navigation -->

		<nav class="navigation">

			<a href="taskshome" class="nav-item active"> <span>⌂</span>

				Dashboard

			</a> <a href="taskshome" class="nav-item"> <span>✓</span> My Tasks

			</a> <a href="createTask.jsp" class="nav-item"> <span>＋</span> Create
				Task

			</a>

		</nav>


		<!-- Bottom -->

		<div class="sidebar-bottom">

			<a href="#" class="nav-item"> <span>⚙</span> Settings
			</a> <a href="login.jsp" class="nav-item logout"> <span>↪</span>
				Logout
			</a>

		</div>

	</aside>


	<!-- ================= MAIN ================= -->

	<main class="main-content">


		<!-- Header -->

		<header class="topbar">

			<div>

				<p class="breadcrumb">Workspace / Dashboard</p>

				<h1>Dashboard</h1>

			</div>


			<div class="user-area">

				<div class="user-avatar">
					<%=session.getAttribute("userEmail") != null
		? session.getAttribute("userEmail").toString().substring(0, 1).toUpperCase()
		: "U"%>
				</div>

				<div class="user-info">

					<strong> <%=session.getAttribute("userEmail") != null ? session.getAttribute("userEmail") : "User"%>
					</strong> <span> Workspace </span>

				</div>

			</div>

		</header>


		<!-- Welcome -->

		<section class="welcome">

			<div>

				<p class="welcome-label">YOUR WORKSPACE</p>

				<h2>Let's get things done.</h2>

				<p>Organize your work, track your progress, and stay focused on
					what matters.</p>

			</div>


			<a href="createTask.jsp" class="add-task-button"> + Add New Task

			</a>

		</section>


		<!-- ================= STATISTICS ================= -->

		<section class="stats">


			<div class="stat-card">

				<div class="stat-top">

					<span> Total Tasks </span>

					<div class="stat-icon">#</div>

				</div>

				<strong> <%=totalTasks%>
				</strong>

				<p>All your tasks</p>

			</div>


			<div class="stat-card">

				<div class="stat-top">

					<span> To Do </span>

					<div class="stat-icon">○</div>

				</div>

				<strong> <%=todoCount%>
				</strong>

				<p>Tasks waiting</p>

			</div>


			<div class="stat-card">

				<div class="stat-top">

					<span> In Progress </span>

					<div class="stat-icon">◐</div>

				</div>

				<strong> <%=progressCount%>
				</strong>

				<p>Currently working</p>

			</div>


			<div class="stat-card">

				<div class="stat-top">

					<span> Completed </span>

					<div class="stat-icon">✓</div>

				</div>

				<strong> <%=completedCount%>
				</strong>

				<p>Finished tasks</p>

			</div>


		</section>

		<section class="focus-strip">

			<div class="focus-symbol">◉</div>

			<div class="focus-content">

				<span> TODAY'S FOCUS </span>

				<h3>Keep momentum. Finish what matters.</h3>

				<p>Use your priority and deadline filters to decide what
					deserves your attention next.</p>

			</div>

			<button type="button"
				onclick="document.getElementById('taskSearch').focus()">

				Find a task →</button>

		</section>


		<!-- ================= TASKS ================= -->

		<section class="tasks-section">


			<div class="section-header">

				<div>

					<p>WORKSPACE</p>

					<h2>My Tasks</h2>

				</div>


				<a href="createTask.jsp" class="small-add-button"> + New Task </a>

			</div>


			<!-- Search -->

			<div class="task-tools">

				<input type="text" id="taskSearch" placeholder="Search tasks...">


				<select id="statusFilter">

					<option value="all">All Status</option>

					<option value="TODO">To Do</option>

					<option value="IN_PROGRESS">In Progress</option>

					<option value="DONE">Done</option>

				</select> <select id="priorityFilter">

					<option value="all">All Priority</option>

					<option value="HIGH">High</option>

					<option value="MEDIUM">Medium</option>

					<option value="LOW">Low</option>

				</select>

			</div>


			<!-- Task table -->

			<div class="table-container">

				<table>

					<thead>

						<tr>

							<th>TASK</th>

							<th>ASSIGNED TO</th>

							<th>STATUS</th>

							<th>PRIORITY</th>

							<th>DUE DATE</th>

							<th>ACTIONS</th>

						</tr>

					</thead>


					<tbody id="taskTableBody">


						<%
						if (allTasks.isEmpty()) {
						%>

						<tr>

							<td colspan="6" class="empty-state">

								<div class="empty-icon">✓</div>

								<h3>No tasks yet</h3>

								<p>Create your first task to get started.</p> <a
								href="createTask.jsp"> Create Task → </a>

							</td>

						</tr>

						<%
						} else {

						for (Tasks task : allTasks) {
						%>


						<tr data-status="<%=task.getStatus()%>"
							data-priority="<%=task.getPriority()%>">


							<!-- Task -->

							<td>

								<div class="task-name">

									<strong> <%=task.getTaskName()%>
									</strong> <span> <%=task.getTaskDescription() != null ? task.getTaskDescription() : ""%>
									</span>

								</div>

							</td>


							<!-- Assigned -->

							<td><span class="assigned"> User #<%=task.getAssignedTo()%>
							</span></td>


							<!-- Status -->

							<td><span
								class="status
                                <%=task.getStatus() != null ? task.getStatus().toLowerCase() : ""%>">

									<%=task.getStatus()%>

							</span></td>


							<!-- Priority -->

							<td><span
								class="priority
                                <%=task.getPriority() != null ? task.getPriority().toLowerCase() : ""%>">

									<%=task.getPriority()%>

							</span></td>


							<!-- Due -->

							<td><span class="due-date"> <%=task.getDueDate() != null ? task.getDueDate() : "No deadline"%>

							</span></td>


							<!-- Actions -->

							<td>

								<div class="actions">

									<a href="updateTask?id=<%=task.getTaskId()%>" class="edit">

										Edit </a> <a href="deleteTask?id=<%=task.getTaskId()%>"
										class="delete"
										onclick="return confirm('Are you sure you want to delete this task?');">

										Delete </a>

								</div>

							</td>


						</tr>


						<%
						}

						}
						%>


					</tbody>

				</table>

			</div>

		</section>


	</main>


	<script>
		const search = document.getElementById("taskSearch");

		const statusFilter = document.getElementById("statusFilter");

		const priorityFilter = document.getElementById("priorityFilter");

		const rows = document
				.querySelectorAll("#taskTableBody tr[data-status]");

		function filterTasks() {

			const searchValue = search.value.toLowerCase();

			const statusValue = statusFilter.value;

			const priorityValue = priorityFilter.value;

			rows.forEach(function(row) {

				const text = row.innerText.toLowerCase();

				const status = row.dataset.status;

				const priority = row.dataset.priority;

				const matchesSearch = text.includes(searchValue);

				const matchesStatus = statusValue === "all"
						|| status === statusValue;

				const matchesPriority = priorityValue === "all"
						|| priority === priorityValue;

				row.style.display = matchesSearch && matchesStatus
						&& matchesPriority ? "" : "none";

			});

		}

		search.addEventListener("input", filterTasks);

		statusFilter.addEventListener("change", filterTasks);

		priorityFilter.addEventListener("change", filterTasks);
	</script>


</body>

</html>