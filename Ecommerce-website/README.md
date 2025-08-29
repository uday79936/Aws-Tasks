# 🛍️ AWS Auto Scaling and Load Balancing for Node.js E-Commerce App

## 📌 Overview

A hands-on AWS DevOps project that demonstrates deploying a Node.js e-commerce application using EC2 instances, Application Load Balancer (ALB), Auto Scaling Group (ASG), IAM roles, and CloudWatch Alarms with SNS email notifications. The project ensures high availability, fault tolerance, and monitoring.

It ensures high availability, fault tolerance, and automated monitoring and alerting.

---

## 🛠️ Technologies & Services Used

- **Amazon EC2** – for hosting web servers
- **Elastic Load Balancer (ALB)** – to distribute traffic
- **Auto Scaling Group (ASG)** – to handle dynamic instance scaling
- **Amazon CloudWatch** – for monitoring and alerting
- **Amazon SNS** – for email notifications
- **IAM Roles** – for EC2 permissions
- **Launch Template** – for launching new EC2 instances
- **Amazon Linux AMI** – as base image for EC2
- **Node.js** – E-Commerce App backend

---

## 🌐 Architecture Overview

<img width="1536" height="1024" alt="Image" src="https://github.com/user-attachments/assets/121d9879-ac79-40f0-9cbd-e4722f745af5" />
              

---

## ⚙️ Setup Breakdown

### 1. Load Balancer: `Ecomm-A.L.B`
- Type: **Application**
- Scheme: **Internet-facing**
- Status: ✅ *Active*
- Hosted in **2 AZs** (us-east-1a, us-east-1b)
- DNS: `ecomm-alb-656131775.us-east-1.elb.amazonaws.com`

### 2. Target Group: `tg`
- Target type: **Instance**
- Protocol: **HTTP (port 80)**
- Total targets: 4
  - ✅ 1 Healthy
  - ❌ 3 Unhealthy

### 3. Auto Scaling Group: `ecomm-asg`
- Launch Template: `ecomm-asg`
- AMI: `ami-000ec6c25978d5999`
- Instance Type: `t2.micro`
- Capacity: min=2, max=4, desired=2
- Zones: **us-east-1a & us-east-1b**

### 4. Launch Template
- Name: `ecomm`
- Version: `v0.1 (Default)`
- Security Groups:
  - `sg-03cd7f12cd91ee1f0`
  - `sg-05440c9f9581e351d`
  - `sg-077a0750357b2b282`
  - `sg-0e523fb5ee345e569`
- Key Pair: `project`

### 5. IAM Role: `ecomm`
- Policies attached:
  - `AmazonEC2RoleforSSM`
  - `AmazonSNSFullAccess`
  - `CloudWatchAgentServerPolicy`

### 6. EC2 Instances
- `Web-app-1`, `Web-app-2`, etc.
- All instances: ✅ *Running*
- Instance types: `t2.micro`, `t3.micro`
- IAM Role attached: `ecomm`

### 7. CloudWatch Alarms
| Alarm Name                             | Status     | Condition                             |
|----------------------------------------|------------|----------------------------------------|
| Status check failed <Web-app-1>        | ⏸️ Insufficient Data | StatusCheckFailed_Instance >= 1         |
| high-memory-usage <Web-app-1>          | ✅ OK       | mem_used_percent > 80 (10 mins)        |
| high-cpu-utilization <Web-app-1>       | ✅ OK       | disk_used_percent > 70 (10 mins)       |
| TargetTracking-AS-AlarmLow             | ❌ In Alarm | CPUUtilization < 49 for 15 datapoints  |
| TargetTracking-AS-AlarmHigh            | ✅ OK       | CPUUtilization > 70 for 3 datapoints   |

### 8. SNS Topic Subscription
- Topic ARN: `arn:aws:sns:us-east-1:471112556180:ecomm`
- Confirmed Email: ✅ `u.kommineni@ajacs.in`

---

## 📸 Screenshots Included in `/images`

## Load Balancer Configuration (provisioning):

<img width="1913" height="911" alt="Image" src="https://github.com/user-attachments/assets/0e67b076-8f5c-471a-b513-3f26b6e44804" />

## Load Balancer Configuration (Active):

<img width="1895" height="945" alt="Image" src="https://github.com/user-attachments/assets/ee34a19f-f438-4fd0-9c7b-c0c161b28176" />

  ## Target Group Health:

<img width="1902" height="902" alt="Image" src="https://github.com/user-attachments/assets/13a9a9ee-4a70-4996-8dd0-0d00d8308399" />

## Auto Scaling Group Settings:

<img width="1887" height="917" alt="Image" src="https://github.com/user-attachments/assets/6ff2acfc-6b84-4cc7-9a44-f5f0cbc10d3d" />

## IAM Role and policies:

<img width="1871" height="942" alt="Image" src="https://github.com/user-attachments/assets/0ecf7464-b85f-4567-9a28-cad556f87a6a" />

## CloudWatch Alarms history:

<img width="1907" height="913" alt="Image" src="https://github.com/user-attachments/assets/2f4d20bf-2b34-4c16-a43c-9e006d3f3000" />

## Cloudwatch History:

<img width="1893" height="906" alt="Image" src="https://github.com/user-attachments/assets/1af2d3ad-6696-4717-9c9b-599aba14c9b2" />

 ## Email Confirmation for SNS:

<img width="1456" height="801" alt="Image" src="https://github.com/user-attachments/assets/28a02a89-8abe-428c-a285-a9521aab42e7" />

<img width="1441" height="818" alt="Image" src="https://github.com/user-attachments/assets/eb72462b-3121-4d34-bbb3-8182a281931a" />


---
---

## 🧩 Main AWS Components Used

Service

Purpose

EC2

Runs the Node.js-based e-commerce app

Launch Template

Template to launch EC2 instances with pre-configured settings

Auto Scaling Group

Automatically scales instances up/down based on CPU usage

Application Load Balancer (ALB)

Distributes traffic across instances in multiple AZs

Target Group

Registers EC2 instances behind the ALB

CloudWatch Agent

Collects system-level metrics like CPU, memory, and disk

CloudWatch Alarms

Triggers actions based on performance thresholds (e.g., CPU > 70%)

SNS

## Sends email alerts when alarms are triggered:

<img width="1456" height="801" alt="Image" src="https://github.com/user-attachments/assets/1c7f2fe4-a172-4227-ab1e-cae6bd891d91" />

IAM Role

Grants EC2 permissions to write logs and send alerts


## final output of web hosting:

<img width="1878" height="968" alt="Image" src="https://github.com/user-attachments/assets/6a68d346-39f9-4f7a-b569-3040aa628dbd" />


---

## User's Data:
```bash
#!/bin/bash
yum update -y
yum install -y httpd
systemctl enable httpd
systemctl start httpd
yum install -y git
cd /var/www/html
git clone https://github.com/Ai-TechNov/ecomm.git
GitHub - Ai-TechNov/ecomm: Ecommerce Application Code
Ecommerce Application Code. Contribute to Ai-TechNov/ecomm development by creating an account on GitHub.
  website
cp -r website/* .
rm -rf website
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html
systemctl restart httpdl

```


## Author:

**Uday sairam**  
Trainee Software Engineer | AWS Cloud Practitioner  
Location: India  
Email: saikommineni5@gmail.com 

LinkedIn: www.linkedin.com/in/uday-sai-ram-kommineni-uday-sai-ram

---
