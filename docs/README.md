# Infrastructure Context Documentation

This folder provides context for AI-assisted AWS infrastructure generation using Kiro's AI-Flow.

## Simplified Structure

```
docs/
├── README.md              # This file
├── patterns/              # Common architecture patterns
├── examples/              # Complete project examples  
├── templates/             # Reusable Terraform templates
└── projects/              # Your custom project specifications
```

## Quick Start

### 1. For New Projects
Create a specification in `projects/my-project.md` using this template:

```markdown
# My Project

## What it does
[Brief description]

## Requirements
- **Users**: ~1000/day
- **Budget**: <$100/month
- **Services**: API + Database + AI

## Architecture
- Serverless API with Lambda + API Gateway
- DynamoDB for data storage
- Bedrock for AI features

## Security
- JWT authentication
- Encryption at rest and in transit
```

### 2. Generate Infrastructure
Tell Kiro: `"Generate infrastructure for the project in docs/projects/my-project.md"`

### 3. Use Patterns
Reference existing patterns: `"Use the serverless API pattern from docs/patterns/"`

## Available Resources

### Patterns (Ready to Use)
- **Serverless API**: Lambda + API Gateway + DynamoDB
- **Data Pipeline**: S3 + Lambda + EventBridge
- **Microservices**: ECS + ALB + RDS

### Templates (Building Blocks)
- Lambda function with API Gateway
- Secure S3 bucket with lifecycle
- Bedrock Knowledge Base setup

### Examples (Complete Solutions)
- RAG API with Bedrock (~$57/month)
- E-commerce microservices (~$815/month)

## Best Practices Applied Automatically

- **Security**: Encryption, least privilege IAM, VPC isolation
- **Cost**: Right-sizing, lifecycle policies, monitoring
- **Reliability**: Multi-AZ, auto-scaling, health checks
- **Compliance**: Standard tags, logging, auditing

## Standard Tags
All resources get these tags automatically:
```hcl
Project     = "your-project-name"
Environment = "dev|staging|prod"  
ManagedBy   = "terraform"
```