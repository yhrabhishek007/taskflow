<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>TaskFlow | Create Task</title>

<link rel="stylesheet" href="createTask.css">

</head>

<body>

	<!-- ================= TOP BAR ================= -->

	<header class="topbar">

		<a href="taskshome" class="brand">

			<div class="brand-icon">✓</div>

			<div>

				<div class="brand-name">
					Task<span>Flow</span>
				</div>

				<div class="brand-caption">WORKSPACE</div>

			</div>

		</a>


		<div class="top-actions">

			<a href="taskshome" class="back-link"> ← Dashboard </a>

			<button type="button" class="focus-button"
				onclick="toggleFocusMode()">◉ Focus Mode</button>

		</div>

	</header>


	<!-- ================= MAIN ================= -->

	<main class="page-container">


		<!-- Heading -->

		<section class="page-heading">

			<div>

				<div class="eyebrow">TASK CREATION</div>

				<h1>
					Create something <span>worth finishing.</span>
				</h1>

				<p>Define the task clearly. TaskFlow will help you understand
					the effort, priority and deadline.</p>

			</div>


			<div class="task-number">

				<span> NEW TASK </span> <strong> # </strong>

			</div>

		</section>


		<!-- ================= WORKSPACE ================= -->

		<section class="creation-workspace">


			<!-- ================= FORM ================= -->

			<div class="form-panel">


				<form action="createTask" method="post" id="taskForm">


					<!-- Task name -->

					<div class="field">

						<label for="taskName"> Task name </label> <input type="text"
							id="taskName" name="taskName"
							placeholder="e.g. Design the authentication flow" maxlength="100"
							required>

						<div class="field-hint">Give your task a clear,
							action-oriented name.</div>

					</div>


					<!-- Description -->

					<div class="field">

						<div class="label-row">

							<label for="taskDescription"> Description </label> <span
								id="characterCount"> 0 / 500 </span>

						</div>

						<textarea id="taskDescription" name="taskDescription"
							maxlength="500"
							placeholder="What needs to be done? Add useful context for yourself or your team."
							required></textarea>

					</div>


					<!-- Two columns -->

					<div class="field-grid">


						<!-- Story points -->

						<div class="field">

							<label for="storyPoints"> Story points </label> <input
								type="number" id="storyPoints" name="storyPoints" min="1"
								max="13" value="3" required>

							<div class="effort-meter">

								<div class="effort-track">

									<div id="effortProgress" class="effort-progress"></div>

								</div>

								<span id="effortText"> Moderate effort </span>

							</div>

						</div>


						<!-- Assigned -->

						<div class="field">

							<label for="assignedTo"> Assigned to </label> <input
								type="number" id="assignedTo" name="assignedTo"
								placeholder="User ID" required>

							<div class="field-hint">Enter the team member ID.</div>

						</div>

					</div>


					<!-- Status / Priority -->

					<div class="field-grid">


						<div class="field">

							<label for="status"> Status </label> <select id="status"
								name="status" required>

								<option value="TODO">To Do</option>

								<option value="IN_PROGRESS">In Progress</option>

								<option value="DONE">Done</option>

							</select>

						</div>


						<div class="field">

							<label for="priority"> Priority </label> <select id="priority"
								name="priority" required>

								<option value="LOW">Low</option>

								<option value="MEDIUM" selected>Medium</option>

								<option value="HIGH">High</option>

							</select>

						</div>


					</div>


					<!-- Due date -->

					<div class="field">

						<label for="dueDate"> Due date </label>

						<div class="date-wrapper">

							<input type="date" id="dueDate" name="dueDate"> <span
								id="dateMessage" class="date-message"> No deadline
								selected </span>

						</div>

					</div>


					<!-- Bottom -->

					<div class="form-footer">

						<a href="taskshome" class="cancel-button"> Cancel </a>

						<button type="submit" class="create-button">

							Create Task <span> → </span>

						</button>

					</div>


				</form>

			</div>


			<!-- ================= LIVE PREVIEW ================= -->

			<aside class="preview-panel">


				<div class="preview-header">

					<div>

						<span> LIVE PREVIEW </span>

						<h2>Task DNA</h2>

					</div>

					<div class="live-dot">LIVE</div>

				</div>


				<!-- Preview Card -->

				<div class="preview-card">


					<div class="preview-top">

						<span id="previewStatus" class="preview-status"> TO DO </span> <span
							id="previewPriority" class="preview-priority"> MEDIUM </span>

					</div>


					<h3 id="previewName">Your task name</h3>


					<p id="previewDescription">Your task description will appear
						here.</p>


					<div class="preview-meta">


						<div>

							<span> EFFORT </span> <strong id="previewPoints"> 3 pts
							</strong>

						</div>


						<div>

							<span> ASSIGNED </span> <strong id="previewAssignee">
								User — </strong>

						</div>


						<div>

							<span> DEADLINE </span> <strong id="previewDate"> — </strong>

						</div>


					</div>


					<!-- Progress -->

					<div class="preview-progress">

						<div class="progress-label">

							<span> TASK READINESS </span> <strong id="readiness">
								40% </strong>

						</div>

						<div class="progress-track">

							<div id="readinessBar" class="progress-bar"></div>

						</div>

					</div>

				</div>


				<!-- Insight -->

				<div class="insight">

					<div class="insight-symbol">✦</div>

					<div>

						<strong> TaskFlow insight </strong>

						<p id="insightText">A clear task description makes execution
							easier.</p>

					</div>

				</div>


				<!-- Shortcut -->

				<div class="shortcut">

					<span> TIP </span>

					<p>
						Press
						<kbd>F</kbd>
						to toggle Focus Mode
					</p>

				</div>


			</aside>

		</section>

	</main>


	<script>
		/* ================= ELEMENTS ================= */

		const taskName = document.getElementById("taskName");

		const description = document.getElementById("taskDescription");

		const storyPoints = document.getElementById("storyPoints");

		const assignedTo = document.getElementById("assignedTo");

		const status = document.getElementById("status");

		const priority = document.getElementById("priority");

		const dueDate = document.getElementById("dueDate");

		/* ================= PREVIEW ================= */

		function updatePreview() {

			document.getElementById("previewName").textContent = taskName.value
					.trim()
					|| "Your task name";

			document.getElementById("previewDescription").textContent = description.value
					.trim()
					|| "Your task description will appear here.";

			document.getElementById("previewPoints").textContent = (storyPoints.value || 0)
					+ " pts";

			document.getElementById("previewAssignee").textContent = assignedTo.value ? "User #"
					+ assignedTo.value
					: "User —";

			document.getElementById("previewStatus").textContent = status.value
					.replace("_", " ");

			document.getElementById("previewPriority").textContent = priority.value;

			updateEffort();

			updateDate();

			updateReadiness();

			updateInsight();

		}

		/* ================= CHARACTER COUNT ================= */

		description
				.addEventListener(
						"input",
						function() {

							document.getElementById("characterCount").textContent = this.value.length
									+ " / 500";

							updatePreview();

						});

		/* ================= EFFORT ================= */

		function updateEffort() {

			let points = parseInt(storyPoints.value) || 0;

			let percentage = Math.min((points / 13) * 100, 100);

			document.getElementById("effortProgress").style.width = percentage
					+ "%";

			let text = "Moderate effort";

			if (points <= 2) {
				text = "Quick task";
			} else if (points <= 5) {
				text = "Moderate effort";
			} else if (points <= 8) {
				text = "Large task";
			} else {
				text = "Major effort";
			}

			document.getElementById("effortText").textContent = text;

		}

		storyPoints.addEventListener("input", updatePreview);

		/* ================= DATE ================= */

		function updateDate() {

			if (!dueDate.value) {

				document.getElementById("dateMessage").textContent = "No deadline selected";

				document.getElementById("previewDate").textContent = "—";

				return;
			}

			const selected = new Date(dueDate.value + "T00:00:00");

			const today = new Date();

			today.setHours(0, 0, 0, 0);

			const difference = Math.ceil((selected - today)
					/ (1000 * 60 * 60 * 24));

			let message = "";

			if (difference < 0) {
				message = "Deadline has passed";
			} else if (difference === 0) {
				message = "Due today";
			} else if (difference === 1) {
				message = "Due tomorrow";
			} else {
				message = difference + " days remaining";
			}

			document.getElementById("dateMessage").textContent = message;

			document.getElementById("previewDate").textContent = selected
					.toLocaleDateString("en-IN", {
						day : "2-digit",
						month : "short"
					});

		}

		dueDate.addEventListener("change", updatePreview);

		/* ================= READINESS ================= */

		function updateReadiness() {

			let score = 0;

			if (taskName.value.trim()) {
				score += 25;
			}

			if (description.value.trim().length >= 20) {
				score += 25;
			}

			if (assignedTo.value) {
				score += 20;
			}

			if (dueDate.value) {
				score += 15;
			}

			if (priority.value) {
				score += 15;
			}

			document.getElementById("readiness").textContent = score + "%";

			document.getElementById("readinessBar").style.width = score + "%";

		}

		/* ================= INSIGHT ================= */

		function updateInsight() {

			const text = document.getElementById("insightText");

			if (storyPoints.value >= 8) {

				text.textContent = "This looks like a large task. Consider breaking it into smaller tasks.";

			} else if (priority.value === "HIGH") {

				text.textContent = "High-priority work should have a clear owner and deadline.";

			} else if (dueDate.value) {

				text.textContent = "You have given this task a deadline. Nice — now you have a target.";

			} else {

				text.textContent = "A clear task description makes execution easier.";

			}

		}

		/* ================= INPUT EVENTS ================= */

		[ taskName, assignedTo, status, priority ].forEach(function(element) {

			element.addEventListener("input", updatePreview);

			element.addEventListener("change", updatePreview);

		});

		/* ================= FOCUS MODE ================= */

		function toggleFocusMode() {

			document.body.classList.toggle("focus-mode");

		}

		/* Keyboard shortcut */

		document.addEventListener("keydown", function(event) {

			if (event.key.toLowerCase() === "f"
					&& ![ "INPUT", "TEXTAREA", "SELECT" ]
							.includes(document.activeElement.tagName)) {

				toggleFocusMode();

			}

		});

		/* Initial */

		updatePreview();
	</script>

</body>

</html>