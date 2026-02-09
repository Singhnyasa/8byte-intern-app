ABOUT
-------------------------------------------------------------------------------------------

This is a demo project for practicing a containerized Node.js application deployed on AWS EC2 using Docker, Terraform, and GitHub Actions CI pipeline.


PROJECT OVERVIEW
---------------------------------------------------------------------------------------------

This project demonstrates a complete DEVOPS OBERFLOW
- Application containerization using DOCKER
- Infrastructure provisioning using TERRAFORM
- Continuous integration using GITHUB ACTIONS
- Deployment on AWS EC2


Application Deployment Locally
---------------------------------------------------------------------------------------------

-Install dependencies
 npm install

-Start the application
 node app.js

-Application will be available at
 http://localhost:3000
 

BUILD AND RUN DOCKER IMAGE LOCALLY
---------------------------------------------------------------------------------------------

-Build Docker Image
docker build -t 8byte-intern-app .

-Run Docker container
docker run -p 3000:3000 8byte-intern-app

-Access the app at:
http://localhost:3000


PROVISION INFRASTRUCTURE USING TERRAFORM
----------------------------------------------------------------------------------------------

-Navigate to Terraform directory
cd terraform

-Initialize Terraform
terraform init

-Review execution plan
terraform init

-Apply configuration
terraform apply

DEPLOY APPLICATION ON EC2
-----------------------------------------------------------------------------------------------

-ssh on ec2
ssh -i my-key.pem ubuntu@23.22.166.6:3000

-Pull Docker image
docker pull nyasa/8byte-intern-app:latest

-Run the application conatiner
docker run -p 3000:3000 8byte-intern-app

-Access application at:
http://23.22.166.6:3000


GITHUB ACTIONS CI PIPELINE
--------------------------------------------------------------------------------------------------

.github/workflows/ci.yml




