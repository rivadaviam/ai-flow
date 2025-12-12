# Lessons Learned - Atenti PoC Project

## 🚨 Critical Issues and Corrections

### 1. MCP Server Usage - ALWAYS Use Available MCP Servers

#### ❌ What Went Wrong
- **Issue**: Created diagrams manually instead of using the `aws-diagram` MCP server
- **Impact**: Bypassed the established workflow and available tooling
- **Root Cause**: Did not follow the MCP-first approach defined in steering rules

#### ✅ Correct Approach
- **ALWAYS use MCP servers when available**: Check `.kiro/settings/mcp.json` for available servers
- **For diagrams**: MUST use `aws-diagram` MCP server, never create manual alternatives
- **Workflow**: 
  1. Check available MCP servers first
  2. Use appropriate MCP server for the task
  3. Only use manual approaches if MCP server is not available or fails

#### 📋 MCP Server Priority List
1. `aws-diagram` - For ALL diagram generation
2. `terraform` - For ALL infrastructure code and deployment
3. `aws-documentation` - For AWS service research
4. `aws-pricing` - For cost analysis
5. `bedrock-agentcore` - For Bedrock AgentCore documentation
6. `bedrock-kb-retrieval` - For Knowledge Base operations

### 2. Vector Store Selection - S3 Vectors vs OpenSearch Serverless

#### ❌ What Went Wrong Initially
- **Issue**: Attempted to use OpenSearch Serverless requiring manual index creation
- **Error**: `ValidationException: no such index [atenti-kb-index]`
- **Root Cause**: OpenSearch Serverless requires manual Python scripts for FAISS index creation
- **Complexity**: Terraform AWS provider doesn't support `aws_opensearchserverless_index` resource

#### ✅ Solution: S3 Vectors Pattern
- **Discovery**: S3 Vectors provides Terraform-native vector storage for Bedrock Knowledge Base
- **Benefits**: 
  - **Cost**: 60-70% cheaper than OpenSearch Serverless
  - **Simplicity**: No manual index creation scripts needed
  - **Terraform Native**: Full AWS provider support
  - **Performance**: Sub-second latency adequate for most RAG applications
- **Implementation**: Use `storage_configuration.type = "S3_VECTORS"` in Knowledge Base

#### 📋 Vector Store Selection Checklist
**When to Use S3 Vectors:**
- [ ] Cost-sensitive applications (budget <$100/month)
- [ ] Latency tolerance >100ms acceptable
- [ ] Terraform-first infrastructure approach
- [ ] Minimal operational complexity required
- [ ] RAG applications with <1M vectors

**When to Use OpenSearch Serverless:**
- [ ] Ultra-low latency required (<50ms)
- [ ] Complex search capabilities needed (hybrid search)
- [ ] Large scale applications (>1M vectors)
- [ ] Advanced filtering and analytics required
- [ ] Budget allows for $50+ monthly vector store costs

#### 🔧 S3 Vectors Implementation Pattern
```hcl
resource "aws_bedrockagent_knowledge_base" "example" {
  name     = "${var.project_name}-knowledge-base"
  role_arn = aws_iam_role.bedrock_kb_role.arn
  
  knowledge_base_configuration {
    vector_knowledge_base_configuration {
      embedding_model_arn = var.embedding_model_arn
    }
    type = "VECTOR"
  }
  
  storage_configuration {
    type = "S3_VECTORS"  # Automatic vector store creation
    # No additional configuration needed - Bedrock handles everything
  }
}
```

#### 🚨 Deprecated: OpenSearch Index Creation (Legacy)
The following approach is NO LONGER RECOMMENDED due to S3 Vectors availability:

~~OpenSearch Index Creation Checklist~~
1. ~~Create OpenSearch Serverless collection~~
2. ~~Configure security policies (encryption, network, data access)~~
3. ~~Add current user to data access policy~~
4. ~~Create index with FAISS engine and correct field mappings~~
5. ~~Verify index creation success~~
6. ~~Proceed with Knowledge Base creation~~

**Migration Path**: For existing OpenSearch implementations, evaluate migration to S3 Vectors for cost savings and operational simplicity.

### 3. API Gateway Event Format Compatibility - CRITICAL DOCUMENTATION FAILURE

#### ❌ What Went Wrong
- **Issue**: Lambda function failed to handle API Gateway v2 event format correctly
- **Error**: Function expected v1 format but received v2 format with `/dev` path prefix
- **Root Cause**: **DID NOT CONSULT AWS DOCUMENTATION** before implementing Lambda integration
- **Impact**: API endpoints returned 404 errors despite correct routing configuration

