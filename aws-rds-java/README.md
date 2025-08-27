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

<img width="1024" height="1024" alt="Image" src="https://github.com/user-attachments/assets/91ed09df-9d8a-40cf-836f-84d8876c4dca" />

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

<img width="1902" height="917" alt="Image" src="https://github.com/user-attachments/assets/d48b46f5-94b9-461c-8305-c5667f9808fe" />

## demo-vpc:

<img width="1892" height="907" alt="Image" src="https://github.com/user-attachments/assets/983a49e2-d2eb-4adf-815f-00d9dc6ef076" />

## demo-db-sub:

<img width="1890" height="917" alt="Image" src="https://github.com/user-attachments/assets/00f6890b-d67e-4185-ad49-5a31a8fe5cea" />

## demo-app:

<img width="1895" height="912" alt="Image" src="https://github.com/user-attachments/assets/aa67f7cb-2ef5-408f-9ff4-d07b29b4b842" />

## Route-tables:

<img width="1897" height="912" alt="Image" src="https://github.com/user-attachments/assets/0834eaef-1db4-4388-993b-939373f48258" />

## internet gateway (IGW):

<img width="1895" height="922" alt="Image" src="https://github.com/user-attachments/assets/c0ad3e25-f134-4bb1-bbc3-5c74254c9b94" />

## Database-NAT-gatway(DB-NAT):

<img width="1897" height="908" alt="Image" src="https://github.com/user-attachments/assets/0340370b-fec3-4e12-a91b-82eaf7e7a67b" />

## Output of web-app:

<img width="1898" height="975" alt="Image" src="https://github.com/user-attachments/assets/753353d3-a907-4e57-990e-3f8c243d69d9" />

## Register a web-app:

<img width="1691" height="792" alt="Image" src="https://github.com/user-attachments/assets/e0ce0886-7d06-4f34-a757-32dfad4c7cd4" />

## Login web app:

<img width="1568" height="597" alt="Image" src="https://github.com/user-attachments/assets/832cab57-dd83-43a6-b2be-f28a33a6b01f" />

## output of web app:

<img width="1133" height="758" alt="Image" src="https://github.com/user-attachments/assets/10a25c0f-1796-48c0-9c3c-7ed936cee0a1" />

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





