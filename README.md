**Brain Tasks App – AWS EKS Deployment with CI/CD Pipeline**

A production-ready static web application deployed on AWS EKS with an automated CI/CD pipeline using AWS CodePipeline, CodeBuild, CodeDeploy, and Kubernetes.

link : https://docs.google.com/document/d/1ZwIfa22Li657eWY-AVVI7R4jzqvODsScLAJfn7fXX_g/edit?tab=t.0

**Architecture**

GitHub Repository -> CodePipeline -> CodeBuild -> ECR -> CodeDeploy -> EKS -> LoadBalancer

**Project Structure**

<img width="191" height="208" alt="image" src="https://github.com/user-attachments/assets/b37980d0-cdad-4783-be04-4cb2bdbfaa4a" />


**1. Clone the Repository**

git clone https://github.com/Jegadeeshanp/Brain-Tasks-App.git

cd Brain-Tasks-App

<img width="940" height="233" alt="image" src="https://github.com/user-attachments/assets/04ca1d99-c3ee-457b-a9d5-e230e4418e3f" />


**2. Run App Locally (Verification)**

Install dependencies
npm install

Start app
npm start

Check
Visit → http://13.126.16.100:3000

<img width="940" height="329" alt="image" src="https://github.com/user-attachments/assets/3fc9f885-ee72-402d-9993-b35aed7c0465" />

<img width="940" height="354" alt="image" src="https://github.com/user-attachments/assets/c46f5190-7495-4e49-8925-180aaef02cbd" />


**3: Dockerize the Application**

1.	Create a Dockerfile in the project
   
<img width="456" height="34" alt="image" src="https://github.com/user-attachments/assets/d8755cfc-37cf-46cd-b9be-d00caf609fa5" />

<img width="940" height="250" alt="image" src="https://github.com/user-attachments/assets/f7687274-f2cc-4aad-a680-ba3f4e47daf1" />

2. Build the Docker image
    
docker build-t brain-tasks-app . 

3.	Run locally to verify

docker run-p 3000:3000 brain-tasks-app

<img width="940" height="354" alt="image" src="https://github.com/user-attachments/assets/34a1c956-9f43-4553-93ed-4cef0894c395" />

<img width="940" height="234" alt="image" src="https://github.com/user-attachments/assets/2e1a6d42-4212-4118-a970-cdbaffa239e7" />


**4. Push Docker Image to AWS ECR**

Create a script file to create and push Image to AWS ECR


<img width="459" height="37" alt="image" src="https://github.com/user-attachments/assets/d914cfe0-e523-4820-b277-50d4565da47b" />


<img width="940" height="485" alt="image" src="https://github.com/user-attachments/assets/6af919f2-9f02-4f2d-935c-ab5af3461532" />

 

**5. Create AWS EKS Cluster**


Create a script file 


<img width="460" height="37" alt="image" src="https://github.com/user-attachments/assets/58eb93d5-0058-4909-a67e-7b6ebca3c486" />


<img width="940" height="428" alt="image" src="https://github.com/user-attachments/assets/1b097a4a-b412-4758-b5d0-5140c6153f62" />


**6. Deploy App to EKS** 


Create a script file 

<img width="461" height="38" alt="image" src="https://github.com/user-attachments/assets/307ed672-eddf-4b22-afe5-53caa8aa4889" />


<img width="940" height="388" alt="image" src="https://github.com/user-attachments/assets/d4a91fec-3cc0-4a57-85fb-2ed8ad1e2d32" />


<img width="940" height="388" alt="image" src="https://github.com/user-attachments/assets/dec0fe02-8e45-489a-8bf8-6377bf6e5aca" />


<img width="940" height="285" alt="image" src="https://github.com/user-attachments/assets/d7bf69d1-0517-4026-8bad-501612b041c9" />




**Load Balance & S3**


Load Balance : https://ap-south-1.console.aws.amazon.com/ec2/home?region=ap-south-1#LoadBalancer:loadBalancerArn=a28d4204a69ab4cb8b0fd0d469d12476;tab=listeners


App check with Load Balance: http://a28d4204a69ab4cb8b0fd0d469d12476-826637987.ap-south-1.elb.amazonaws.com/


S3 Bucket : https://ap-south-1.console.aws.amazon.com/s3/buckets/brain-tasks-artifacts-project?region=ap-south-1&tab=objects



**7. Create Kubernetes manifests (deploy + service)**


<img width="940" height="606" alt="image" src="https://github.com/user-attachments/assets/5addb9fc-2eb2-491b-be1a-07139ab0bf84" />


<img width="940" height="628" alt="image" src="https://github.com/user-attachments/assets/18e2ebcf-fbda-4044-b7ba-ecdf4513d1ff" />



**8. CI/CD & Monitoring**

CodeBuild : Success

Guvi-Project1-CodeBuild-Succes-Logs : https://github.com/Jegadeeshanp/Brain-Tasks-App/blob/main/Guvi-Project1-CodeBuild-Succes-Logs.txt

<img width="940" height="330" alt="image" src="https://github.com/user-attachments/assets/8a38f08a-497b-4eb1-a184-82eb360f40a7" />
<img width="940" height="470" alt="image" src="https://github.com/user-attachments/assets/7e396112-e459-4bb1-b583-fe4bab9c85ff" />
<img width="940" height="395" alt="image" src="https://github.com/user-attachments/assets/ec0ebfd3-7bd1-470c-9905-66328f63e37b" />
<img width="940" height="413" alt="image" src="https://github.com/user-attachments/assets/1ec78d6a-6d8f-42f1-8ba7-110ac0345423" />
<img width="940" height="413" alt="image" src="https://github.com/user-attachments/assets/66afe758-8b44-498c-b4a9-99ad03fc423a" />
<img width="940" height="415" alt="image" src="https://github.com/user-attachments/assets/d63ec642-d158-433f-92e2-0dd90281a974" />
<img width="940" height="416" alt="image" src="https://github.com/user-attachments/assets/b3c10db6-3a13-4e07-bec9-cc0707432f24" />
<img width="940" height="422" alt="image" src="https://github.com/user-attachments/assets/3557e734-5519-4d0b-94ef-311adc627ee2" />
<img width="940" height="414" alt="image" src="https://github.com/user-attachments/assets/ef2ba525-a6c5-4724-92ad-afb22d8b47d8" />

App Logs:
<img width="940" height="358" alt="image" src="https://github.com/user-attachments/assets/7346d9bc-d3c5-42ab-8c86-ac25346f88f3" />









