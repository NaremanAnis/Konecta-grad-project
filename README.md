## grad project
## section 1 : Infrastructure Creation using AWS platform
# step 1 : VPC creation 
- i created a VPC 
- i created two private and one public ( for NATTING)
-then i created a internet gatway  and attach my VPC to it 
- A route table is created for the public subnet i edited its routes and added a destination of 0.0.0.0/0 and added target to be my internet gateway 
- then i associated the route table with the public subnet 
- i modify Public Subnet Settings to Auto-Assign Public IPs

# step 2 : EKS cluster creation 
- i created an IAM role for cluster  to  attach it with the EKS 
-  i created an IAM role for node  to  attach it with the EKS 
- i created the eks cluster and attached both IAM roles i created ealier 
- i created an eks node group and created EC2 key pair to be used in the whole project 

# step 3 : Create a CI/CD EC2 VM
- first we lanuch an EC2 instance for jenkins 
- i added security group to allow 8080 for runnung jenkins 

# step 4 : creating s3 bucket 
-i created a S3 bucket to store backups and  deployment artifacts.

## section 2 : Infrastructure Configuration
# step 5 :
- cinnect with jenkins vm using (ssh -i your-key.pem ubuntu@public-ip
)
- install java and jenkins 
(sudo apt install -y openjdk-17-jdk & sudo apt install -y jenkins )
- Access Jenkins via (http://public-ip:8080)