#### 🚨 Critical Failure Analysis
- **Documentation Not Consulted**: Failed to use `aws-documentation` MCP server to research API Gateway event formats
- **Assumption-Based Development**: Assumed event format without verification
- **No Format Validation**: Did not check AWS documentation for API Gateway v2 event structure
- **Missing Research Step**: Skipped the mandatory documentation research phase

#### ✅ Correct Approach - MANDATORY DOCUMENTATION RESEARCH
```bash
# STEP 1: ALWAYS research AWS service integration patterns
mcp_aws_documentation search_documentation --search_phrase "API Gateway Lambda integration event format"

# STEP 2: Read specific documentation about event structures
mcp_aws_documentation read_documentation --url "api_gateway_lambda_integration_docs"

# STEP 3: Understand differences between API Gateway v1 and v2
mcp_aws_documentation search_documentation --search_phrase "API Gateway v1 vs v2 event format differences"
```

#### 📋 API Gateway Integration Research Checklist
1. ✅ **MANDATORY**: Research API Gateway event formats via `aws-documentation` MCP
2. ✅ Understand differences between REST API (v1) and HTTP API (v2)
3. ✅ Review event structure examples in AWS documentation
4. ✅ Implement event parsing that handles both formats
5. ✅ Test with actual API Gateway events, not synthetic ones
6. ✅ Validate path handling for stage prefixes (`/dev`, `/prod`)

#### 🔍 What Documentation Would Have Revealed
- **API Gateway v2 (HTTP API)**: Uses different event structure than v1
- **Stage Prefixes**: v2 includes stage name in path (`/dev/health` vs `/health`)
- **Event Fields**: Different field names and structures between versions
- **Integration Types**: AWS_PROXY integration behaves differently in v1 vs v2

### 4. Lambda Function Deployment Issues

#### ❌ What Went Wrong
- **Issue**: Lambda ZIP file created with incorrect directory structure
- **Error**: `Runtime.ImportModuleError: Unable to import module 'index'`
- **Root Cause**: ZIP created from parent directory instead of function directory

#### ✅ Correct Approach
- **ZIP Creation**: Always create ZIP from within the Lambda function directory
- **Command**: Use `zip -r ../../function.zip .` from inside function directory
- **Structure**: Ensure `index.py` is at ZIP root level, not in subdirectory
- **Validation**: Test Lambda function after deployment

#### 📋 Lambda Deployment Checklist
1. ✅ Navigate to function directory (`lambda-functions/function_name/`)
2. ✅ Create ZIP from current directory: `zip -r ../../function.zip .`
3. ✅ Verify ZIP structure (index.py at root)
4. ✅ Deploy via Terraform or AWS CLI
5. ✅ Test function invocation
6. ✅ Check CloudWatch logs for errors

### 4. Terraform State Management

#### ❌ What Went Wrong
- **Issue**: Terraform didn't detect changes when Lambda code was updated
- **Root Cause**: File hash didn't change, so Terraform assumed no updates needed
- **Workaround**: Had to use AWS CLI to force Lambda function update

#### ✅ Correct Approach
- **Source Hash**: Use `source_code_hash` in Terraform Lambda resource
- **File Dependencies**: Ensure Terraform tracks file changes properly
- **Alternative**: Use `terraform taint` to force resource recreation
- **Best Practice**: Use CI/CD pipeline for consistent deployments

### 5. Project Structure and Organization - CRITICAL ISSUE

#### ❌ What Went Wrong
- **Issue**: Root directory cluttered with 20+ files including Terraform, scripts, artifacts
- **Impact**: Difficult navigation, unprofessional structure, hard to maintain
- **Root Cause**: No project organization standards or structure guidelines
- **Examples**: `atenti-poc-infrastructure.tf` in root, build artifacts scattered, scripts mixed with code

#### ✅ Correct Approach - Clean Project Structure
- **Terraform Organization**: ALL Terraform code in `terraform/environments/dev/` directory
- **Source Code**: Application code in `src/` directory
- **Documentation**: All docs in `docs/` with proper categorization
- **Build Artifacts**: In `build/` directory (gitignored)
- **Clean Root**: Maximum 5 files (README.md, .gitignore, LICENSE only)

#### 📋 Mandatory Project Structure
```
project-root/
├── terraform/environments/dev/    # Terraform infrastructure code
├── src/lambda-functions/          # Application source code
├── docs/                          # All documentation
├── build/                         # Build artifacts (gitignored)
└── README.md                      # Project overview only
```

#### 🚨 Structure Validation Rules
- [ ] Root directory has ≤5 files
- [ ] All Terraform code in `terraform/` directory
- [ ] Source code in `src/` directory
- [ ] Documentation in `docs/` directory
- [ ] No temporary files in root

### 6. AWS CLI Command Execution

#### ❌ What Went Wrong
- **Issue**: Commands with pipes or complex syntax failed or hung
- **Examples**: `date -d '5 minutes ago'` (macOS incompatibility), long output commands
- **Root Cause**: Platform differences and command complexity

