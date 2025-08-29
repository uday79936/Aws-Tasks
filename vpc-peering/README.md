## 📘 What Is VPC Peering?
A VPC peering connection allows two VPCs to communicate as if they are part of the same private network, using only private IP addresses. The data remains on the AWS global network, never traverses the public internet, and doesn’t rely on Internet Gateways, VPNs, or separate hardware 

Peering supports intra-account, inter-account, and inter-region setups, as long as the CIDR blocks don’t overlap 


## ✅ Benefits of VPC Peering

No single point of failure or bottleneck; peering leverages native infrastructure 

Minimal cost: Free for AZ-local traffic; cross-AZ/region data transfers incur minimal fees 
DEV Community

## Architectural Diagram:

<img width="543" height="642" alt="Image" src="https://github.com/user-attachments/assets/8082fe61-c71d-442e-be0c-cc86ff9862f0" />

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
## Images:

## Cloudformation AJA-VPC:

<img width="1900" height="907" alt="Image" src="https://github.com/user-attachments/assets/bd8a38fd-f95e-45c8-83d5-ef33409bfdbe" />


## Cloudformation IBM-VPC:

<img width="1900" height="910" alt="Image" src="https://github.com/user-attachments/assets/47a5644f-beaa-4eb0-9369-ce24ac9fbb62" />

## AJA-VPC:

<img width="1896" height="925" alt="Image" src="https://github.com/user-attachments/assets/07aa2e4f-bf21-4e8a-8819-9d81814cf45b" />


## IBM VPC:

<img width="1897" height="921" alt="Image" src="https://github.com/user-attachments/assets/3bd056d0-17ad-441c-9a66-03517bc81486" />

## AJA Public subnet:

<img width="1900" height="937" alt="Image" src="https://github.com/user-attachments/assets/c60d628c-b14e-4204-94c2-381f77749aee" />

## AJA Private subnet:

<img width="1898" height="910" alt="Image" src="https://github.com/user-attachments/assets/1f98dc63-d611-41dc-956d-bdf378d4be20" />

## IBM Public subnet:

<img width="1897" height="912" alt="Image" src="https://github.com/user-attachments/assets/f6b2409c-4080-44f3-9ad9-dbfce8533799" />

## IBM Private subnet:

<img width="1898" height="907" alt="Image" src="https://github.com/user-attachments/assets/753ea34c-32ce-4056-8649-546efa5f5c44" />

## Route tables:

<img width="1896" height="917" alt="Image" src="https://github.com/user-attachments/assets/e68fb06d-a15a-49cf-a713-02e243e34621" />

## AJA IGW:

<img width="1897" height="923" alt="Image" src="https://github.com/user-attachments/assets/ab8eeb34-244c-4676-a8bb-7976beed24ec" />

## IBM IGW:

<img width="1896" height="907" alt="Image" src="https://github.com/user-attachments/assets/a0ea5de3-dba0-469a-a95f-532ca144e2f5" />

## AJA-IBM Peering Request:

<img width="1896" height="922" alt="Image" src="https://github.com/user-attachments/assets/3236ce39-11e3-467e-9ac3-e92ee36088a1" />

## AJA-IBM Accept Request:

<img width="1887" height="926" alt="Image" src="https://github.com/user-attachments/assets/a80e86a6-88c5-4177-8ab1-761e43e0a4b8" />

## AJA-IBM Confirm peering Request:

<img width="1897" height="917" alt="Image" src="https://github.com/user-attachments/assets/b9d74618-3d0a-4e40-85ea-e4b038968d8d" />

## AJA-DB Route table:

<img width="1895" height="915" alt="Image" src="https://github.com/user-attachments/assets/b3ee4029-b625-46b5-a724-b1350e5593c8" />


## IBM-DB Route table:

<img width="1896" height="915" alt="Image" src="https://github.com/user-attachments/assets/a980edfe-5258-4012-a73f-73cdbb97f551" />

## AJA-PUB EC2:

<img width="1898" height="918" alt="Image" src="https://github.com/user-attachments/assets/c068e69e-bef1-4fe0-aae6-b492476430da" />

## AJA-PVT EC2:

<img width="1898" height="918" alt="Image" src="https://github.com/user-attachments/assets/76676375-9fc3-44f3-a7a8-1cca54688740" />

## IBM-PUB EC2:

<img width="1902" height="905" alt="Image" src="https://github.com/user-attachments/assets/d3781757-7e56-4778-a3d6-d3b4b5abaaa5" />

## IBM-PVT EC2:

<img width="1893" height="910" alt="Image" src="https://github.com/user-attachments/assets/93d7b717-183e-448e-80e1-5c9db0f0ecd6" />

## Pem File Permissions:

<img width="912" height="371" alt="Image" src="https://github.com/user-attachments/assets/f950ffab-5a36-4410-ba19-b34da38467ba" />

## AJA-PVT Output:

<img width="341" height="191" alt="Image" src="https://github.com/user-attachments/assets/843cdcc1-d0ed-4364-8910-6a3bfd6fa719" />

## IBM-PVT Output:

<img width="631" height="226" alt="Image" src="https://github.com/user-attachments/assets/5a8c04a5-5e7f-40e7-a4d7-a7394b285efd" />

You should receive ping replies if everything’s configured properly

**Uday Sairam Kommineni**

**AWS CLOUD PRACTIONER**

Mail-id: saikommineni5@gmail.com

linkedin-url: https://www.linkedin.com/in/uday-sai-ram-kommineni-uday-sai-ram/


