<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>TaskFlow | Create Account</title>

<link rel="stylesheet" href="register.css">

</head>

<body>

	<div class="register-page">

		<!-- ================= LEFT SIDE ================= -->

		<section class="register-hero">

			<div class="hero-circle"></div>

			<!-- Brand -->

			<div class="brand">

				<div class="brand-icon">✓</div>

				<div>

					<div class="brand-name">
						Task<span>Flow</span>
					</div>

					<div class="brand-tagline">PLAN • TRACK • ACHIEVE</div>

				</div>

			</div>


			<!-- Hero content -->

			<div class="hero-content">

				<span class="eyebrow"> TASK MANAGEMENT SYSTEM </span>

				<h1>
					Build Better <br> Habits, Get <br> <span>More
						Done.</span>
				</h1>

				<p>Join TaskFlow and start organizing your work, collaborating
					with your team, and achieving your goals — all in one place.</p>


				<!-- Features -->

				<div class="features">

					<div class="feature">

						<div class="feature-icon">✓</div>

						<div>
							<h3>Stay Organized</h3>
							<p>Keep track of your tasks and deadlines</p>
						</div>

					</div>


					<div class="feature">

						<div class="feature-icon">+</div>

						<div>
							<h3>Work Together</h3>
							<p>Collaborate with your team</p>
						</div>

					</div>


					<div class="feature">

						<div class="feature-icon">↗</div>

						<div>
							<h3>Achieve More</h3>
							<p>Track progress and reach your goals</p>
						</div>

					</div>

				</div>


				<div class="quote">

					<div></div>

					<p>
						"Small steps every day <br> lead to big results."
					</p>

				</div>

			</div>


			<!-- Decorative desk -->

			<div class="desk">

				<div class="notebook"></div>

				<div class="coffee"></div>

				<div class="plant">

					<span></span> <span></span> <span></span> <span></span>

				</div>

			</div>

		</section>


		<!-- ================= RIGHT SIDE ================= -->

		<section class="register-section">


			<!-- Top login -->

			<div class="top-login">

				Already have an account? <a href="login.jsp"> Sign in → </a>

			</div>


			<!-- Register Card -->

			<div class="register-card">


				<!-- Logo -->

				<div class="register-brand">

					<div class="register-brand-icon">✓</div>

					<div>

						Task<span>Flow</span>

					</div>

				</div>


				<h2>Create your account</h2>

				<p class="subtitle">Start managing your tasks today</p>


				<!-- Error -->

				<%
				String error = request.getParameter("error");

				if ("exists".equals(error)) {
				%>

				<div class="error-message">An account with this email already
					exists.</div>

				<%
				} else if ("failed".equals(error)) {
				%>

				<div class="error-message">Registration failed. Please try
					again.</div>

				<%
				} else if ("empty".equals(error)) {
				%>

				<div class="error-message">Please fill in all fields.</div>

				<%
				}
				%>


				<!-- FORM -->

				<form action="register" method="post" class="register-form">


					<!-- Name -->

					<div class="form-group">

						<label for="name"> Full Name </label> <input type="text" id="name"
							name="name" placeholder="John Doe" required>

					</div>


					<!-- Email -->

					<div class="form-group">

						<label for="email"> Email </label> <input type="email" id="email"
							name="email" placeholder="you@example.com" required>

					</div>


					<!-- Password -->

					<div class="form-group">

						<label for="password"> Password </label>

						<div class="password-wrapper">

							<input type="password" id="password" name="password"
								placeholder="Create a password" required>

							<button type="button" onclick="togglePassword()"
								class="password-button">◉</button>

						</div>

					</div>


					<!-- Role -->

					<div class="form-group">

						<label for="role"> Role </label> <select id="role" name="role"
							required>

							<option value="">Select role</option>

							<option value="USER">User</option>

							<option value="MANAGER">Manager</option>

						</select>

					</div>


					<!-- Submit -->

					<button type="submit" class="create-button">

						Create Account <span> → </span>

					</button>

				</form>


				<!-- Login -->

				<div class="signin-text">

					Already have an account? <a href="login.jsp"> Sign in </a>

				</div>

			</div>


			<div class="footer">© 2026 TaskFlow. All rights reserved.</div>

		</section>

	</div>


	<script>
		function togglePassword() {

			const password = document.getElementById("password");

			const button = document.querySelector(".password-button");

			if (password.type === "password") {

				password.type = "text";
				button.textContent = "○";

			} else {

				password.type = "password";
				button.textContent = "◉";

			}

		}
	</script>

</body>

</html>