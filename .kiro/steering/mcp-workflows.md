# MCP Server Workflows - Quick Reference

## 🔧 7 MCP Servers Available

### 1. `aws-documentation` - AWS Docs Research (MANDATORY FIRST)
**Use**: Search AWS docs, get service info, check API behaviors
**Example**: "API Gateway Lambda integration event formats"

### 2. `terraform` - Infrastructure Expert  
**Use**: Generate/validate Terraform, Checkov security, deploy infrastructure
**Example**: "Execute terraform plan in terraform/environments/dev"

### 3. `cloudformation` - CloudFormation (S3 Vectors Support) ⭐ NEW
**Use**: Deploy CloudFormation templates with S3 Vectors for Knowledge Base
**Example**: "Deploy Knowledge Base with S3 Vectors via CloudFormation"

### 4. `aws-pricing` - Cost Analysis
**Use**: Get pricing data, compare regions, generate cost reports
**Example**: "Cost of Lambda 1000 requests/day"

### 5. `bedrock-agentcore` - Bedrock Platform
**Use**: AgentCore docs, deployment guides, Memory/Code Interpreter
**Example**: "Deploy agent to AgentCore Runtime"

### 6. `bedrock-kb-retrieval` - Knowledge Base Interface
**Use**: Query Knowledge Bases, get citations, filter results
**Example**: "Query KB about Lambda best practices"

### 7. `aws-diagram` - Architecture Diagrams
**Use**: Create AWS diagrams, sequence flows, visualizations
**Example**: "AWS architecture with Lambda, API Gateway, S3"

## 🔄 Core Workflows (MANDATORY ORDER)

### A. New Infrastructure: `aws-documentation` → `terraform` → `aws-pricing`
1. Research service integration patterns & event formats
2. Generate Terraform with proper syntax & Checkov security  
3. Estimate costs & optimize selection

### B. Terraform Deploy: Validate → Execute → Monitor
1. **MANDATORY**: Run `./src/scripts/utilities/validate-project-structure.sh`
2. **MANDATORY**: Use `terraform/environments/dev` directory
3. **MANDATORY**: Ensure Lambda in `src/lambda-functions/`, builds in `build/lambda-packages/`
4. Execute: `terraform` MCP init → plan → apply

### C. AWS Integration Research (MANDATORY BEFORE CODING)
```bash
# ALWAYS research first - prevents 80% of integration issues
mcp_aws_documentation search_documentation --search_phrase "API Gateway Lambda integration"
mcp_aws_documentation search_documentation --search_phrase "API Gateway v1 v2 event format differences"
```

### D. Diagrams: `aws-diagram` MCP ONLY (never manual)
1. Explore examples → List icons → Generate with proper DSL

### E. Cost Analysis: `aws-pricing` MCP discovery workflow
1. Get service codes → Get attributes → Get values → Query pricing