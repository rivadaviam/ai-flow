# MCP Server Workflows

## Available MCP Servers

### 1. `aws-terraform-arch` - AWS Terraform Architecture
**Role**: AWS-focused Terraform architect and security reviewer
**Use for**:
- Generate/improve Terraform code using AWS best practices
- Validate Well-Architected principles (security, reliability, cost, operations)
- Run static analysis/security checks (e.g., Checkov)
- Suggest better resource combinations or AWS-native patterns

**Typical workflows**:
- "Propose Terraform for S3, Lambda, API Gateway, IAM for this PoC"
- "Review this Terraform module for security and least privilege"
- "Scan this Terraform for misconfigurations and suggest fixes"

### 2. `hashicorp-terraform` - Terraform Language Expert
**Role**: Terraform language and ecosystem expert
**Use for**:
- Generate syntactically correct Terraform for AWS resources
- Discover providers, resources, and modules in Terraform Registry
- Validate Terraform configuration (plan/validate)
- Structure code into modules, variables, outputs

**Typical workflows**:
- "Generate a Terraform module for an S3 bucket with versioning and SSE-S3"
- "Add variables and outputs for this existing Terraform stack"
- "Find official provider/resource syntax for Bedrock, Lambda, API Gateway"

### 3. `aws-knowledge` - AWS Design Assistant
**Role**: High-level AWS design assistant
**Use for**:
- Understand recommended patterns for AWS use cases
- Check service/feature availability in regions
- Get architecture patterns for Bedrock, S3, Lambda, API Gateway

**Typical workflows**:
- "What is the recommended way to build a Bedrock-based RAG API on AWS?"
- "Which regions support Bedrock Knowledge Bases and Lambda?"
- "What is a good reference architecture for serverless APIs + RAG?"

### 4. `aws-documentation` - Official Documentation
**Role**: Source of detailed official documentation
**Use for**:
- Retrieve official AWS documentation in markdown
- Provide links and excerpts in documentation
- Double-check API behaviors, limits, configuration options

**Typical workflows**:
- "Get documentation for S3 server-side encryption and bucket security"
- "Fetch docs for Bedrock Knowledge Bases and their IAM requirements"
- "Include 'Further reading' section with relevant AWS docs"

### 5. `bedrock-kb-retrieval` - Bedrock Knowledge Base Interface
**Role**: Interface to actual Bedrock Knowledge Bases used by PoC
**Use for**:
- Discover, inspect, and query Bedrock Knowledge Bases
- Confirm KB is properly linked to correct S3 bucket
- Run smoke tests or demo queries against PoC KB

**Typical workflows**:
- "List all Knowledge Bases and find `kiro-poc-dev-kb-main`"
- "Describe data sources and S3 locations for PoC KB"
- "Run sample question against PoC KB and show answer with sources"

### 6. `aws-diagram` - Architecture Diagram Generator
**Role**: Architecture diagram generator
**Use for**:
- Generate diagrams representing PoC infrastructure
- Create sequence diagrams for user flows
- Output diagram code for documentation embedding

**Typical workflows**:
- "Create high-level architecture diagram of Kiro PoC platform"
- "Generate sequence diagram for user query → API → Lambda → Bedrock flow"

### 7. `aws-pricing` - Cost Analysis
**Role**: Cost awareness helper
**Use for**:
- Estimate approximate costs of PoC resources
- Compare cost impact of different design choices
- Provide cost considerations for documentation

**Typical workflows**:
- "Estimate monthly cost for N requests/day to Lambda + API Gateway"
- "Compare storage cost for S3 in different regions"
- "Add 'Cost considerations' section to architecture doc"

## Core Workflow Patterns

### A. Design and Generate New Terraform Component
1. Read PoC docs and user instructions
2. Consult `aws-knowledge` for architecture clarity
3. Use `hashicorp-terraform` for initial Terraform generation
4. Use `aws-terraform-arch` to improve architecture and security
5. Refine until valid, secure, and consistent with conventions
6. Use `aws-documentation` for reference links

### B. Validate and Harden Existing Terraform
1. Use `hashicorp-terraform` to validate syntax and structure
2. Use `aws-terraform-arch` for security/compliance checks
3. Apply improvements and explain changes

### C. Document and Visualize Architecture
1. Summarize architecture in human terms
2. Use `aws-diagram` for relevant diagrams
3. Use `aws-documentation` and `aws-knowledge` for references
4. Use `aws-pricing` for cost considerations

### D. Integrate with Bedrock KB for PoC
1. Use `bedrock-kb-retrieval` to discover and verify PoC KB
2. Run sample queries to confirm functionality
3. Document upload process and example queries