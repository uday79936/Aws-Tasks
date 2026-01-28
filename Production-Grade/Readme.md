## 📘 Production-Grade Cloud Networking Project:

Enterprise VPC Design with Multi-Size Subnets & Controlled Internet Access

## 1️⃣ Project Overview:

**Objective:**

Design and implement a scalable, secure, and auditable AWS VPC network that:

Uses unequal subnet sizes based on workload demand

Enforces strict internet access control

Follows CIDR planning best practices

Supports long-term growth without redesign

This network is intended to be a shared cloud foundation used by multiple application teams.

## 2️⃣ High-Level Architecture:

Architectural Principles

Single large VPC → easier routing & growth

Largest subnets allocated first → prevents fragmentation

Public vs Private separation → security by design

Explicit routing → no accidental internet exposure

## 3️⃣ TASK 1: VPC CIDR & Capacity Planning:

VPC CIDR Selection

Item	Value

VPC CIDR	10.0.0.0/16

Total IPs	65,536

Usable IPs	~65,531

Why /16?

Supports large subnets today

Leaves massive headroom for future expansion

Avoids painful re-IP or VPC peering redesigns later

## 📌 Enterprise Rule:

Always size the VPC for future growth, not current usage.

## 4️⃣ TASK 2: Subnet Design (Unequal Sizes):

Subnet Allocation Strategy

Allocate largest subnets first

Maintain correct CIDR boundaries

Avoid IP overlap

Ensure all subnets fit inside 10.0.0.0/16

## 📊 Subnet CIDR Table (Final Design):


Subnet Name	Purpose	Required IPs	CIDR	IP Range

Shared	Large Internal Services	~8,192	10.0.0.0/19	10.0.0.0 – 10.0.31.255

Platform	Containers / Tools	~4,096	10.0.32.0/20	10.0.32.0 – 10.0.47.255

App	Application Tier	~2,048	10.0.48.0/21	10.0.48.0 – 10.0.55.255

Web	Web Tier	~1,024	10.0.56.0/22	10.0.56.0 – 10.0.59.255

Edge	Ingress / Load Balancers	~512	10.0.60.0/23	10.0.60.0 – 10.0.61.255

Admin	Bastion / Ops	~256	10.0.62.0/24	10.0.62.0 – 10.0.62.255


✅ No overlaps

✅ Correct boundaries

✅ Growth space remains (10.0.63.0 – 10.0.255.255 unused)


## 5️⃣ TASK 3: Internet Gateway (IGW):

Design

One Internet Gateway

Attached directly to the VPC

Provides internet connectivity only when routing allows it

Key Principle

IGW alone does nothing — routing decides access.

## 6️⃣ TASK 4: Route Table Architecture:

Route Tables Created

Route Table	Used By	Routes

Public-RT	Admin, Edge	10.0.0.0/16 → local
0.0.0.0/0 → IGW

Private-RT	Web, App, Platform, Shared	10.0.0.0/16 → local


🚫 No internet route in Private-RT

## 7️⃣ TASK 5: Route Table Associations
Explicit Associations (Mandatory):

Subnet	Route Table

Admin	Public-RT

Edge	Public-RT

Web	Private-RT

App	Private-RT

Platform	Private-RT

Shared	Private-RT


## 📌 Important:


Main route table is not used


Prevents accidental internet exposure


## 8️⃣ TASK 6: Security-Driven Network Behavior:

Internet Access Rules

Subnet Type	Internet Access	Why

Admin	✅ Yes	Has IGW route

Edge	✅ Yes	Public ingress layer

Web	  ❌ No	No default route

App	  ❌ No	  Isolated

Platform	❌ No	Isolated

Shared	❌ No	Internal only

Internal Communication

All subnets communicate via local VPC routing

No firewalls involved at this layer

## 9️⃣ TASK 7: Validation & Testing:

Public Subnet Test

**Test:**

Launch EC2 → curl google.com

Result: ✅ Works

Why:

Public subnet

IGW attached

0.0.0.0/0 → IGW route exists

Private Subnet Test

Test:
Launch EC2 → curl google.com

Result: ❌ Fails

Why:

No default route

Traffic has nowhere to go

Internal Communication Test

Test:
Ping between subnets

Result: ✅ Works

Why:

Local route (10.0.0.0/16) exists by default

## 🔟 TASK 8: Failure & Audit Scenarios:

**❓ What if IGW is detached?**

All internet access stops

Public subnets behave like private

Internal traffic still works

**❓ If a private subnet uses Public-RT?**

It becomes public

Major security violation

Audit failure risk

**❓ Why wrong /19 start IP breaks design?**

Example:

10.0.8.0/19 ❌ INVALID


/19 must start at multiples of 32

Causes overlapping CIDRs

AWS rejects or misroutes traffic

**❓ How does this design support growth?**

Large unused CIDR space

Easy to add:

New AZ subnets

New tiers

NAT / Transit Gateway later

No re-IP required

