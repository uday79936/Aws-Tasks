## 🧪 AWS VPC Endpoint Lab:
## Objective:

Enable EC2 instances in a private subnet to securely and privately access AWS services using:

Gateway Endpoint for Amazon S3

Interface Endpoint for AWS Secrets Manager

## 📐 Architecture Overview:

<img width="1135" height="680" alt="Image" src="https://github.com/user-attachments/assets/7fc27576-dd3c-4e35-9d89-eabd3d60d101" />

Subnet	CIDR	Type
PublicSubnet	10.0.1.0/24	Public
PrivateSubnet	10.0.2.0/24	Private

Internet Gateway

Name: IGW-Lab

Attach to VPC-Endpoint-Lab

Route Tables

Public Route Table:

Route: 0.0.0.0/0 → IGW-Lab

Associated Subnet: PublicSubnet

Private Route Table:

No 0.0.0.0/0 route

Associated Subnet: PrivateSubnet

## 🛠️ Part 2 — EC2 Instances Setup & Verify Connectivity
EC2-A (Bastion Host)

Subnet: PublicSubnet

AMI: Amazon Linux 2

Public IP: Enabled

SG: Allow inbound SSH (port 22) from your IP

EC2-B (Private Instance)

Subnet: PrivateSubnet

AMI: Amazon Linux 2

No public IP

SG:

SSH from EC2-A

HTTPS (443) inbound

SSH Flow

# From local → Bastion (EC2-A):
```
ssh -i key.pem ec2-user@<EC2-A-Public-IP>
```

# From Bastion → Private EC2-B:
```
ssh -i key.pem ec2-user@<EC2-B-Private-IP>
```
☁️ Part 3 — Gateway Endpoint for S3
Create S3 Bucket

```
aws s3 mb s3://vpc-endpoint-lab-<your-name>
Test Access from EC2-B (should fail pre‑endpoint)
```

```
aws s3 ls
Create Gateway Endpoint

Console: VPC → Endpoints → Create Endpoint

Name: S3GatewayEndpoint

Service: com.amazonaws.<region>.s3

Type: Gateway

Select: VPC-Endpoint-Lab, Private Route Table

Test again from EC2-B
```

```
echo "test" > test.txt
aws s3 cp test.txt s3://vpc-endpoint-lab-<your-name>/
```
✅ Should succeed via gateway endpoint, without internet access.

## 🔐 Part 4 — Interface Endpoint for Secrets Manager:

Create a Test Secret

Console: AWS Secrets Manager → Store new secret

Key/Value: username: admin

Name: MyTestSecret

Create Interface Endpoint

Console: VPC → Endpoints → Create Endpoint

Name: SecretsManagerEndpoint

Service: com.amazonaws.<region>.secretsmanager

Type: Interface

Subnet: PrivateSubnet

Enable Private DNS

SG: Allow HTTPS (port 443) from EC2-B

Test from EC2-B

```
aws secretsmanager get-secret-value --secret-id MyTestSecret
```
✅ Should succeed via interface endpoint, using private DNS/IP.

## Before we have to copy the pem file to private server you have to give their permissions to pem file by using command called:
```
sudo chmod 400 pem.file
```

## We need to copy the file to the server securely by using command called:
```
scp - i pem.file pem.file ubuntu@10.0.0.21:~
```

## Screenshot Images:

## Cloudformation:

<img width="1893" height="922" alt="Image" src="https://github.com/user-attachments/assets/a951fbbd-e114-4225-8c5c-0593eb1c5364" />

## VPC Endpoint:

<img width="1912" height="902" alt="Image" src="https://github.com/user-attachments/assets/a7e0b963-3046-4b50-8e1a-94806f5abce8" />

## VPC Endpoint-pub:

<img width="1917" height="916" alt="Image" src="https://github.com/user-attachments/assets/25ee482a-d4df-4dcb-9996-70f06ec29b97" />

## VPC Endpoint-pvt:

