<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>TaskFlow | Sign In</title>

<link rel="stylesheet" href="login.css">

</head>

<body>

	<div class="page">

		<!-- ================= LEFT SECTION ================= -->

		<section class="hero-section">

			<!-- Decorative shapes -->
			<div class="circle circle-one"></div>
			<div class="circle circle-two"></div>

			<!-- Brand -->

			<div class="brand">

				<div class="brand-icon">✓</div>

				<div>
					<div class="brand-name">
						Task<span>Flow</span>
					</div>

					<div class="brand-tagline">PLAN &nbsp;•&nbsp; TRACK
						&nbsp;•&nbsp; ACHIEVE</div>
				</div>

			</div>


			<!-- Hero Content -->

			<div class="hero-content">

				<div class="small-label">TASK MANAGEMENT SYSTEM</div>

				<h1>
					Turn Your <br> Tasks Into <span>Progress.</span>
				</h1>

				<p class="hero-description">Stay organized, collaborate with
					your team, and get things done — all in one place.</p>


				<!-- Features -->

				<div class="features">

					<div class="feature">

						<div class="feature-icon">✓</div>

						<div>
							<h3>Organize</h3>

							<p>Keep all your tasks in one place</p>
						</div>

					</div>


					<div class="feature">

						<div class="feature-icon">+</div>

						<div>
							<h3>Collaborate</h3>

							<p>Work together with your team</p>
						</div>

					</div>


					<div class="feature">

						<div class="feature-icon">↗</div>

						<div>
							<h3>Track Progress</h3>

							<p>Monitor and achieve your goals</p>
						</div>

					</div>

				</div>


				<!-- Quote -->

				<div class="quote">

					<div class="quote-line"></div>

					<p>
						"Small steps every day <br> lead to big results."
					</p>

				</div>

			</div>


			<!-- Decorative Workspace -->

			<div class="workspace">

				<div class="desk">

					<div class="notebook"></div>

					<div class="pen"></div>

					<div class="coffee">
						<div class="coffee-handle"></div>
					</div>

				</div>

			</div>

		</section>


		<!-- ================= RIGHT SECTION ================= -->

		<section class="login-section">


			<!-- Top register link -->

			<div class="top-register">

				<span> New here? </span> <a href="register.jsp"> Create an
					account <span class="arrow">→</span>
				</a>

			</div>


			<!-- Login Card -->

			<div class="login-card">


				<!-- Login Brand -->

				<div class="login-brand">

					<div class="login-brand-icon">✓</div>

					<span> Task<span>Flow</span>
					</span>

				</div>


				<h2>Welcome back</h2>

				<p class="login-subtitle">Sign in to continue to your workspace
				</p>


				<!-- Error Message -->

				<%
				String error = request.getParameter("error");

				if ("invalid".equals(error)) {
				%>

				<div class="error-message">Invalid email or password.</div>

				<%
				} else if ("empty".equals(error)) {
				%>

				<div class="error-message">Please enter your email and
					password.</div>

				<%
				}
				%>


				<!-- Login Form -->

				<form action="login" method="post" class="login-form">


					<!-- Email -->

					<div class="form-group">

						<label for="email"> Email </label>

						<div class="input-wrapper">

							<span class="input-icon"> @ </span> <input type="email"
								id="email" name="email" placeholder="you@example.com" required>

						</div>

					</div>


					<!-- Password -->

					<div class="form-group">

						<div class="password-label">

							<label for="password"> Password </label> <a href="#"> Forgot
								password? </a>

						</div>


						<div class="input-wrapper">

							<span class="input-icon"> ● </span> <input type="password"
								id="password" name="password" placeholder="Enter your password"
								required>

							<button type="button" class="show-password"
								onclick="togglePassword()">◉</button>

						</div>

					</div>


					<!-- Remember Me -->

					<div class="form-options">

						<label class="remember"> <input type="checkbox"
							name="remember"> <span class="custom-checkbox"></span>

							Remember me

						</label>

					</div>


					<!-- Sign In -->

					<button type="submit" class="sign-in-button">

						<span> Sign In </span> <span class="button-arrow"> → </span>

					</button>


					<!-- Divider -->

					<div class="divider">

						<span></span>

						<p>OR</p>

						<span></span>

					</div>


					<!-- Google -->

					<button type="button" class="google-button">

						<span class="google-icon"> G </span> Continue with Google

					</button>


				</form>


				<!-- Register -->

				<div class="create-account">

					Don't have an account? <a href="register.jsp"> Create account </a>

				</div>

			</div>


			<!-- Footer -->

			<div class="login-footer">© 2026 TaskFlow. All rights reserved.

			</div>

		</section>

	</div>


	<!-- Password Script -->

	<script>
		function togglePassword() {

			const password = document.getElementById("password");

			const button = document.querySelector(".show-password");

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