## 1️⃣1️⃣ TASK 9: Documentation Summary:

📄 Deliverables Checklist

✅ VPC & Subnet CIDR Table
✅ Route Table Mapping
✅ Architecture Diagram
✅ Traffic Flow Explanation
✅ Risk & Failure Analysis

🧠 Final Enterprise Verdict

**This design is:**

✅ Production-ready

✅ Audit-friendly

✅ Secure by default

✅ Scalable for years

✅ Interview-level gold

## Images:

## 1. V.P.C Creation:

<img width="1918" height="912" alt="Image" src="https://github.com/user-attachments/assets/fbd9e4f1-f5cf-414c-b6c6-760787776929" />

## 2. Admin subnet:

<img width="1913" height="908" alt="Image" src="https://github.com/user-attachments/assets/adab33ec-e153-48e3-a194-879383ad1a7c" />

## 3. Edge Subnet:

<img width="1915" height="910" alt="Image" src="https://github.com/user-attachments/assets/e0a5fc25-371e-4d8d-9c98-ef772a83030a" />

## 4. Web subnet:

<img width="1908" height="916" alt="Image" src="https://github.com/user-attachments/assets/434783f8-18d1-4bfb-a9c7-71500cd7b4e7" />

## 5. App Subnet:

<img width="1915" height="917" alt="Image" src="https://github.com/user-attachments/assets/da3e7f81-4c98-4e56-8669-d47cf93eb42b" />

## 6. Platform Subnet:

<img width="1917" height="910" alt="Image" src="https://github.com/user-attachments/assets/ef28900e-eee3-4052-aa62-ab5d20594a6b" />

## 7. Shared Subnet:

<img width="1917" height="918" alt="Image" src="https://github.com/user-attachments/assets/cc51e089-d376-4aba-b135-f29306fbd91c" />

## 8. Admin subnet associate with public-rt:

<img width="1912" height="921" alt="Image" src="https://github.com/user-attachments/assets/beeb62ab-7a37-4c32-bb1b-bfaeb03957af" />

## 9. Edge subnet associate with public-rt:

<img width="1911" height="910" alt="Image" src="https://github.com/user-attachments/assets/7ca1a713-902b-4411-a05d-367b7f11e66c" />

## 10. Private Route-table:

<img width="1916" height="916" alt="Image" src="https://github.com/user-attachments/assets/fdf3c860-77f0-4c4f-b044-32bdbf74311d" />

## 11. Web subnet associate with pvt-rt:

<img width="1912" height="917" alt="Image" src="https://github.com/user-attachments/assets/9cc97e8d-5e9d-4e09-9f6b-0652bcd46552" />

## 12. app subnet associate with pvt-rt:

<img width="1918" height="921" alt="Image" src="https://github.com/user-attachments/assets/4ff6302f-0e61-46f0-8702-f082492b266a" />

## 13. Platform subnet associate with pvt-rt:

<img width="1918" height="918" alt="Image" src="https://github.com/user-attachments/assets/c2409b2a-29d5-47ea-9725-65c5990da0a7" />

## 14. Shared subnet associate with pvt-rt:

<img width="1912" height="917" alt="Image" src="https://github.com/user-attachments/assets/c6309339-579a-480b-9c6c-db3359712bb6" />

## 15. Sai-igw:

<img width="1912" height="917" alt="Image" src="https://github.com/user-attachments/assets/16a2caa4-9ba1-47d6-b80b-c0a4d57c96b8" />

## 16. Admin subnet:

<img width="1912" height="920" alt="Image" src="https://github.com/user-attachments/assets/fb085da6-b4d5-406b-8a6e-7cbb679e58de" />

## 17. Edge Subnet:

<img width="1917" height="913" alt="Image" src="https://github.com/user-attachments/assets/b54d41d2-09e3-4843-80af-013907c5fc85" />

## 18. Web subnet:

<img width="1918" height="927" alt="Image" src="https://github.com/user-attachments/assets/48245115-ff1d-440c-b328-51f6d3ba4b72" />

## 19. App subnet:

<img width="1916" height="918" alt="Image" src="https://github.com/user-attachments/assets/d63a160f-e33b-4047-8a2c-ad791af42c5b" />

## 20. Platform subnet:

<img width="1918" height="912" alt="Image" src="https://github.com/user-attachments/assets/cf1a177f-c727-45cb-b987-b1a34289a871" />

## 21. Shared subnet:

<img width="1917" height="912" alt="Image" src="https://github.com/user-attachments/assets/996f2d24-88c8-4dfc-87de-8add49944fc4" />

## 22. Output:

<img width="936" height="514" alt="Image" src="https://github.com/user-attachments/assets/3987b66f-433b-44f9-86c1-7b6f9535ad21" />

## Author:

**Uday Sairam Kommineni**

**AWS Devops Engineer**

**Mail-ID:** saikommineni5@gmail.com

**Linkedin-URL:** https://www.linkedin.com/in/udaysairam/



