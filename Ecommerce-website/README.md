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

<img width="1536" height="1024" alt="Image" src="https://github.com/user-attachments/assets/cafe5683-f921-42b7-9d3b-f1f8af930760" />
              

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

<img width="1913" height="911" alt="Image" src="https://github.com/user-attachments/assets/d4bebf0e-bac4-4e82-88db-d77347dfe100" />

## Load Balancer Configuration (Active):

<img width="1895" height="945" alt="Image" src="https://github.com/user-attachments/assets/50aa93ae-0e94-4b87-ab66-97ad3dc9a3fb" />

  ## Target Group Health:

<img width="1902" height="902" alt="Image" src="https://github.com/user-attachments/assets/690c1b4d-20ea-4b10-b330-013d76ce3c71" />

## Auto Scaling Group Settings:

<img width="1887" height="917" alt="Image" src="https://github.com/user-attachments/assets/67b31e69-753e-4be9-be31-8c5fd2251126" />

## IAM Role and policies:

<img width="1876" height="937" alt="Image" src="https://github.com/user-attachments/assets/50de6226-72a7-4d60-ad03-e14e4df2489c" />

## CloudWatch Alarms history:

<img width="1907" height="913" alt="Image" src="https://github.com/user-attachments/assets/06266f6a-2fd0-450d-807f-03f4877cbbb9" />

 ## Email Confirmation for SNS:

<img width="922" height="515" alt="Image" src="https://github.com/user-attachments/assets/c163638e-9ad3-4814-b76f-975fe7fb14e5" />

<img width="1893" height="901" alt="Image" src="https://github.com/user-attachments/assets/9968e615-63e1-4de2-8251-df299bd8d6fc" />

<img width="1456" height="801" alt="Image" src="https://github.com/user-attachments/assets/ef3445e6-bb3f-40bc-8c96-d768c6c85ea4" />


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

<img width="1441" height="818" alt="Image" src="https://github.com/user-attachments/assets/7b10af4b-e8e1-4a08-8516-4ad27eab0f5a" />

IAM Role

Grants EC2 permissions to write logs and send alerts


## final output of web hosting:

<img width="1878" height="968" alt="Image" src="https://github.com/user-attachments/assets/7674fffb-302a-4015-a43c-d5e9fc0824ef" />


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