#### ✅ Correct Approach
- **Platform Awareness**: Use macOS-compatible commands
- **Simple Commands**: Break complex commands into simpler parts
- **Output Handling**: Use `--query` and `--output` for structured results
- **Timeouts**: Set appropriate timeouts for long-running commands

## 📚 Knowledge Base for Future Projects

### MCP Server Usage Patterns

#### Always Use MCP Servers For:
- **Diagrams**: `aws-diagram` - Never create manual diagrams
- **Infrastructure**: `terraform` - All Terraform operations
- **Documentation**: `aws-documentation` - AWS service research
- **Pricing**: `aws-pricing` - Cost analysis and optimization
- **Bedrock**: `bedrock-agentcore` and `bedrock-kb-retrieval`

#### MCP Server Workflow:
1. **Check Available**: Review `.kiro/settings/mcp.json`
2. **Activate First**: Use `activate` action to understand capabilities
3. **Use Appropriate Tools**: Follow MCP server documentation
4. **Fallback Only**: Use manual approaches only if MCP fails

### AWS Service Dependencies

#### Bedrock Knowledge Base Dependencies:
1. OpenSearch Serverless collection (ACTIVE)
2. OpenSearch index with FAISS engine
3. Proper IAM roles and policies
4. Data access policies including current user
5. S3 bucket for data source

#### Lambda Function Dependencies:
1. Correct ZIP file structure
2. IAM role with appropriate permissions
3. Environment variables configured
4. VPC configuration (if needed)
5. Layer dependencies (if used)

### Terraform Best Practices

#### Resource Creation Order:
1. IAM roles and policies
2. Networking (VPC, subnets, security groups)
3. Storage (S3, DynamoDB)
4. Compute (Lambda functions)
5. AI/ML services (Bedrock, OpenSearch)
6. API Gateway and integrations

#### State Management:
- Use remote state for team collaboration
- Enable state locking
- Use workspaces for different environments
- Regular state backups

### Error Prevention Checklist

#### Before Starting:
- [ ] Review available MCP servers
- [ ] Understand service dependencies
- [ ] Check AWS service limits and quotas
- [ ] Verify IAM permissions

#### During Development:
- [ ] Use MCP servers for all applicable tasks
- [ ] Follow correct resource creation order
- [ ] Test each component before proceeding
- [ ] Monitor CloudWatch logs for errors

#### Before Deployment:
- [ ] Validate Terraform configuration
- [ ] Check resource dependencies
- [ ] Verify file structures (Lambda ZIPs)
- [ ] Test in development environment first

## 🚨 CRITICAL: Documentation-First Development Policy

### New Mandatory Process (Prevents 80% of Integration Issues):

#### BEFORE Any AWS Service Integration:
1. **MANDATORY**: Use `aws-documentation` MCP server to research service
2. **MANDATORY**: Read official AWS integration patterns and examples
3. **MANDATORY**: Understand event formats, data structures, and limitations
4. **MANDATORY**: Review service-specific best practices and gotchas

#### Documentation Research Workflow:
```bash
# Step 1: Search for integration patterns
mcp_aws_documentation search_documentation --search_phrase "[Service A] [Service B] integration"

# Step 2: Read specific integration documentation
mcp_aws_documentation read_documentation --url "integration_guide_url"

# Step 3: Get related documentation for edge cases
mcp_aws_documentation recommend --url "integration_guide_url"

# Step 4: Search for common issues and troubleshooting
mcp_aws_documentation search_documentation --search_phrase "[Service A] [Service B] common issues"
```

#### Integration Checklist (MANDATORY):
- [ ] **Documentation researched** via `aws-documentation` MCP server
- [ ] **Event formats understood** (especially for Lambda integrations)
- [ ] **Service limits and quotas** reviewed
- [ ] **Authentication and permissions** patterns documented
- [ ] **Error handling patterns** identified
- [ ] **Testing approach** defined based on AWS recommendations

## 🔄 Continuous Improvement

### Process Updates Needed:
1. **Documentation-First Policy**: MANDATORY AWS documentation research before any integration
2. **MCP-First Policy**: Always check and use MCP servers before manual approaches
3. **Dependency Mapping**: Document all service dependencies clearly
4. **Testing Strategy**: Implement component-level testing before integration
5. **Error Handling**: Better error messages and recovery procedures

### Documentation Updates:
1. Update steering rules to emphasize MANDATORY documentation research
2. Create service integration research templates
3. Document platform-specific command differences
4. Create troubleshooting guides for common issues
5. Add documentation research checkpoints to all workflows

---

**Key Takeaway**: Always follow the established MCP server workflows and document deviations for future improvement. The tooling exists for a reason - use it consistently.