# ☁️ AWS CloudFormation: Single VPC + Multi‑AZ Subnets + Java/MySQL Web App

This repository contains an AWS CloudFormation template that provisions a single VPC across two Availability Zones, deploys EC2 instances, and sets up a Java web application backed by MySQL.

---

## 🚀 Project Overview

### 1. Infrastructure (CloudFormation)

* **One VPC** spanning **AZ 1a** and **AZ 1b**
* In each AZ:

  * **Public subnet**
  * **Private subnet**
* **Internet Gateway** for public connectivity
* **NAT Gateway** in a public subnet so private subnets can access the internet ([docs.aws.amazon.com][1], [docs.aws.amazon.com][2])
* Two **route tables**:

  * Public → IGW
  * Private → NAT Gateway
* **EC2 instances**:

  * Public EC2 in subnet (AZ 1a) for administration
  * Private EC2 in subnet (AZ 1b) hosting MySQL and Java web app

### 2. Database

* MySQL installed on the **private EC2 instance**
* Java app connects using the private IP or endpoint

### 3. Software Setup via EC2 UserData

* Installs:

  * `mysql-server` & `mysql-client`
  * OpenJDK (Java)
  * Maven
  * Git
* Clones and builds the Java web app using Maven

### 4. Java Web Application

* Contains JSP pages:

  * `login.jsp`
  * `userRegistration.jsp`
* Connects to MySQL via the private endpoint
* Enables user registration and login

---

## 📁 Repository Structure

```text
.
├── cfn/
│   └── vpc-app-stack.yml      # CloudFormation template
├── scripts/
│   └── bootstrap.sh          # UserData script (installs & starts services)
├── src/
│   ├── login.jsp
│   ├── userRegistration.jsp
│   └── pom.xml               # Maven build file
└── README.md                 # This file
```

---

## ⚙️ Prerequisites

* AWS account with permissions for VPC, EC2, IAM, CloudFormation
* AWS CLI or AWS Console access
* SSH key pair for EC2
* Familiarity with Java, Maven, and Git

---

## 🔧 Setup & Deployment

1. **Clone repo:**

   ```bash
   git clone https://github.com/Ai-TechNov/aws-rds-java.git
   
   cd aws-rds-java
   ```

2. **Deploy CloudFormation stack:**

   ```bash
cloudformation.yaml file
   ```

3. **Retrieve outputs:**

   * Public EC2 IP (for SSH)
   * Private EC2 IP (used by the web app to connect to MySQL)

4. **SSH into the public EC2:**

   ```bash
   ssh -i your-key.pem ec2-user@<public-ec2-ip>
   ```

   The private EC2 is set up automatically via UserData.

5. **Application setup:**

   * Bootstraps software, clones the repo, builds and launches the app

---

## 🌐 Testing the Application

1. Access the Java web app from the internal network:

   ```
   http://<private-ec2-private-ip>:8080/login.jsp
   ```
2. Register via `userRegistration.jsp`, then log in via `login.jsp`.
   This confirms Java/MySQL connectivity via the database endpoint.



---

## 💡 Future Enhancements

* Move MySQL off EC2 and into **RDS (Multi‑AZ)** for increased resilience
* Add **HTTPS/SSL** for secure communication
* Utilize **IAM roles** and **SSM** for better management
* Integrate a **Load Balancer** and auto-scaling
* Implement CI/CD pipelines with **GitHub Actions**

---

## 💵 Cost Awareness

* Uses EC2, NAT Gateway, data transfer—these services are billable
* Delete stacks when finished to avoid unnecessary costs

---
## 🗺️ Architecture Diagram:

<img width="1024" height="1024" alt="Image" src="https://github.com/user-attachments/assets/d654b7cf-c5bb-4836-955d-b0345cd9bd8a" />

📄 Infrastructure as Code
This project uses AWS CloudFormation to provision all resources.

View CloudFormation Template
To deploy the stack:

aws cloudformation create-stack
--stack-name fullstack-java-app
--template-body file://cloudformation-template.yaml
--capabilities CAPABILITY_NAMED_IAM

## 🛑 Make Sure to:
Remove any hardcoded passwords, secrets, or keys before uploading.
## 📸 Screenshots:

## cloudformation:

<img width="1891" height="916" alt="Image" src="https://github.com/user-attachments/assets/16cd46ab-7ea9-4c1d-bd68-6bcc689753b6" />

## demo-vpc:

<img width="1902" height="916" alt="Image" src="https://github.com/user-attachments/assets/cda9e683-df4d-446d-a566-bfaa40d36152" />

## demo-db-sub:

<img width="1880" height="913" alt="Image" src="https://github.com/user-attachments/assets/00e41c45-4fd1-41e8-b345-a270fba22042" />

## demo-app:

<img width="1037" height="507" alt="Image" src="https://github.com/user-attachments/assets/0bae94b5-0a71-4dfc-86cd-d27b3b4ea8d5" />

## Route-tables:

<img width="1047" height="498" alt="Image" src="https://github.com/user-attachments/assets/087b985d-7105-4020-b301-6134473ec710" />

## internet gateway (IGW):

<img width="1042" height="502" alt="Image" src="https://github.com/user-attachments/assets/09c6eddd-d152-49ce-9957-37d6e928de05" />

## Database-NAT-gatway(DB-NAT):

<img width="1041" height="506" alt="Image" src="https://github.com/user-attachments/assets/dc3c28ea-0472-420f-b8db-7a3d99173208" />

## Output of web-app:

<img width="1051" height="532" alt="Image" src="https://github.com/user-attachments/assets/ef9ccbbe-3750-4004-872c-04abcd5a4002" />

## Register a web-app:

<img width="1051" height="495" alt="Image" src="https://github.com/user-attachments/assets/1bbfc0bc-cbc2-475e-baf7-b5d243556ada" />

## Login web app:

<img width="1028" height="432" alt="Image" src="https://github.com/user-attachments/assets/9da4aca2-0b7e-4219-bb68-9cd1315fe8b0" />

## output of web app:

<img width="1041" height="697" alt="Image" src="https://github.com/user-attachments/assets/8a402576-aaa8-41df-a9bf-c4e3cc5487f4" />

---

## 🧹 Cleanup

Terminate all resources by deleting the stack:

```bash
aws cloudformation delete-stack --stack-name single-vpc-java-app
```

## Author:

**Uday Sairam Kommineni**

**Mail-id:** saikommineni5@gmail.com

**linkedin-url:** https://www.linkedin.com/in/uday-sai-ram-kommineni-uday-sai-ram/





