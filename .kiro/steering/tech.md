# Tech Stack - AI Flow Framework

## 🔧 Core Stack
- **Terraform**: Infrastructure as Code for AWS
- **AWS**: Lambda, API Gateway, S3, Bedrock, IAM  
- **Kiro AI**: AI-powered infrastructure development
- **MCP**: 6 specialized servers for AWS/Terraform integration

## 🌍 Environment
- **Profile**: `default` | **Region**: `us-east-1` | **Pattern**: Serverless + RAG

## 🚀 MCP Servers (6 Available)
1. **`terraform`** - Infrastructure expert + Checkov security
2. **`aws-documentation`** - Official AWS docs research  
3. **`aws-pricing`** - Real-time pricing + cost analysis
4. **`aws-diagram`** - Professional architecture diagrams
5. **`bedrock-agentcore`** - AgentCore platform docs
6. **`bedrock-kb-retrieval`** - Knowledge Base interface

## 📋 Workflows
- **Terraform**: `aws-documentation` → `terraform` → `aws-pricing` → deploy
- **Bedrock**: `bedrock-agentcore` → deploy → `aws-documentation` integration
- **Diagrams**: `aws-diagram` MCP ONLY (never manual)
- **Cost**: `aws-pricing` discovery workflow (codes → attributes → values → query)

## 🚨 MANDATORY Rules
### Structure (AUTO-REJECT violations)
- **Lambda**: `src/lambda-functions/` NOT `terraform/environments/dev/lambda-functions/`
- **Builds**: `build/lambda-packages/` NOT terraform directories  
- **Scripts**: `src/scripts/utilities/` NOT terraform directories

### MCP Usage (NEVER bypass)
- **Documentation-First**: `aws-documentation` MCP BEFORE any AWS integration
- **Diagrams**: `aws-diagram` MCP ONLY (never manual)
- **Infrastructure**: `terraform` MCP for all operations
- **Pricing**: `aws-pricing` MCP for cost analysis

### Pre-Operation Validation
```bash
# MANDATORY before any operation
./src/scripts/utilities/validate-project-structure.sh
```

### Documentation-First Policy (Prevents 80% of issues)
```bash
# ALWAYS disable AWS CLI pager first (prevents hanging)
export AWS_PAGER=""

# ALWAYS research integration patterns first
mcp_aws_documentation search_documentation --search_phrase "[Service A] [Service B] integration"
```