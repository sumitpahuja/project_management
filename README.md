Project Management Application:

This application will help you in managing projects. Project manager can create new projects, tasks and assign tasks to developers. Developer can update status of his/her tasks.

Project manager can also check graphical representation of projects status and also developers tasks status.

<div align="center">
    <img src="https://i.postimg.cc/pLbVh6NG/graph.png" width="400px"</img> 
</div>

For this project, we need below technology stack:

- Ruby Version: 2.4.0
- Rails Version: 5.2.3
- Database: MySql (version 8.0 will be best, lower version will also work.)


Steps to setup this project:

1. Clone this project.
2. Go inside project root on terminal.
3. bundle install.
4. rake db:create
5. rake db:migrate
6. rake db:seed

Steps to use this application:
1. Go to "http://localhost:3000".
2. To Sign-in as admin use these authentication details: "admin@gmail.com : 123456"
3. After admin login - you can create project, tasks, assign tasks to developer and check status of developers work and project.
4. To Sign-in as developer use these authentication details: "developer@gmail.com : 123456"
5. After login as developer you can check your tasks and update status of your tasks.


More:

To create a new admin user, you can use below rake task: 
rake users:create_admin

To create a new developer, you can sign up from below URL:
http://localhost:3000/users/sign_up




Thanks
sumit.pahuja1@gmail.com