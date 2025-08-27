## 📘 What Is VPC Peering?
A VPC peering connection allows two VPCs to communicate as if they are part of the same private network, using only private IP addresses. The data remains on the AWS global network, never traverses the public internet, and doesn’t rely on Internet Gateways, VPNs, or separate hardware 

Peering supports intra-account, inter-account, and inter-region setups, as long as the CIDR blocks don’t overlap 


## ✅ Benefits of VPC Peering

No single point of failure or bottleneck; peering leverages native infrastructure 

Minimal cost: Free for AZ-local traffic; cross-AZ/region data transfers incur minimal fees 
DEV Community

## Architectural Diagram:

<img width="1080" height="620" alt="Image" src="https://github.com/user-attachments/assets/1f375e4b-862b-4bfe-9e8d-a775ac12b871" />


## 🛠️ How to Set It Up (Same Account, Same Region)
## 1. Create VPCs
Use the console or CLI to create your two VPCs (e.g., AjaVPC and IbmVPC) with separate non-overlapping CIDRs, such as 10.0.0.0/16 and 192.168.0.0/16 

## 2. Establish Peering Connection:

Navigate to VPC → Peering Connections → Create Peering Connection, choose the Requester (AjaVPC) and Accepter (IbmVPC), then click Create. The request status will be Pending 
Amazon Web Services, Inc.

## 3. Accept the Request:

Go to the Peering Connections list, select the request, then choose Actions → Accept Request 

## 4. Update Route Tables:

In each VPC’s route table, add a route for the other VPC’s CIDR via the peering connection (e.g., 192.168.0.0/16 → pcx-xxxx and vice versa) 
DEV Community
.

## 5. Adjust Security Groups:

Ensure both EC2 instances’ Security Groups allow Inbound ICMP (ping) and SSH from the peer VPC’s CIDR block 
Medium.

## 6. Test Connectivity:

## SSH into EC2-A and run:

```
ping 192.168.1.100  # EC2-B's private IP
```
## we need to copy the pem file to the server securely by using command called:
```
scp -i pem.file pem.file ubuntu@ ip-address:~
```
## We need to give their permissions to the pem file:
```
sudo chmod 400 pem file
```
## Screenshots:

## Cloudformation AJA-VPC:

<img width="1900" height="907" alt="Image" src="https://github.com/user-attachments/assets/a4b1a47e-8d4a-4ada-97c2-670e09272646" />

## Cloudformation IBM-VPC:

<img width="1900" height="910" alt="Image" src="https://github.com/user-attachments/assets/fecc4cae-d8c6-423f-857c-790cfbe38778" />

## AJA-VPC:

<img width="1896" height="925" alt="Image" src="https://github.com/user-attachments/assets/06d73e9b-4faa-4232-b26f-74eaac1592fe" />

## IBM VPC:

<img width="1897" height="921" alt="Image" src="https://github.com/user-attachments/assets/1c9e75a6-7ae9-4904-a905-a64581add3a0" />

## AJA Public subnet:

<img width="1900" height="937" alt="Image" src="https://github.com/user-attachments/assets/d8ccd427-9c96-4e8e-9d3a-83eda01cf13d" />

## AJA Private subnet:

<img width="1898" height="910" alt="Image" src="https://github.com/user-attachments/assets/99ad1b91-0312-4cf4-a765-3e12d8a96462" />

## IBM Public subnet:

<img width="1897" height="912" alt="Image" src="https://github.com/user-attachments/assets/1bed3210-a63b-4758-a02e-9d1945132229" />

## IBM Private subnet:

<img width="1898" height="907" alt="Image" src="https://github.com/user-attachments/assets/10be57dc-e9be-4896-aece-4d4beeaa8e13" />

## Route tables:

<img width="1896" height="917" alt="Image" src="https://github.com/user-attachments/assets/74f70eb1-dc88-4106-8cdd-4573217506ac" />

## AJA IGW:

<img width="1897" height="923" alt="Image" src="https://github.com/user-attachments/assets/8086e5fc-abf4-4fd3-8c5f-8de447cc316d" />

## IBM IGW:

<img width="1896" height="907" alt="Image" src="https://github.com/user-attachments/assets/de3f5b54-3d83-4324-8446-e70e77460473" />

## AJA-IBM Peering Request:

<img width="1896" height="922" alt="Image" src="https://github.com/user-attachments/assets/3092cc3c-be01-47df-8e6b-77ebcfb4e8b8" />

## AJA-IBM Accept Request:

<img width="1887" height="926" alt="Image" src="https://github.com/user-attachments/assets/d83c2871-3104-4c1a-b3c5-0e2bbc20aeb8" />

## AJA-IBM Confirm peering Request:

<img width="1897" height="917" alt="Image" src="https://github.com/user-attachments/assets/0c698969-9739-4a9b-bebf-06fa879069dd" />

## AJA-DB Route table:

<img width="1895" height="915" alt="Image" src="https://github.com/user-attachments/assets/996c4b49-931a-4fd2-a9f5-19f4b4736224" />

## IBM-DB Route table:

<img width="1896" height="915" alt="Image" src="https://github.com/user-attachments/assets/74e432f7-377f-403d-9b7b-2d398c3d2c6a" />

## AJA-PUB EC2:

<img width="1898" height="918" alt="Image" src="https://github.com/user-attachments/assets/eaa4f032-bdc4-4687-abcd-9ac0bdafa344" />

## AJA-PVT EC2:

<img width="1898" height="918" alt="Image" src="https://github.com/user-attachments/assets/ca651b09-ace1-457e-8ad2-004731e499d6" />

## IBM-PUB EC2:

<img width="1902" height="905" alt="Image" src="https://github.com/user-attachments/assets/44aaf292-663b-4e44-a384-1532b145c0d0" />

## IBM-PVT EC2:

<img width="1893" height="910" alt="Image" src="https://github.com/user-attachments/assets/bfc81215-a112-4f3f-ba2b-d14d39f2c68a" />

## Pem File Permissions:

<img width="912" height="371" alt="Image" src="https://github.com/user-attachments/assets/85dff6f8-a138-470c-b3b6-4a43760cf526" />

## AJA-PVT Output:

<img width="341" height="191" alt="Image" src="https://github.com/user-attachments/assets/a13df394-4240-4f26-953b-7f8cc21e8f75" />

## IBM-PVT Output:

<img width="631" height="226" alt="Image" src="https://github.com/user-attachments/assets/8df2263e-9a4c-4fd2-b545-16805e93daf6" />

You should receive ping replies if everything’s configured properly

**Uday Sairam Kommineni**

**AWS CLOUD PRACTIONER**

Mail-id: saikommineni5@gmail.com

linkedin-url: https://www.linkedin.com/in/uday-sai-ram-kommineni-uday-sai-ram/


