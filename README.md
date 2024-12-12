# Youtube_Service_4_IAC
Infrastructure for youtube service 4. Infrastructure to incude ECS Cluster as well as all required roles. 

This ECS Cluster is configured to be ON-DEMAND

## Deployment Order for ECS Cluster
1. Connect Module
2. Roles Module
3. ECS Module
4. api_gateway Module

5. Application module to deploy to the cluster and deployed via cd.yml - set up your aplication repo workslow to kick cd.yml off

# About this Service

## ECS Cluster Key Features
### On-Demand ECS Tasks:
Configured for event-driven workloads with tasks triggered manually or by external events (e.g., AWS Lambda).
Eliminates idle costs by avoiding always-on services.
### Cost-Optimized Setup:
Fargate tasks use the minimum configuration of 0.25 vCPU and 0.5 GB memory.
Compute costs are estimated at ~$0.37/month for 4 tasks per day (each running for 15 minutes).
### No Load Balancer:
ALB and associated resources are removed to reduce fixed monthly costs (saves ~$16/month).
Suitable for workloads that don’t require traffic distribution or high availability routing.
### Infrastructure as Code:
Fully managed using Terraform for reproducible and scalable deployment.
Modular configuration supports easy updates and environment-specific customizations.
### Security:
Tasks run in a dedicated VPC with public subnets for network isolation.
Security groups restrict inbound and outbound traffic to necessary ports and protocols.
### Scalability:
Cluster can handle additional on-demand tasks without modification.
Supports dynamic scaling for larger workloads if required in the future.
### Integration with AWS Services:
Tasks can interact with S3, CloudWatch Logs, and other AWS services.
IAM roles are configured with the principle of least privilege for task execution.
### Environment Variables:
Tasks dynamically read required configuration (e.g., bucket names, keys) from environment variables.
### CloudWatch Logs:
Centralized logging for ECS tasks via CloudWatch for monitoring and troubleshooting.
Log retention is configurable to minimize storage costs.

# Cost Breakdown of Current Config
Assumes the task is ran 4 times per day 

Cost Breakdown:

CPU Cost:
CPU Cost
=
0.25
 
vCPU
×
30
 
hours/month
×
0.04048
 
$/vCPU-hour
=
0.3036
 
$/month
CPU Cost=0.25vCPU×30hours/month×0.04048$/vCPU-hour=0.3036$/month
Memory Cost:
Memory Cost
=
0.5
 
GB
×
30
 
hours/month
×
0.004445
 
$/GB-hour
=
0.066675
 
$/month
Memory Cost=0.5GB×30hours/month×0.004445$/GB-hour=0.066675$/month
Total Cost:
Total Compute Cost
=
CPU Cost
+
Memory Cost
=
0.3036
+
0.066675
=
0.37
 
$/month
Total Compute Cost=CPU Cost+Memory Cost=0.3036+0.066675=0.37$/month

# Additional Details
Configuration to add a service to "Always be on" for websites has been commented out in application/main module. If you want to create an ECS to host a website, feel free to uncomment but there will be additional cost

COnfiguration of an LB(Load Balencer) has also been added to the repo, but commented out as there is an added cost associated with using them. See module ecs/main.tf