<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.model.Tasks"%>

<%
Tasks task = (Tasks) request.getAttribute("task");

if (task == null) {

	response.sendRedirect("taskshome?error=notFound");

	return;
}
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>TaskFlow | Edit Task</title>

<link rel="stylesheet" href="updateTask.css">

</head>

<body>


	<!-- ================= TOPBAR ================= -->

	<header class="topbar">

		<a href="taskshome" class="brand">

			<div class="brand-icon">✓</div>

			<div>

				<div class="brand-name">
					Task<span>Flow</span>
				</div>

				<div class="brand-caption">WORKSPACE</div>

			</div>

		</a> <a href="taskshome" class="back-link"> ← Back to Dashboard </a>

	</header>


	<!-- ================= MAIN ================= -->

	<main class="page-container">


		<div class="eyebrow">
			TASK #<%=task.getTaskId()%>
			/ EDIT
		</div>


		<h1>Refine the task.</h1>

		<p class="intro">Make the changes you need. Your task history
			stays connected to the same task.</p>


		<section class="edit-layout">


			<!-- ================= FORM ================= -->

			<div class="form-card">

				<form action="updateTask" method="post">


					<input type="hidden" name="taskId" value="<%=task.getTaskId()%>">


					<!-- Name -->

					<div class="field">

						<label> Task name </label> <input type="text" name="taskName"
							value="<%=task.getTaskName()%>" required>

					</div>


					<!-- Description -->

					<div class="field">

						<label> Description </label>

						<textarea name="taskDescription" required><%=task.getTaskDescription() != null ? task.getTaskDescription() : ""%></textarea>

					</div>


					<!-- Numbers -->

					<div class="field-grid">


						<div class="field">

							<label> Story points </label> <input type="number"
								name="storyPoints" min="1" max="13"
								value="<%=task.getStoryPoints()%>" required>

						</div>


						<div class="field">

							<label> Assigned to </label> <input type="number"
								name="assignedTo" value="<%=task.getAssignedTo()%>" required>

						</div>

					</div>


					<!-- Status / Priority -->

					<div class="field-grid">


						<div class="field">

							<label> Status </label> <select name="status">

								<option value="TODO"
									<%="TODO".equals(task.getStatus()) ? "selected" : ""%>>

									To Do</option>

								<option value="IN_PROGRESS"
									<%="IN_PROGRESS".equals(task.getStatus()) ? "selected" : ""%>>

									In Progress</option>

								<option value="DONE"
									<%="DONE".equals(task.getStatus()) ? "selected" : ""%>>

									Done</option>

							</select>

						</div>


						<div class="field">

							<label> Priority </label> <select name="priority">

								<option value="LOW"
									<%="LOW".equals(task.getPriority()) ? "selected" : ""%>>

									Low</option>

								<option value="MEDIUM"
									<%="MEDIUM".equals(task.getPriority()) ? "selected" : ""%>>

									Medium</option>

								<option value="HIGH"
									<%="HIGH".equals(task.getPriority()) ? "selected" : ""%>>

									High</option>

							</select>

						</div>

					</div>


					<!-- Due -->

					<div class="field">

						<label> Due date </label> <input type="date" name="dueDate"
							value="<%=task.getDueDate() != null ? task.getDueDate() : ""%>">

					</div>


					<!-- Buttons -->

					<div class="form-actions">

						<a href="taskshome"> Cancel </a>

						<button type="submit">Save Changes →</button>

					</div>


				</form>

			</div>


			<!-- ================= RADAR ================= -->

			<aside class="radar">


				<div class="radar-header">

					<span> CHANGE RADAR </span>

					<div class="radar-circle">✓</div>

				</div>


				<h2>Task snapshot</h2>

				<p>You're editing an existing piece of work.</p>


				<!-- Current -->

				<div class="snapshot">

					<span> CURRENT STATE </span>

					<div class="snapshot-row">

						<strong> Status </strong> <em> <%=task.getStatus()%>
						</em>

					</div>


					<div class="snapshot-row">

						<strong> Priority </strong> <em> <%=task.getPriority()%>
						</em>

					</div>


					<div class="snapshot-row">

						<strong> Effort </strong> <em> <%=task.getStoryPoints()%>
							pts
						</em>

					</div>

				</div>


				<!-- Task ID -->

				<div class="task-id-box">

					<span> TASK IDENTIFIER </span> <strong> #<%=task.getTaskId()%>
					</strong>

				</div>


				<div class="edit-tip">

					<span> ✦ </span>

					<p>Changing the priority or deadline can significantly change
						how this task should be approached.</p>

				</div>


			</aside>


		</section>

	</main>

</body>

</html>