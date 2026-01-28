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


## Author:

**Uday Sairam Kommineni**

**AWS Devops Engineer**

**Mail-ID:** saikommineni5@gmail.com

**Linkedin-URL:** https://www.linkedin.com/in/udaysairam/



