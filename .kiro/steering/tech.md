# Technology Stack

## Core Technologies
- **Terraform**: Primary Infrastructure as Code tool for AWS
- **AWS Services**: Lambda, API Gateway, S3, Bedrock, IAM
- **Kiro AI Assistant**: AI-powered infrastructure design and development
- **MCP (Model Context Protocol)**: Specialized AWS and Terraform integrations

## AWS Environment
- **Profile**: `kiro-dev`
- **Primary Region**: `us-east-1`
- **Architecture Pattern**: Serverless + RAG (Retrieval Augmented Generation)

## MCP Servers Configuration
The workspace includes 7 specialized MCP servers:

### Infrastructure & Code Generation
- **`aws-terraform-arch`**: AWS-focused Terraform architect and security reviewer
- **`hashicorp-terraform`**: Terraform language and ecosystem expert

### AWS Knowledge & Documentation  
- **`aws-knowledge`**: High-level AWS design patterns and recommendations
- **`aws-documentation`**: Official AWS documentation retrieval

### Specialized Services
- **`bedrock-kb-retrieval`**: Direct interface to Bedrock Knowledge Bases
- **`aws-diagram`**: Architecture diagram generation
- **`aws-pricing`**: Cost estimation and analysis

## Core Workflows

### Terraform Development
1. **Design**: Use `aws-knowledge` for architecture patterns
2. **Generate**: Use `hashicorp-terraform` for initial code
3. **Secure**: Use `aws-terraform-arch` for security review
4. **Document**: Use `aws-documentation` for references
5. **Visualize**: Use `aws-diagram` for architecture diagrams
6. **Cost**: Use `aws-pricing` for cost analysis

### Bedrock Integration
1. **Discover**: Use `bedrock-kb-retrieval` to list knowledge bases
2. **Validate**: Test KB connectivity and data sources
3. **Query**: Run sample questions against PoC knowledge bases

## Naming Conventions
- **Resource Prefix**: `kiro-poc-dev`
- **Common Tags**: `Project`, `Env`, `Owner`, `ManagedBy`
- **Terraform Structure**: `variables.tf`, `outputs.tf`, `main.tf`, modules

## Best Practices
- Always follow AWS Well-Architected principles
- Use least privilege IAM policies
- Enable encryption and logging by default
- Validate Terraform before applying
- Document architecture decisions and cost implications