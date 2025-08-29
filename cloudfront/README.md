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

<img width="1897" height="908" alt="Image" src="https://github.com/user-attachments/assets/3631c40f-f4e0-4b21-b589-2fa53d3d7566" />

## EC2-APP-2:

<img width="1897" height="915" alt="Image" src="https://github.com/user-attachments/assets/fce5c743-c29a-4374-810a-1a24d295ef7c" />

## Nginx Command:

<img width="705" height="166" alt="Image" src="https://github.com/user-attachments/assets/14840323-22a2-4b57-a481-e5bd4e3ba35f" />

## Nginx html folder:

<img width="667" height="260" alt="Image" src="https://github.com/user-attachments/assets/d57c60db-64b0-4a9c-a6eb-d25cf25e72e7" />

## Start Nginx:

<img width="1615" height="595" alt="Image" src="https://github.com/user-attachments/assets/01b50231-0cfb-4a66-a040-32e657bc51e2" />

## EC2A output:

<img width="1903" height="932" alt="Image" src="https://github.com/user-attachments/assets/f3392aff-0937-467a-abb6-3a764a8c6964" />

## EC2B output:

<img width="1900" height="965" alt="Image" src="https://github.com/user-attachments/assets/34bbec19-e70e-43b6-b4c3-2eba0f7cbefb" />

## Target Groups:

<img width="1893" height="907" alt="Image" src="https://github.com/user-attachments/assets/94169ffc-a0d6-4744-8cb3-cdb3abd51a29" />

## ALB Provisioning:

<img width="1897" height="921" alt="Image" src="https://github.com/user-attachments/assets/5c7512e3-f158-4ab9-a6c6-441fbbaddb5b" />

## ALB Active:

<img width="1900" height="908" alt="Image" src="https://github.com/user-attachments/assets/b1c65529-edea-48dd-9cd1-fc788fc2e37e" />

## ALB Output:

<img width="1906" height="917" alt="Image" src="https://github.com/user-attachments/assets/de1e869f-576c-4da2-b4c0-2f025a32eedb" />

## Cloud front ALB:

<img width="1912" height="908" alt="Image" src="https://github.com/user-attachments/assets/2537eec3-cc22-484c-8882-1eaa791a93c6" />

## Cloud front deploying:

<img width="1895" height="922" alt="Image" src="https://github.com/user-attachments/assets/d334b7a9-111a-41b2-8925-f7dbb26e7025" />

## Cloud front Active:

<img width="1890" height="898" alt="Image" src="https://github.com/user-attachments/assets/31eec820-50df-4ec7-a11f-0851b30faa67" />

## Cloud front output:

<img width="1723" height="967" alt="Image" src="https://github.com/user-attachments/assets/98081316-0acd-455b-90d9-d5211688ecd9" />


**Uday Sairam Kommineni**

**AWS CLOUD PRACTIONER**

**Mail-id:** saikommineni5@gmail.com

**Linkedin-Url:**  https://www.linkedin.com/in/uday-sai-ram-kommineni-uday-sai-ram/












