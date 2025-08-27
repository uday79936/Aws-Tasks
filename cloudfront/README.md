## 🌐 Amazon CloudFront – Distribution Creation (Step-by-Step):

## 🎯 Objective:

Create an Amazon CloudFront distribution to deliver content (such as a web server) globally with low latency and high performance through caching at AWS edge locations.

## ✅ Prerequisites:

Before you begin, ensure the following:

✅ An S3 bucket or origin server (e.g., EC2, ALB, on-prem server, or any HTTP server) is already set up.

✅ The content (e.g., HTML files, images, videos) is uploaded to the origin.

✅ (Optional) A custom domain name is configured (via Route 53 or another DNS provider) if you want to use a branded CDN URL like cdn.example.com.

🛠️ Step-by-Step: Create a CloudFront Distribution
1️⃣ Open the CloudFront Console
🔗 URL: https://console.aws.amazon.com/cloudfront/

2️⃣ Click "Create Distribution"
Choose the Web distribution (HTTP/S delivery).
⚠️ RTMP is deprecated and should be avoided.

## 3️⃣ Configure Origin Settings
Setting	Description
Origin Domain Name	Choose your S3 bucket or enter the custom origin domain (e.g., example.com).
Origin Path	(Optional) Provide a subdirectory if you want to serve content from a specific folder.
Origin ID	Auto-filled or give a custom name for identification.
Restrict Bucket Access	Select Yes (recommended for private content).
Origin Access Control (OAC)	Create a new OAC or select an existing one to allow CloudFront access to your S3 bucket.

## 4️⃣ Configure Default Cache Behavior
Setting	Value
Viewer Protocol Policy	Redirect HTTP to HTTPS
Allowed HTTP Methods	GET, HEAD (add OPTIONS, PUT, POST if needed)
Cache and Origin Request Settings	Use recommended settings or customize headers/cookies if needed
Object Caching	Use origin cache headers or define TTL values
Minimum TTL	Example: 0 (for no caching)
Maximum TTL	Example: 31536000 (1 year)
Compress Objects Automatically	Yes (Gzip/Brotli enabled)
Lambda@Edge / Function associations	(Optional) Use for custom request/response logic

## 5️⃣ Configure Distribution Settings
Setting	Value
Price Class	Choose based on your region needs (e.g., "Use only North America and Europe" or "All Edge Locations")
Alternate Domain Names (CNAMEs)	(Optional) Use a custom domain like cdn.example.com
Custom SSL Certificate	Use an ACM certificate if you're using a custom domain
Default Root Object	e.g., index.html
Logging	Enable logging to an S3 bucket if needed
WAF Web ACL	Attach a Web ACL if you're using AWS WAF
IPv6	Enable (recommended)

## 6️⃣ Review and Create:

Click "Create Distribution".

Wait a few minutes for deployment.

Once completed, you'll receive a CloudFront URL such as:

```
https://dj2hji00vrmto.cloudfront.net/
```
You can now use this domain to serve your static/dynamic content globally.

## IMAGES:

## EC2-APP-1:

<img width="1897" height="908" alt="Image" src="https://github.com/user-attachments/assets/b7f6c07b-b011-49bc-a3b7-f6dbf73df69b" />

## EC2-APP-2:

<img width="1897" height="915" alt="Image" src="https://github.com/user-attachments/assets/5d41f473-cda7-4a77-93f3-31b594871b00" />

## Nginx Command:

<img width="705" height="166" alt="Image" src="https://github.com/user-attachments/assets/59836f59-6784-4428-b9eb-c399f73f4ffb" />

## Nginx html folder:

<img width="667" height="260" alt="Image" src="https://github.com/user-attachments/assets/a9992bf3-f8fb-42ba-8e0a-38c1aca4200b" />

## Start Nginx:

<img width="1615" height="595" alt="Image" src="https://github.com/user-attachments/assets/86673ce9-6fcc-463e-b465-8bdfc67ac6b9" />

## EC2A output:

<img width="1903" height="932" alt="Image" src="https://github.com/user-attachments/assets/79c1d202-814e-4924-9058-2f3bb6adc0b6" />

## EC2B output:

<img width="1900" height="965" alt="Image" src="https://github.com/user-attachments/assets/667ff92f-7d1d-42e7-8da5-9ca8c75fec7a" />

## Target Groups:

<img width="1893" height="907" alt="Image" src="https://github.com/user-attachments/assets/4a87f756-e3ed-4dc6-ba21-e8fd244937b3" />

## ALB Provisioning:

<img width="1897" height="921" alt="Image" src="https://github.com/user-attachments/assets/1808295f-a1da-4ba9-b276-d10e0e7d8be4" />

## ALB Active:

<img width="1900" height="908" alt="Image" src="https://github.com/user-attachments/assets/0324486c-10af-4ba3-8fe3-89bb380ff705" />

## ALB Output:

<img width="1906" height="917" alt="Image" src="https://github.com/user-attachments/assets/938a345d-7e5a-40a7-a2cc-ca385c84e20e" />

## Cloud front ALB:

<img width="1912" height="908" alt="Image" src="https://github.com/user-attachments/assets/5ff50ea7-9ed1-4732-9df3-bdeaa6a06775" />

## Cloud front deploying:

<img width="1895" height="922" alt="Image" src="https://github.com/user-attachments/assets/687baa24-6985-45b4-ae54-42f5bcfb453b" />

## Cloud front Active:

<img width="1890" height="898" alt="Image" src="https://github.com/user-attachments/assets/cda2d46b-4033-4f10-a166-69fb0e0c3866" />

## Cloud front output:

<img width="1723" height="967" alt="cloudfront output image-15" src="https://github.com/user-attachments/assets/a176f83d-bb38-481e-ab90-b65373ecdbc1" />


**Uday Sairam Kommineni**

**AWS CLOUD PRACTIONER**

**Mail-id:** saikommineni5@gmail.com

**Linkedin-Url:**  https://www.linkedin.com/in/uday-sai-ram-kommineni-uday-sai-ram/












