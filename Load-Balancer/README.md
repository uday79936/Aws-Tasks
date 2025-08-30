## Deploying a Highly Available Web Application on AWS using EC2 and Load Balancer:

## 📌 Project Overview:


This project demonstrates how to deploy a highly available web application on AWS.

We provision two EC2 instances in different Availability Zones, configure them with nginx server, deploy a sample eCommerce application from GitHub, and set up an Application Load Balancer (ALB) to distribute incoming traffic.

## 🏗️ Architecture:

AWS EC2: Two virtual machines running in separate Availability Zones.

Nginx: Installed on each EC2 instance to serve web content.

GitHub Repo: Application source code pulled from GitHub into **/var/www/html/.**

Application Load Balancer (ALB): Distributes traffic across the EC2 instances.

## ⚙️ Steps to Deploy:

**1. Launch EC2 Instances:**


Go to AWS Console → EC2 → Launch Instance

Configure the following:

Name: App-Server-1, App-Server-2

AMI: ubuntu AMI

Instance Type: t2.micro (Free tier eligible)

Key Pair: Create/Select a key pair for SSH access

Security Group: Allow inbound rules for SSH (22) and HTTP (80)

Storage: Default (8GB or more)

Launch instances in two different Availability Zones (AZs) for high availability.

**2. Configure EC2 Instances:**

Connect to each instance via SSH and run the following commands:

# Install nginx
sudo apt -y update
sudo apt -y install nginx

# Start and enable httpd

sudo systemctl start nginx
sudo systemctl enable nginx

# Deploy application from GitHub:
```
sudo git clone https://github.com/Ai-TechNov/mario.git
```

Now both EC2 instances are serving the application.


## 3. Create an Application Load Balancer:


Go to AWS Console → EC2 → Load Balancers → Create Load Balancer

Choose Application Load Balancer (ALB)

Configure:

Name: App-LoadBalancer

Scheme: Internet-Facing

IP Type: IPv4

Network Mapping: Select VPC and subnets (across 2 AZs)

Security Group: Allow HTTP (80) and SSH (22)

Listener: HTTP on port 80

## 4. Create Target Group:


Go to Target Groups → Create Target Group

Configure:

Target Type: Instances

Protocol: HTTP

IP Type: IPv4

VPC: Default or custom VPC

Protocol Version: HTTP1

Health Checks: Use default HTTP check

Register both EC2 instances as targets.

Attach the Target Group to the Load Balancer.

## 5. Access the Application:


Once the Load Balancer is active, it provides a DNS Name.

## Access the app in a browser:
```
http://<ALB-DNS-Name>
```

The Load Balancer distributes traffic evenly across both EC2 instances.

## Images:

## 1. App 1 Server EC2:

<img width="1917" height="911" alt="Image" src="https://github.com/user-attachments/assets/a0924d05-24c9-4bc3-8923-86a47d30d565" />

## 2. App 1 Output:

<img width="1915" height="958" alt="Image" src="https://github.com/user-attachments/assets/2a1ae2f0-c28d-40c9-be3d-e3e247339610" />

## 3. App 2 Server EC2:

<img width="1912" height="915" alt="Image" src="https://github.com/user-attachments/assets/dfa93213-c8c3-4427-8137-4dc53a15aa1e" />

## 4. APP 2 Output:

<img width="1912" height="947" alt="Image" src="https://github.com/user-attachments/assets/d9d0221e-8e28-432b-9af7-a6e129b00ac1" />

## ✅ Outcome:

Highly available eCommerce web application hosted on AWS EC2

Load Balancer ensures fault tolerance and scalability

Application can be accessed via ALB DNS instead of individual EC2 IPs
```
📂 Repository Structure
├── README.md          # Project Documentation
├── setup-commands.sh  # Script for EC2 setup (httpd + git clone)
```
## 🚀 Future Improvements:

Configure HTTPS using SSL/TLS certificates with ACM.

Use Auto Scaling Group (ASG) for scaling based on load.

Use S3 + CloudFront for static content hosting.

Integrate RDS for backend database support.

## Author:

**Uday Sairam Kommineni**

**Aws Cloud Practioner**

**Mail-Id:** saikommineni5@gmail.com

**Linkedin-URL:** https://www.linkedin.com/in/uday-sai-ram-kommineni-uday-sai-ram/
