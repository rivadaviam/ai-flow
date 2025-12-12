# Technology Stack

## Core Technologies
- **Terraform**: Primary Infrastructure as Code tool for AWS
- **AWS Services**: Lambda, API Gateway, S3, Bedrock, IAM
- **Kiro AI Assistant**: AI-powered infrastructure design and development
- **MCP (Model Context Protocol)**: Specialized AWS and Terraform integrations

## AWS Environment
- **Profile**: `default` (o usar variable AWS_PROFILE)
- **Primary Region**: `us-east-1`
- **Architecture Pattern**: Serverless + RAG (Retrieval Augmented Generation)

## MCP Servers Configuration
The workspace includes 6 specialized MCP servers:

### Infrastructure & Code Generation
- **`terraform`**: Comprehensive Terraform expert with AWS provider, Checkov security scanning, and infrastructure validation
- **`aws-diagram`**: Professional AWS architecture diagram generation using Python diagrams package DSL

### AWS Knowledge & Documentation  
- **`aws-documentation`**: Official AWS documentation search and retrieval with natural language queries

### Specialized Services
- **`aws-pricing`**: Real-time AWS pricing data, cost analysis, and infrastructure cost estimation
- **`bedrock-agentcore`**: Amazon Bedrock AgentCore platform documentation, deployment guides, and API references
- **`bedrock-kb-retrieval`**: Direct interface to Bedrock Knowledge Bases for querying, retrieval, and citation-based research

## Core Workflows

### Terraform Development
1. **Research**: Use `aws-documentation` for service requirements and best practices
2. **Generate**: Use `terraform` for infrastructure code generation and validation
3. **Secure**: Use `terraform` with integrated Checkov for security scanning
4. **Cost**: Use `aws-pricing` for cost estimation and optimization
5. **Deploy**: Use `terraform` for plan, apply, and infrastructure management

### Bedrock AgentCore Development
1. **Learn**: Use `bedrock-agentcore` for platform documentation and tutorials
2. **Deploy**: Follow AgentCore Runtime deployment guides
3. **Integrate**: Use AgentCore Memory, Code Interpreter, Browser, and Gateway services
4. **Reference**: Use `aws-documentation` for additional AWS service integration

### Knowledge Base Integration
1. **Discover**: Use `bedrock-kb-retrieval` to list and explore available Knowledge Bases
2. **Query**: Perform natural language queries against Knowledge Bases
3. **Retrieve**: Get detailed information with citations and source references
4. **Validate**: Cross-reference KB results with official AWS documentation

### Architecture Diagram Generation
1. **Design**: Use `aws-diagram` to create professional AWS architecture diagrams
2. **Visualize**: Generate sequence diagrams, flow charts, and class diagrams
3. **Document**: Create visual documentation for infrastructure and workflows
4. **Present**: Generate PNG diagrams for presentations and documentation

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