# MCP Server Workflows

## Available MCP Servers

### 1. `aws-documentation` - Official AWS Documentation
**Role**: Source of detailed official AWS documentation
**Use for**:
- Retrieve official AWS documentation in markdown format
- Search AWS documentation with natural language queries
- Get comprehensive service information and API references
- Double-check API behaviors, limits, configuration options

**Typical workflows**:
- "Get documentation for S3 server-side encryption and bucket security"
- "Search for Bedrock Knowledge Bases IAM requirements"
- "Find Lambda function configuration best practices"

### 2. `terraform` - Infrastructure as Code Expert
**Role**: Comprehensive Terraform and AWS infrastructure expert
**Use for**:
- Generate syntactically correct Terraform for AWS resources
- Validate Terraform configuration (init, plan, validate, apply)
- Run security analysis with Checkov integration
- Search AWS provider documentation and modules
- Structure code into modules, variables, outputs

**Typical workflows**:
- "Generate a Terraform module for S3 bucket with versioning and encryption"
- "Validate this Terraform configuration and run security checks"
- "Find AWS provider syntax for Bedrock, Lambda, API Gateway resources"
- "Execute terraform plan and show me the changes"

### 3. `aws-pricing` - Cost Analysis & Planning
**Role**: Real-time AWS pricing information and cost analysis
**Use for**:
- Get current AWS pricing data with advanced filtering
- Compare pricing across different AWS regions
- Estimate costs for infrastructure components
- Generate detailed cost analysis reports
- Analyze CDK and Terraform projects for cost implications

**Typical workflows**:
- "What's the cost of running Lambda with 1000 requests/day?"
- "Compare S3 storage costs between us-east-1 and eu-west-1"
- "Generate a cost report for this Terraform configuration"
- "Find the cheapest EC2 instances with at least 8GB RAM"

### 4. `bedrock-agentcore` - Bedrock AgentCore Platform
**Role**: Amazon Bedrock AgentCore documentation and deployment guide
**Use for**:
- Search comprehensive AgentCore documentation
- Get deployment guides for AgentCore Runtime
- Learn about AgentCore Memory, Code Interpreter, Browser tools
- Understand AgentCore Gateway and Identity management
- Access API references and tutorials

**Typical workflows**:
- "How do I deploy an agent to AgentCore Runtime?"
- "Show me AgentCore Memory integration examples"
- "What are the steps to set up AgentCore Gateway?"
- "Find documentation about AgentCore Code Interpreter security"

### 5. `bedrock-kb-retrieval` - Bedrock Knowledge Base Interface
**Role**: Direct interface to Amazon Bedrock Knowledge Bases for querying and retrieval
**Use for**:
- Discover and explore available Bedrock Knowledge Bases
- Query Knowledge Bases with natural language
- Retrieve information with citations and source references
- Filter results by specific data sources
- Use reranking capabilities for improved relevance

**Typical workflows**:
- "List all available Knowledge Bases and their data sources"
- "Query the knowledge base about AWS Lambda best practices"
- "Find information about S3 security from the KB with citations"
- "Search the knowledge base for Terraform examples and show sources"

### 6. `aws-diagram` - AWS Architecture Diagram Generation
**Role**: Professional diagram generation using Python diagrams package DSL
**Use for**:
- Create AWS architecture diagrams with proper icons and connections
- Generate sequence diagrams for process flows
- Build flow charts and decision trees
- Create class diagrams for object relationships
- Visualize Kubernetes and on-premises architectures
- Generate custom diagrams with styling and clustering

**Typical workflows**:
- "Create an AWS architecture diagram showing Lambda, API Gateway, and S3"
- "Generate a sequence diagram for user authentication flow"
- "Build a flow chart showing the CI/CD pipeline process"
- "Create a diagram of the Terraform module structure"
- "Visualize the Bedrock AgentCore architecture with all components"

## Core Workflow Patterns

### A. Design and Generate New Terraform Infrastructure
1. Use `aws-documentation` to research AWS service requirements and best practices
2. Use `terraform` to generate initial Terraform configuration with proper syntax
3. Use `terraform` to validate configuration and run security checks with Checkov
4. Use `aws-pricing` to estimate costs and optimize resource selection
5. Refine until valid, secure, and cost-effective

### B. Deploy and Manage Terraform Infrastructure
1. Use `terraform` to execute init, plan, and validate commands
2. Review plan output for security and cost implications
3. Use `terraform` to apply changes with proper validation
4. Use `aws-documentation` for troubleshooting and configuration references

### C. Cost Analysis and Optimization
1. Use `aws-pricing` to get real-time pricing for AWS services
2. Compare costs across regions and instance types
3. Generate detailed cost reports with usage scenarios
4. Use `terraform` to analyze existing infrastructure for cost optimization

### D. Bedrock AgentCore Development
1. Use `bedrock-agentcore` to search documentation and tutorials
2. Follow deployment guides for AgentCore Runtime setup
3. Integrate AgentCore Memory, Code Interpreter, and other services
4. Use `aws-documentation` for additional AWS service integration

### E. Knowledge Base Query and Retrieval
1. Use `bedrock-kb-retrieval` to discover available Knowledge Bases
2. Query Knowledge Bases with natural language for specific information
3. Retrieve detailed information with proper citations and source references
4. Filter and rerank results for improved relevance and accuracy

### F. Architecture Diagram Creation and Documentation
1. Use `aws-diagram` to explore available diagram examples and icon libraries
2. Design architecture diagrams using Python diagrams package DSL syntax
3. Generate professional PNG diagrams with proper AWS service icons
4. Create sequence diagrams for process flows and user interactions
5. Build flow charts for decision trees and workflow documentation
6. Use clustering and styling for organized, readable diagrams