<img width="1908" height="913" alt="Image" src="https://github.com/user-attachments/assets/72d41a70-d2ff-4716-9833-d74748c88cb6" />

## VPC Endpoint-pub-rt:

<img width="1913" height="922" alt="Image" src="https://github.com/user-attachments/assets/1bcfb399-c792-41ab-9347-b20234db9853" />

## VPC Endpoint-pvt-rt:

<img width="1918" height="917" alt="Image" src="https://github.com/user-attachments/assets/e0abeb74-7a81-4d58-bb09-79cce310d8f7" />

## VPC Endpoint-igw:

<img width="1912" height="912" alt="Image" src="https://github.com/user-attachments/assets/639e336f-f840-4d12-be1e-045cd19bce01" />

## VPC Endpoints:

<img width="1917" height="917" alt="Image" src="https://github.com/user-attachments/assets/2d495cae-3e26-44ad-8e5e-9e4f6c5a9a75" />

## VPC Endpoint-route-tables:

<img width="1912" height="917" alt="Image" src="https://github.com/user-attachments/assets/531e21b5-94ef-43ac-9bd2-4ef1ea7bf066" />

## EC2A-Pub:

<img width="1900" height="916" alt="Image" src="https://github.com/user-attachments/assets/00786444-96d4-4f8e-8582-4954f1ca2669" />

## EC2B-Pvt:

<img width="1892" height="927" alt="Image" src="https://github.com/user-attachments/assets/4136c072-5e43-4f55-8d60-0a807df3aa9e" />

## EC2B-Pvt-IAM:

<img width="1893" height="926" alt="Image" src="https://github.com/user-attachments/assets/cd27ae85-2a27-4f57-95e4-dc4580ce05c0" />

## Copy the pem file:

<img width="1102" height="380" alt="Image" src="https://github.com/user-attachments/assets/c15f2dd0-588c-4c4e-9acd-b7b3b3298032" />

## copied the pem file:

<img width="735" height="328" alt="Image" src="https://github.com/user-attachments/assets/a2cd90fe-1e1c-4b12-afd6-145b0d8125f0" />

## EC2A-Pub S3:

<img width="832" height="255" alt="Image" src="https://github.com/user-attachments/assets/1d491827-849c-4eb0-ba57-73b796dc6f57" />

## pem file chmod permissions:

<img width="1161" height="795" alt="Image" src="https://github.com/user-attachments/assets/a220b554-51bd-4159-916d-1c7d87c2a300" />

## EC2B-Pvt-S3:

<img width="788" height="261" alt="Image" src="https://github.com/user-attachments/assets/3ecb93f5-2817-4f97-a88d-6a86738696de" />

## 🧹 Cleanup (Optional):
Terminate EC2-A, EC2-B

Delete S3GatewayEndpoint, SecretsManagerEndpoint

Delete S3 bucket: aws s3 rb s3://vpc-endpoint-lab-<your-name> --force

Delete Secrets Manager secret

Delete VPC VPC‑Endpoint‑Lab (subnets, IGW, etc.)

## 📋 Summary Table:

| **Component**       | **Endpoint Type** | **Traffic Pattern**    | **Notes**                                                                            |
| ------------------- | ----------------- | ---------------------- | ------------------------------------------------------------------------------------ |
| Amazon S3           | Gateway           | Routed via route table | Uses AWS-managed prefix list; no cost; supports only IPv4 ([docs.aws.amazon.com][1]) |
| AWS Secrets Manager | Interface         | ENI + Private DNS      | Each endpoint creates ENIs in specified subnets; resolves via private DNS name       |

[1]: https://docs.aws.amazon.com/vpc/latest/privatelink/vpc-endpoints-s3.html?utm_source=chatgpt.com "Gateway endpoints for Amazon S3 - Amazon Virtual Private Cloud"


## Author:

**Uday Sairam Kommineni**

**AWS Cloud Practioner**

Mail-id: saikommineni5@gmail.com

Linkedin: https://www.linkedin.com/in/uday-sai-ram-kommineni-uday-sai-ram/
