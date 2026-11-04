🚀 TaskForge – Task Management System
📌 Project Overview
TaskForge is a Java-based web application for managing team tasks. It is inspired by task-tracking tools such as JIRA and helps users create, assign, view, and organize tasks in one place.
The project demonstrates web application development using:
Java
Servlets
JSP
JDBC
MySQL
HTML and CSS
DAO Design Pattern
MVC Architecture
The application follows a layered structure: the Servlet handles incoming requests, model classes represent task data, and the DAO layer performs database operations.
---
🎯 Project Objectives
The application supports task-management workflows such as:
Creating tasks
Assigning tasks to team members
Adding task descriptions
Defining story points
Saving task information in MySQL
Viewing tasks from a centralized page
> Features listed as future enhancements below are not necessarily implemented in the current version.
---
🏗️ Architecture
The project uses an MVC + DAO approach.
```text
              USER
                |
                v
            HTML / JSP
                |
                v
       +------------------+
       |     SERVLET      |
       |    Controller    |
       +------------------+
                |
                v
           MODEL / DTO
                |
                v
       +------------------+
       |       DAO        |
       |     TaskDAO      |
       +------------------+
                |
                v
               JDBC
                |
                v
       +------------------+
       |      MySQL       |
       |     Database     |
       +------------------+
```
Request Flow
The user submits a task form from a JSP page.
The Servlet reads the request parameters.
The Servlet creates a task model object.
The Servlet calls the DAO method.
The DAO uses JDBC to execute SQL against MySQL.
The application redirects or forwards the user to the task list page.
---
🛠️ Technologies Used
Technology	Purpose
Java	Application logic
Servlets	HTTP request handling
JSP	Dynamic web pages
HTML / CSS	Page structure and styling
JDBC	Database connectivity
MySQL	Data persistence
Apache Tomcat	Servlet container
DAO Pattern	Separation of database operations
MVC	Separation of application responsibilities
Maven	Dependency management, if configured in the project
---
📂 Project Structure
The exact package and file names may vary depending on the current Eclipse project structure.
```text
TaskForge
├── src/main/java
│   ├── controller
│   │   └── CreateTaskServlet.java
│   ├── dao
│   │   └── TaskDAO.java
│   ├── model
│   │   └── Tasks.java
│   └── util
│       └── DBConnection.java
├── src/main/webapp
│   ├── create-task.jsp
│   ├── tasks-home.jsp
│   └── css/
├── pom.xml
└── README.md
```
---
🗄️ Database Setup
Create a MySQL database for the application:
```sql
CREATE DATABASE taskflow;
USE taskflow;
```
An example task table based on the task fields used in this project:
```sql
CREATE TABLE tasks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    task_name VARCHAR(150) NOT NULL,
    task_description VARCHAR(500),
    story_points INT,
    assigned_to VARCHAR(100)
);
```
Example task data:
```sql
INSERT INTO tasks
    (task_name, task_description, story_points, assigned_to)
VALUES
    ('Login Module', 'Develop user login functionality', 5, 'Rahul'),
    ('Employee Dashboard', 'Develop employee dashboard', 8, 'Priya');
```
> Use the actual table and column definitions from your project's SQL/DAO code if they differ from this example.
---
🔌 JDBC Configuration
The application uses JDBC to connect to MySQL.
Example connection URL:
```text
jdbc:mysql://localhost:3306/taskflow
```
Configure the database connection in the project's `DBConnection.java` (or equivalent connection class) with your local database settings.
```text
Database : taskflow
Host     : localhost
Port     : 3306
Username : your_mysql_username
Password : your_mysql_password
```
Do not commit real database passwords or other secrets to GitHub.
---
🧩 DAO Layer
The `TaskDAO` class is responsible for database-related operations. Keeping SQL code in the DAO helps separate persistence logic from the Servlet/controller.
Typical task DAO methods may include:
```text
createTask()
getAllTasks()
getTaskById()
updateTask()
deleteTask()
```
The methods available in the current implementation depend on the project's code.
---
📋 Task Management Operations
Operation	Purpose
Create	Add a new task
Read	View saved tasks
Update	Modify task details, if implemented
Delete	Remove a task, if implemented
---
🚀 Future Enhancements
Potential improvements include:
User registration and login
Session management and role-based access
Task status and priority
Due dates and reminders
Search, filtering, and sorting
Kanban board
Sprint management
Dashboard and task statistics
Task comments and activity history
Email notifications
REST API migration with Spring Boot
Frontend migration to React
---
▶️ How to Run the Project
1. Clone the repository
```bash
git clone https://github.com/yhrabhishek007/taskflow.git
```
2. Import into Eclipse
Open Eclipse.
Select File → Import → Existing Projects into Workspace (or import as a Maven project if the project uses Maven).
Select the cloned project folder.
3. Set up MySQL
Create the database and tables using the SQL that matches the project’s DAO implementation.
4. Configure database credentials
Update the connection details in `DBConnection.java` or the equivalent configuration file.
5. Configure Apache Tomcat
Add a compatible Tomcat server in Eclipse.
Ensure the project's Servlet API version matches the server.
Add the project to the server.
6. Run the application
Start the project on Tomcat.
Open the application using the context path shown in Eclipse. For example:
```text
http://localhost:8080/TaskForge/
```
The exact URL depends on the deployed project's context root.
---
💼 Resume Description
TaskForge – Java Task Management System
Developed a Java web-based task management application using Servlets, JSP, JDBC, and MySQL. Applied MVC architecture and the DAO design pattern to separate request handling, application data, and database operations. Implemented task creation, assignment, story-point estimation, and task viewing workflows.
---
🎤 Interview Explanation
“I developed TaskForge, a Java-based task management web application using Servlets, JSP, JDBC, and MySQL. I used MVC architecture to separate the web request handling from the model and DAO layers. When a user submits a task form, the Servlet reads the details, creates a model object, and passes it to the DAO. The DAO uses JDBC to store or retrieve the task information from MySQL. This project helped me understand how a Java web application connects its UI, controller, and database.”
---
👨‍💻 Author
Abhishek
Project Technologies
Java | Servlets | JSP | JDBC | MySQL | HTML | CSS | Apache Tomcat
---
⭐ Project Tagline
> **TaskForge – Plan. Assign. Track. Deliver.**
